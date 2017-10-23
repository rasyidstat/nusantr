#' Get spatial data frame of Indonesia or Jakarta map
#'
#' @md
#' @param region `jakarta` or `indonesia`
#' @param level `kelurahan`, `rw` and `kecamatan` for `jakarta` region (`default` is `kelurahan`).
#' `kota` or `provinsi` for `indonesia` region (`default` is `provinsi`).
#'
#' @export
#' @examples
#' id_map("indonesia", "kota")
#' id_map("jakarta", "rw")
id_map <- function (region = "jakarta",
                    level = "default") {

  if (region == "jakarta") {
    if (level == "rw" | level == 5) {
      reg <- readRDS(system.file("data", "spatial",
                                 "jakarta_rw.rds", package = "indonesia"))
    }
    else if (level == "default" | level == "kelurahan" | level == 4) {
      reg <- readRDS(system.file("data", "spatial",
                                 "jakarta_kelurahan.rds", package = "indonesia"))
    }
    else if (level == "kecamatan" | level == 3) {
      reg <- readRDS(system.file("data", "spatial",
                                 "jakarta_kecamatan.rds", package = "indonesia"))
    } else {
      stop("Error : for Jakarta region, level should be 'kecamatan', 'kelurahan' or 'rw'")
    }
  }

  else if (region == "indonesia") {
    if (level == "kota" | level == 2) {
      reg <- readRDS(system.file("data", "spatial",
                                 "indonesia_kota.rds", package = "indonesia"))
    }
    else if (level == "default" | level == "provinsi" | level == 1) {
      reg <- readRDS(system.file("data", "spatial",
                                 "indonesia_provinsi.rds", package = "indonesia"))
    } else {
      stop("Error: for Indonesia region, level should be 'provinsi' or 'kota'")
    }
  }

  return(reg)

}

