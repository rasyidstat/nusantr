#' @importFrom tibble tibble
NULL

#' Indonesia province data
#'
#' Lists of Indonesia provinces with the ID.
#'
#' @docType data
#'
#' @format A tibble containing name and ID of 34 provinces in Indonesia:
#' \describe{
#'   \item{provinsi_id}{Provinsi ID}
#'   \item{provinsi}{Provinsi name in uppercase}
#'   \item{provinsi2}{Provinsi name in lettercase}
#'   \item{provinsi_short}{Short name of provinsi}
#'   \item{provinsi_abb}{Abbreviate name of provinsi}
#'   \item{X}{Tile grid map of provinsi, X position}
#'   \item{Y}{Tile grid map of provinsi, Y position}
#' }
#'
#' @references \href{http://mfdonline.bps.go.id/}{http://mfdonline.bps.go.id/}
#'
#' @source \href{https://github.com/edwardsamuel/Wilayah-Administratif-Indonesia/blob/master/csv/provinces.csv}{https://github.com/edwardsamuel/Wilayah-Administratif-Indonesia/blob/master/csv/provinces.csv}
#'
"provinsi"

#' Indonesia city and regency data
#'
#' Lists of Indonesia cities and regencies with the ID.
#'
#' @docType data
#'
#' @format A tibble containing name and ID of 514 cities/regencies in Indonesia:
#' \describe{
#'   \item{kota_id}{Kota ID}
#'   \item{kota}{Kota name in uppercase}
#'   \item{kota2}{Kota name in lettercase}
#'   \item{kota3}{Kota name in lettercase without "Kota" and "Kabupaten"}
#'   \item{type}{Type of geolevel2, "Kota" or "Kabupaten"}
#' }
#'
#' @references \href{http://mfdonline.bps.go.id/}{http://mfdonline.bps.go.id/}
#'
#' @source \href{https://github.com/edwardsamuel/Wilayah-Administratif-Indonesia/blob/master/csv/regencies.csv}{https://github.com/edwardsamuel/Wilayah-Administratif-Indonesia/blob/master/csv/regencies.csv}
#'
"kota"

#' Popular name in Jakarta
#'
#' Lists of popular name in Jakarta with number of occurence more than 50.
#' The name only contains voters of Pilkada DKI Jakarta phase 2 year 2017.
#'
#' @docType data
#'
#' @md
#' @format A tibble containing popular name in Jakarta with 9,083 rows and 3 columns: `nama`, `jenis_kelamin` and `n`.
#' `nama` is the name, `jenis_kelamin` is the gender ("L" for male, "P" for female) and `n` is the number of occurence.
#'
#' @source \href{https://pilkada2017.kpu.go.id}{https://pilkada2017.kpu.go.id}
#'
"nama"
