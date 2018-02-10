#' Translate day/month name (Indonesia <-> English)
#'
#' @name id_to_en
#'
#' @md
#' @param x character input
#'
#' @examples
#' x <- "1 Januari 2020"
#' y <- id_to_en(x)
#' y
#' en_to_id(y)
NULL

#' @rdname id_to_en
#' @export
id_to_en <- function(x) {
  x <- gsub("Senin", "Monday", x)
  x <- gsub("Selasa", "Tuesday", x)
  x <- gsub("Rabu", "Wednesday", x)
  x <- gsub("Kamis", "Thursday", x)
  x <- gsub("Jum'at|Jumat", "Friday", x)
  x <- gsub("Sabtu", "Saturday", x)
  x <- gsub("Minggu", "Sunday", x)
  x <- gsub("Januari", "January", x)
  x <- gsub("Februari|Pebruari", "February", x)
  x <- gsub("Maret", "March", x)
  x <- gsub("Mei", "May", x)
  x <- gsub("Juni", "June", x)
  x <- gsub("Juli", "July", x)
  x <- gsub("Agustus", "August", x)
  x <- gsub("Desember", "December", x)
  x
}

#' @rdname id_to_en
#' @export
en_to_id <- function(x) {
  x <- gsub("Monday", "Senin", x)
  x <- gsub("Tuesday", "Selasa", x)
  x <- gsub("Wednesday", "Rabu", x)
  x <- gsub("Thursday", "Kamis", x)
  x <- gsub("Friday", "Jumat", x)
  x <- gsub("Saturday", "Sabtu", x)
  x <- gsub("Sunday", "Minggu", x)
  x <- gsub("January", "Januari", x)
  x <- gsub("February", "Februari", x)
  x <- gsub("March", "Maret", x)
  x <- gsub("May", "Mei", x)
  x <- gsub("June", "Juni", x)
  x <- gsub("July", "Juli", x)
  x <- gsub("August", "Agustus", x)
  x <- gsub("December", "Desember", x)
  x
}
