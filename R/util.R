#' Parse birthdate, geolevel (city/regency/province) from NIK
#'
#' @name nik_to_all
#' @description
#' NIK (*Nomor Induk Kependudukan*) is a unique ID for Indonesia citizens
#' ([https://en.wikipedia.org/wiki/Indonesian_identity_card]([https://en.wikipedia.org/wiki/Indonesian_identity_card])).
#' NIK contains geographic location where the ID card is built and the birthdate of the holder.
#'
#' @md
#' @param nik NIK (KTP ID)
#'
#' @return \code{nik_to_bd} returns a Date vector.
#' \code{nik_to_city} and \code{nik_to_prov} return a character vector.
#' \code{nik_to_all} returns a list of those three functions output.
#'
#' @examples
#' nik <- "1671065412990099"
#' nik_to_bd(nik)
#' nik_to_city(nik)
#' nik_to_prov(nik)
#' nik_to_all(nik)
#'
#' # using nik_to_all
#' df <- data.frame(nik = rep("1671065412990099"), 5)
#' df %>%
#'   mutate(out = map(nik, nik_to_all),
#'          out = map(out, data.frame)) %>%
#'   unnest()
#'
#' # not using nik_to_all
#' df %>%
#'   mutate(bd = nik_to_bd(nik),
#'          city = nik_to_bd(city),
#'          prov = nik_to_bd(prov))
NULL

#' @rdname nik_to_all
#' @export
nik_to_all <- function (nik) {
  x <- list(bd = nik_to_bd(nik),
            city = nik_to_city(nik),
            prov = nik_to_prov(nik))
  x
}

#' @rdname nik_to_all
#' @export
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

#' @rdname nik_to_all
#' @export
nik_to_city <- function (nik) {
  x <- substr(nik, 1, 4)
  x <- with(kota, kota[match(x, id)])
  x
}

#' @rdname nik_to_all
#' @export
nik_to_prov <- function (nik) {
  x <- substr(nik, 1, 2)
  x <- with(provinsi, provinsi[match(x, id)])
  x
}
