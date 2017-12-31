#' Get spatial data frame of Indonesia or Jakarta map
#'
#' @md
#' @param region `jakarta` or `indonesia`
#' @param level `kelurahan`, `rw` and `kecamatan` for `jakarta` region (`default` is `kelurahan`).
#' `kota` or `provinsi` for `indonesia` region (`default` is `provinsi`).
#' @param folder read map folder
#'
#' @export
#' @examples
#' \dontrun{
#' id_map("indonesia", "kota")
#' id_map("jakarta", "rw")
#' }
id_map <- function (region = "jakarta",
                    level = "default",
                    folder = system.file("data", "spatial", package = "nusantr")) {

  if (region == "jakarta") {
    if (level == "rw" | level == 5) {
      reg <- readRDS(sprintf("%s/%s", folder, "jakarta_rw.rds"))
    }
    else if (level == "default" | level == "kelurahan" | level == 4) {
      reg <- readRDS(sprintf("%s/%s", folder, "jakarta_kelurahan.rds"))
    }
    else if (level == "kecamatan" | level == 3) {
      reg <- readRDS(sprintf("%s/%s", folder, "jakarta_kecamatan.rds"))
    } else {
      stop("Error : for Jakarta region, level should be 'kecamatan', 'kelurahan' or 'rw'")
    }
  }

  else if (region == "indonesia") {
    if (!file.exists(sprintf("%s/%s", folder, "indonesia_kota.rds"))) {
      if (menu(c("Yes", "No"), title = "Do you want to download the map?") == 1) {
        map_download()
        map_convert()
      } else {
        stop("The map should be downloaded first")
      }
    }

    if (level == "kota" | level == 2) {
      reg <- readRDS(sprintf("%s/%s", folder, "indonesia_kota.rds"))
    }
    else if (level == "default" | level == "provinsi" | level == 1) {
      reg <- readRDS(sprintf("%s/%s", folder, "indonesia_provinsi.rds"))
    } else {
      stop("Error: for Indonesia region, level should be 'provinsi' or 'kota'")
    }
  }

  return(reg)

}

