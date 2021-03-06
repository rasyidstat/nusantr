% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{transjakarta_route}
\alias{transjakarta_route}
\title{Transjakarta route data}
\format{A tibble and sf data frame containing lists of Transjakarta route with 11 variables:
\describe{
\item{transport_id}{Two types of transport ID: night bus or usual bus}
\item{schedule_id}{Schedule ID which refers to corridor}
\item{corridor_id}{Short name of the corridor}
\item{corridor_name}{Name of the corridor}
\item{corridor_color}{Color of the corridor}
\item{route_id}{Specific route under corridor}
\item{route_name}{Name of the route under the corridor}
\item{direction}{1 for normal direction, 2 for reverse direction}
\item{validity}{Validity of the corridor}
\item{is_main}{Main corridor route or not}
\item{is_main_reverse}{Main corridor reverse route or not}
\item{geometry}{Route polyline geometry}
}}
\source{
\href{https://www.trafi.com/id/jakarta/transjakarta}{https://www.trafi.com/id/jakarta/transjakarta}
}
\usage{
transjakarta_route
}
\description{
Lists of Transjakarta route with geometry (as per 7 November 2019)
}
\keyword{datasets}
