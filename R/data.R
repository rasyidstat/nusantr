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

#' Transjakarta halte data
#'
#' Lists of Transjakarta halte with latitude and longitude (as per 7 November 2019)
#'
#' @docType data
#'
#' @md
#' @format A tibble containing lists of Transjakarta halte with 6 variables:
#' \describe{
#'   \item{halte_id}{Halte ID}
#'   \item{halte_name}{Name of the halte}
#'   \item{latitude}{Latitude}
#'   \item{longitude}{Longitude}
#'   \item{corridor_cnt}{Number of corridors pass through the halte}
#'   \item{schedule_id}{Lists of schedule ID / corridors pass through the halte (nested),
#'   used to be joined with `schedule_id` on `transjakarta_route` dataset}
#' }
#'
#' @source \href{https://www.trafi.com/id/jakarta/transjakarta}{https://www.trafi.com/id/jakarta/transjakarta}
#'
"transjakarta"

#' Transjakarta route data
#'
#' Lists of Transjakarta route with geometry (as per 7 November 2019)
#'
#' @docType data
#'
#' @md
#' @format A tibble and sf data frame containing lists of Transjakarta route with 11 variables:
#' \describe{
#'   \item{transport_id}{Two types of transport ID: night bus or usual bus}
#'   \item{schedule_id}{Schedule ID which refers to corridor}
#'   \item{corridor_id}{Short name of the corridor}
#'   \item{corridor_name}{Name of the corridor}
#'   \item{corridor_color}{Color of the corridor}
#'   \item{route_id}{Specific route under corridor}
#'   \item{route_name}{Name of the route under the corridor}
#'   \item{direction}{1 for normal direction, 2 for reverse direction}
#'   \item{validity}{Validity of the corridor}
#'   \item{is_main}{Main corridor route or not}
#'   \item{is_main_reverse}{Main corridor reverse route or not}
#'   \item{geometry}{Route polyline geometry}
#' }
#'
#' @source \href{https://www.trafi.com/id/jakarta/transjakarta}{https://www.trafi.com/id/jakarta/transjakarta}
#'
"transjakarta_route"

#' Indonesian stop words data
#'
#' Lists of Indonesian stop words
#'
#' @docType data
#'
#' @md
#' @format A tibble containing lists of Indonesian stop words
#'
"kata_setop"

#' KRL station data
#'
#' Lists of KRL station with latitude and longitude
#'
#' @docType data
#'
#' @md
#' @format A tibble containing lists of KRL station
#'
"krl"

#' KRL route data
#'
#' Lists of KRL route with geometry
#'
#' @docType data
#'
#' @md
#' @format A tibble containing lists of KRL route
#'
"krl_route"

#' KRL price data
#'
#' Lists of KRL route price
#'
#' @docType data
#'
#' @md
#' @format A tibble containing lists of KRL price
#'
"krl_price"
