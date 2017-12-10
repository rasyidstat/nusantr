
<!-- README.md is generated from README.Rmd. Please edit that file -->
nusantr: Indonesia R package <img src="man/figures/logo.png" align="right" height="140" width="120"/>
=====================================================================================================

*We R Nusantara!*

`nusantr` is an R package which contains:

-   Indonesia map in spatial data frame format
-   Datasets related to Indonesia
-   Functionality to convert [NIK](https://en.wikipedia.org/wiki/Indonesian_identity_card) to location, gender and birthdate.

Installation
------------

You need to use `sf` package to enable the class of sf data frame.

``` r
# install.packages("devtools")
install.packages("sf")
install.packages("tidyverse")
devtools::install_github("rasyidstat/nusantr")
```

Example
-------

You can get Indonesia map by using `id_map` function that will return sf spatial data frame. It contains two parameters: region and level and currently only contains two regions: "indonesia" and "jakarta".

-   "indonesia" consists of two geographical levels such as "provinsi" and "kota".
-   "jakarta" consists of three geographical levels such as "kecamatan", "kelurahan" and "rw".

The data for Indonesia map will be dowloaded from [GADM](http://www.gadm.org/) and the data for Jakarta map is get from from [Jakarta Smart City](http://smartcity.jakarta.go.id).

``` r
library(sf)
#> Linking to GEOS 3.6.1, GDAL 2.2.0, proj.4 4.9.3
library(nusantr)

# get indonesia map for 'provinsi' level
indonesia_provinsi <- id_map("indonesia", "provinsi")

# get indonesia map for 'kota' level
indonesia_kota <- id_map("indonesia", "kota")

# get jakarta map for 'kelurahan' level
jakarta_kelurahan <- id_map("jakarta", "kelurahan")

head(jakarta_kelurahan)
#> Simple feature collection with 6 features and 8 fields
#> geometry type:  POLYGON
#> dimension:      XY
#> bbox:           xmin: 106.7928 ymin: -6.373226 xmax: 106.92 ymax: -6.331914
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 6 x 9
#>   provinsi_id    provinsi kota_id            kota kecamatan_id  kecamatan
#>         <chr>       <chr>   <chr>           <chr>        <chr>      <chr>
#> 1          31 DKI Jakarta    3171 Jakarta Selatan      3171010  Jagakarsa
#> 2          31 DKI Jakarta    3172   Jakarta Timur      3172020    Ciracas
#> 3          31 DKI Jakarta    3172   Jakarta Timur      3172030   Cipayung
#> 4          31 DKI Jakarta    3172   Jakarta Timur      3172030   Cipayung
#> 5          31 DKI Jakarta    3172   Jakarta Timur      3172010 Pasar Rebo
#> # ... with 1 more rows, and 3 more variables: kelurahan_id <chr>,
#> #   kelurahan <chr>, geometry <simple_feature>
```

You also can convert [NIK](https://en.wikipedia.org/wiki/Indonesian_identity_card) (*Nomor Induk Kependudukan*) or KTP ID to location (city and province), gender and birthdate using `nik_to_all`, `nik_to_gender`, `nik_to_bd`, `nik_to_city` or `nik_to_prov`.

``` r
nik_to_all("3173060101000010")
#> $gender
#> [1] Laki-laki
#> Levels: Laki-laki Perempuan
#> 
#> $bd
#> [1] "2000-01-01"
#> 
#> $city
#> [1] "KOTA JAKARTA PUSAT"
#> 
#> $prov
#> [1] "DKI JAKARTA"
```
