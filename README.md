# nusantr

This package includes things related to Indonesia. For the initial development, this package includes sf spatial data frame for:

- Indonesia: 'provinsi' and 'kota' level
- Jakarta: 'kecamatan', 'kelurahan' and 'RW' level

For Indonesia map, the data is get from [GADM](http://www.gadm.org/) and for Jakarta map, 
the data is get from [Jakarta Smart City](http://smartcity.jakarta.go.id).

# Installation

You need to use `sf` package to enable the class of sf data frame. Also, you need to install `ggplot2` development version 
to use `geom_sf` functionality (for visualization purpose).

``` r
# install.packages("devtools")
install.packages("sf")
devtools::install_github("tidyverse/ggplot2")
devtools::install_github("rasyidstat/nusantr")
```

# Example

``` r
library(nusantr)
hai()
#> [1] "Selamat Datang di Indonesia!"
```

`id_map` is the function that return sf spatial data frame. It contains two parameters: region and level. 
For the initial development, it only contains two regions: "indonesia" and "jakarta".

- "indonesia" consists of two geographical levels such as "provinsi" and "kota".
- "jakarta" consists of three geographical levels such as "kecamatan", "kelurahan" and "rw".

``` r
library(sf)
library(nusantr)

# get indonesia map for 'provinsi' level
indonesia_provinsi <- id_map("indonesia", "provinsi")

# get indonesia map for 'kota' level
indonesia_kota <- id_map("indonesia", "kota")

# get jakarta map for 'kelurahan' level
jakarta_kelurahan <- id_map("jakarta", "kelurahan")

head(jakarta_kelurahan)
#> Simple feature collection with 6 features and 8 fields
geometry type:  POLYGON
dimension:      XY
bbox:           xmin: 106.7928 ymin: -6.373226 xmax: 106.92 ymax: -6.331914
epsg (SRID):    4326
proj4string:    +proj=longlat +datum=WGS84 +no_defs
  kode_provinsi                 nama_provinsi kode_kota       nama_kota kode_kecamatan nama_kecamatan kode_kelurahan  nama_kelurahan
1            31 DAERAH KHUSUS IBUKOTA JAKARTA      3171 Jakarta Selatan        3171010      Jagakarsa     3171010001         Cipedak
2            31 DAERAH KHUSUS IBUKOTA JAKARTA      3172   Jakarta Timur        3172020        Ciracas     3172020001         Cibubur
3            31 DAERAH KHUSUS IBUKOTA JAKARTA      3172   Jakarta Timur        3172030       Cipayung     3172030001  Pondok Ranggon
4            31 DAERAH KHUSUS IBUKOTA JAKARTA      3172   Jakarta Timur        3172030       Cipayung     3172030003          Munjul
5            31 DAERAH KHUSUS IBUKOTA JAKARTA      3172   Jakarta Timur        3172010     Pasar Rebo     3172010001         Pekayon
6            31 DAERAH KHUSUS IBUKOTA JAKARTA      3171 Jakarta Selatan        3171010      Jagakarsa     3171010002 Srengseng Sawah
                        geometry
1 POLYGON((106.800101597915 -...
2 POLYGON((106.884067296907 -...
3 POLYGON((106.894108150063 -...
4 POLYGON((106.902775722093 -...
5 POLYGON((106.868279333562 -...
6 POLYGON((106.835497431474 -...
```
