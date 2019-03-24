
<!-- README.md is generated from README.Rmd. Please edit that file -->
nusantr: Indonesia R package <img src="man/figures/logo.png" align="right" height="140" width="120"/>
=====================================================================================================

*We R Nusantara!*

`nusantr` is an R package which contains:

-   Indonesia map in spatial data frame format (Indonesia map should be downloaded first on [GADM](https://gadm.org/))
-   Datasets related to Indonesia such as: Transjakarta data, Indonesia name data, etc.
-   A simple function to convert [NIK](https://en.wikipedia.org/wiki/Indonesian_identity_card) to location, gender and birthdate.

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
library(nusantr)
```

``` r
# get jakarta map for 'kelurahan' level
jakarta_kelurahan <- id_map("jakarta", "kelurahan")
jakarta_kelurahan
#> Simple feature collection with 377 features and 8 fields
#> geometry type:  POLYGON
#> dimension:      XY
#> bbox:           xmin: 106.4 ymin: -6.373 xmax: 107 ymax: -5.184
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 377 x 9
#>   provinsi_id provinsi  kota_id kota   kecamatan_id kecamatan kelurahan_id
#>   <chr>       <chr>     <chr>   <chr>  <chr>        <chr>     <chr>       
#> 1 31          DKI Jaka… 3171    Jakar… 3171010      Jagakarsa 3171010001  
#> 2 31          DKI Jaka… 3172    Jakar… 3172020      Ciracas   3172020001  
#> 3 31          DKI Jaka… 3172    Jakar… 3172030      Cipayung  3172030001  
#> 4 31          DKI Jaka… 3172    Jakar… 3172030      Cipayung  3172030003  
#> 5 31          DKI Jaka… 3172    Jakar… 3172010      Pasar Re… 3172010001  
#> # ... with 372 more rows, and 2 more variables: kelurahan <chr>,
#> #   geometry <POLYGON [°]>

# transjakarta halte data
transjakarta
#> # A tibble: 1,555 x 6
#>   halte_id         halte_name  latitude longitude corridor_cnt schedule_id
#>   <chr>            <chr>          <dbl>     <dbl>        <int> <list>     
#> 1 idjkb_1-10 Sari… Sarinah        -6.19      107.           10 <chr [10]> 
#> 2 idjkb_1-11 Bank… Bank Indon…    -6.18      107.            9 <chr [9]>  
#> 3 idjkb_1-12 Monas Monumen Na…    -6.18      107.           16 <chr [16]> 
#> 4 idjkb_1-13 Harm… Harmoni        -6.17      107.           18 <chr [18]> 
#> 5 idjkb_1-14 Sawa… Sawah Besar    -6.16      107.            5 <chr [5]>  
#> # ... with 1,550 more rows

# transjakarta route data
transjakarta_route
#> Simple feature collection with 482 features and 11 fields
#> geometry type:  LINESTRING
#> dimension:      XY
#> bbox:           xmin: 106.6 ymin: -6.396 xmax: 107 ymax: -6.091
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 482 x 12
#>   transport_id schedule_id corridor_id corridor_name corridor_color
#>   <chr>        <chr>       <chr>       <chr>         <chr>         
#> 1 idjkb_brt    idjkb_1     1           Blok M - Kota D02027        
#> 2 idjkb_brt    idjkb_1     1           Blok M - Kota D02027        
#> 3 idjkb_brt    idjkb_1     1           Blok M - Kota D02027        
#> 4 idjkb_brt    idjkb_1     1           Blok M - Kota D02027        
#> 5 idjkb_brt    idjkb_1     1           Blok M - Kota D02027        
#> # ... with 477 more rows, and 7 more variables: route_id <chr>,
#> #   route_name <chr>, direction <int>, validity <chr>, is_main <lgl>,
#> #   is_main_reverse <lgl>, geometry <LINESTRING [°]>
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
