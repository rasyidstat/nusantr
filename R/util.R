#' Get birth date based on NIK
#'
#' @description
#' NIK (*Nomor Induk Kependudukan*) is a unique ID for Indonesia citizens
#' ([https://en.wikipedia.org/wiki/Indonesian_identity_card]([https://en.wikipedia.org/wiki/Indonesian_identity_card])).
#' NIK contains geographic location where the ID card is built and the birth date of the citizen.
#'
#' @md
#' @param nik NIK (KTP ID)
#'
#' @export
#' @examples
#' nik_to_bd(1671065412990099)
#' #> [1] "1999-12-14"
nik_to_bd <- function (nik) {
  x <- substr(nik, 7, 12)

  # change prefix
  pfx <- as.integer(substr(x, 1, 2))
  x[pfx > 31L & !is.na(pfx)] <- as.integer(x[pfx > 31L & !is.na(pfx)]) - 400000L

  # change suffix
  sfx <- substr(x, 5, 6)
  yr <- format(Sys.Date(), "%y")
  x <- paste0(substr(x, 1, 4), 19, sfx)
  x[sfx < yr] <- paste0(substr(x[sfx < yr], 1, 4), 20, sfx[sfx < yr])

  # parse
  x <- as.Date(x, "%d%m%Y")

  # warning
  failed <- length(x[is.na(x)])
  if (failed > 0L) {
    if (failed == 1L) {
      warning(paste0(nik[is.na(x)], " is failed to parse"))
    }
    else if (failed <= 4L) {
      warning(paste0(paste(nik[is.na(x)], collapse=", "), " are failed to parse"))
    } else {
      warning(paste0(paste(nik[is.na(x)][1:4], collapse=", "), " and ",
                     length(nik[is.na(x)][-c(1:4)]), " others are failed to parse"))
    }
  }

  x
}
