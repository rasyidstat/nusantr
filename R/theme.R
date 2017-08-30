#' Clean ggplot2 theme for geom_sf spatial visualization
#'
#' @md
#' @param legend.inside `TRUE`
#' @param base_family `DIN` font
#'
#' @export
theme_spatial <- function (legend.inside = TRUE, base_family = "DIN") {
  ret <- ggplot2::theme(line =               element_blank(),
                        rect =               element_blank(),
                        axis.text =          element_blank(),
                        axis.ticks.length =  unit(0, "cm"),
                        axis.ticks.length =  unit(0, "cm"),
                        legend.justification=c(0, 0),
                        legend.position =    "bottom",
                        legend.text =        element_text(family=base_family),
                        legend.title =       element_text(family=base_family),
                        panel.spacing =      unit(0, "lines"),
                        plot.margin =        unit(c(0, 0, 0, 0), "lines"),
                        complete =           TRUE)
  if (legend.inside == TRUE) {
    ret <- ret + ggplot2::theme(legend.justification = c(0,0),
                                legend.position = c(0,0),
                                legend.direction = "horizontal")
  }
  ret
}
