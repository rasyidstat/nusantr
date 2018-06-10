#' Get Indonesia map from GADM
#'
#' @name map_download
#' @md
#' @description
#' Download and get Indonesia map from
#' [http://biogeo.ucdavis.edu/data/gadm2.8/shp/IDN_adm_shp.zip]([http://biogeo.ucdavis.edu/data/gadm2.8/shp/IDN_adm_shp.zip])
#' and convert them to spatial data frame (sf).
#'
#' @md
#' @param folder download folder location
#' @param filename name of the file (zip)
#' @param url url location of the file
#' @param output output location
#'
#' @export
NULL

#' @rdname map_download
#' @export
map_download <- function(folder = paste0(system.file("data", package = "nusantr"), "/raw"),
                         filename = "file.zip",
                         url = "http://biogeo.ucdavis.edu/data/gadm2.8/shp/IDN_adm_shp.zip") {

  # download zip file if not exist
  if (!file.exists(sprintf("%s/%s", folder, filename))) {
    if (!file.exists(folder)) {
      dir.create(folder)
    }
    download.file(url, sprintf("%s/%s", folder, filename))
  } else {
    message("File is already downloaded")
  }

}

#' @rdname map_download
#' @export
map_convert <- function(folder = paste0(system.file("data", package = "nusantr"), "/raw"),
                        filename = "file.zip",
                        output = system.file("data/spatial", package = "nusantr"))

{

  # load necessary libs
  require("sf", quietly = TRUE)
  require("tibble", quietly = TRUE)
  require("dplyr", quietly = TRUE)

  # unzip the file
  message("Unzipping the file")
  unzip(sprintf("%s/%s", folder, filename), exdir = folder)

  # provinsi
  message("Processing provinsi spatial data")
  adm1 <- sf::read_sf(sprintf("%s/%s", folder, "IDN_adm1.shp"))
  adm1 <- as.tibble(adm1) %>%
    st_as_sf() %>%
    select(NAME_1) %>%
    transmute(provinsi = recode(NAME_1,
                                `Bangka-Belitung`="Kepulauan Bangka Belitung",
                                `Irian Jaya Barat`="Papua Barat",
                                `Jakarta Raya`="DKI Jakarta",
                                `Yogyakarta`="DI Yogyakarta")) %>%
    inner_join(select(provinsi, provinsi_id, provinsi2), by=c("provinsi"="provinsi2")) %>%
    select(provinsi_id, provinsi) %>%
    arrange(provinsi_id)

  saveRDS(adm1, sprintf("%s/%s", output, "indonesia_provinsi.rds"))
  rm(adm1)

  # kota
  message("Processing kota spatial data")
  adm2 <- read_sf(sprintf("%s/%s", folder, "IDN_adm2.shp"))
  adm2 <- as.tibble(adm2) %>%
    st_as_sf() %>%
    select(NAME_1, NAME_2, HASC_2, TYPE_2, HASC_2) %>%
    mutate(provinsi = recode(NAME_1,
                             `Bangka-Belitung`="Kepulauan Bangka Belitung",
                             `Irian Jaya Barat`="Papua Barat",
                             `Jakarta Raya`="DKI Jakarta",
                             `Yogyakarta`="DI Yogyakarta"),
           kota = gsub("Kabupaten |Kota ", "", NAME_2),
           type = ifelse(TYPE_2 %in% c("Kotamadya", "City"), "Kota", TYPE_2),
           kota = paste(type, trimws(kota)),
           kota = recode(kota,
                         `Kabupaten Fak-Fak`="Kabupaten Fakfak",
                         `Kota Sorong Selatan`="Kabupaten Sorong Selatan",
                         `Kabupaten Admin. Kepulauan Seribu`="Kabupaten Kepulauan Seribu",
                         `Kabupaten Banyumas`="Kabupaten Purwokerto",
                         `Kota Jember`="Kabupaten Jember",
                         `Kabupaten Pontianak`="Kota Pontianak",
                         `Kabupaten Baru`="Kabupaten Kotabaru",
                         `Kabupaten Pasir`="Kabupaten Paser",
                         `Kabupaten Bulongan`="Kabupaten Bulungan",
                         `Kabupaten Kepulauan Riau`="Kabupaten Kepulauan Anambas",
                         `Kota Lingga`="Kabupaten Lingga",
                         `Kabupaten Halmahera Tengah\r\nHalmahera Tengah`="Kabupaten Halmahera Tengah",
                         `Kabupaten Tidore Kepulauan`="Kota Tidore Kepulauan",
                         `Kabupaten Ambon`="Kota Ambon",
                         `Kabupaten Yapen Waropen`="Kabupaten Kepulauan Yapen",
                         `Kota Pekan Baru`="Kota Pekanbaru",
                         `Kabupaten Polewali Mamasa`="Kabupaten Polewali Mandar",
                         `Kabupaten Pangkajene Kepulauan`="Kabupaten Pangkajene Dan Kepulauan",
                         `Kota Pare-Pare`="Kota Parepare",
                         `Kabupaten Selayar`="Kabupaten Kepulauan Selayar",
                         `Kabupaten Tojo Una-Una`="Kabupaten Tojo Una-una",
                         `Kabupaten Toli-Toli`="Kabupaten Toli-toli",
                         `Kota Konawe Selatan`="Kabupaten Konawe Selatan",
                         `Kabupaten Kepulauan Sangihe Talaud`="Kabupaten Kepulauan Sangihe",
                         `Kabupaten Sangihe Talaud`="Kabupaten Kepulauan Talaud",
                         `Kabupaten Tomohon`="Kota Tomohon",
                         `Kabupaten Lima Puluh Koto`="Kabupaten Lima Puluh Kota",
                         `Kabupaten Sawahlunto`="Kota Sawah Lunto",
                         `Kabupaten Banyuasin`="Kabupaten Banyu Asin",
                         `Kabupaten Musi Banyu Asin`="Kabupaten Musi Banyuasin",
                         `Kabupaten Pagar Alam`="Kota Pagar Alam",
                         `Kota Padang Sidempuan`="Kota Padangsidimpuan",
                         `Kota Lubuk Linggau`="Kota Lubuklinggau",
                         `Kabupaten Purwokerto`="Kabupaten Banyumas")) %>%
    filter(type %in% c("Kota", "Kabupaten")) %>%
    mutate(kota = recode(kota, `Kabupaten Purwokerto`="Kabupaten Banyumas")) %>%
    select(-type, -NAME_1, -TYPE_2) %>%
    inner_join(select(provinsi, provinsi_id, provinsi2), by=c("provinsi"="provinsi2")) %>%
    inner_join(select(kota, kota_id, kota2, kota3), by=c("kota"="kota2")) %>%
    select(provinsi_id, provinsi, kota_id, kota=kota3, abb=HASC_2) %>%
    arrange(provinsi_id, kota_id)

  saveRDS(adm2, sprintf("%s/%s", output, "indonesia_kota.rds"))
  rm(adm2)

  invisible(file.remove(grep(list.files(path = folder, full.names = TRUE),
                        pattern = '*.zip', inv = TRUE, value = TRUE)))

}
