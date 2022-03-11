azmpcfin
================

## Requirements

-   [R v4.1+](https://www.r-project.org/)
-   [rlang](https://CRAN.R-project.org/package=rlang)
-   [dplyr](https://CRAN.R-project.org/package=dplyr)
-   [readr](https://CRAN.R-project.org/package=readr)
-   [sf](https://CRAN.R-project.org/package=sf)

## Installation

    remotes::install_github("BigelowLab/azmpcfin")

## Initial Use

The premise of this package is that data may be stored in a single
location but accessed by many users. To achieve this resource-friendly
goal and still simplified access for each user, we need to inform the
package where the data resides. We do this by storing the path to the
data location in each user’s home directory in a hidden text file,
“\~/.azmpcfin”. That text file has just one line in it which contains
the full path to the shared dataset. For example, the author’s contains
`mnt/ecocast/coredata/dfompo/AZMP_data` which points to a shared network
drive mounted on our linux platform.

When the package is first loaded (ala `library(azmpcfin)`) the existence
of the file is check, and if missing a warning is issued.

You can create and populate that `~/.azmpcfin` using a text editors, or
you can create using the provided function `set_data_path()`. Here is
how the author created his own…

    library(azmpcfin)
    azmpcfin::set_data_path("/mnt/ecocast/coredata/dfompo/AZMP_data")

That’s it. If you ever move the data you’ll have to modify the contents
of this hidden text file.

## Read the calanus data

``` r
suppressPackageStartupMessages({
  library(dplyr)
  library(azmpcfin)
})

x <- read_calanus()
glimpse(x)
```

    ## Rows: 7,802
    ## Columns: 30
    ## $ region                   <chr> "QC", "QC", "QC", "QC", "QC", "QC", "QC", "QC…
    ## $ transect                 <chr> "TSI", "TSI", "TSI", "TESL", "TESL", "TESL", …
    ## $ station                  <chr> "TSI3", "TSI5", "TSI6", "TESL1", "TESL2", "TE…
    ## $ year                     <dbl> 2000, 2000, 2000, 2000, 2000, 2000, 2000, 200…
    ## $ month                    <dbl> 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1…
    ## $ day                      <dbl> 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 6, …
    ## $ time                     <time> 22:55:00, 19:17:00, 17:28:00, 14:21:00, 15:4…
    ## $ timezone                 <chr> "UTC", "UTC", "UTC", "UTC", "UTC", "UTC", "UT…
    ## $ longitude                <dbl> -66.22983, -66.27050, -66.27500, -68.48500, -…
    ## $ latitude                 <dbl> 49.55117, 49.88333, 50.05333, 48.57583, 48.62…
    ## $ depth                    <dbl> 340, 276, 121, 38, 225, 331, 339, 341, 149, 3…
    ## $ mesh_size                <dbl> 202, 202, 202, 202, 202, 202, 202, 202, 202, …
    ## $ calanus_finmarchicus_i   <dbl> 223.02556, 178.40076, 711.74097, 387.92602, 9…
    ## $ calanus_finmarchicus_ii  <dbl> 223.02556, 356.80153, 1245.54670, 77.58520, 0…
    ## $ calanus_finmarchicus_iii <dbl> 1115.127790, 1427.206117, 711.740970, 232.755…
    ## $ calanus_finmarchicus_iv  <dbl> 4460.511161, 1962.408410, 1067.611456, 439.64…
    ## $ calanus_finmarchicus_v   <dbl> 35015.01262, 14093.66040, 1067.61146, 51.7234…
    ## $ calanus_finmarchicus_vi  <dbl> 1784.20446, 178.40076, 355.87049, 51.72347, 3…
    ## $ calanus_glacialis_i      <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    ## $ calanus_glacialis_ii     <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    ## $ calanus_glacialis_iii    <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    ## $ calanus_glacialis_iv     <dbl> 0.00000, 0.00000, 177.93524, 0.00000, 0.00000…
    ## $ calanus_glacialis_v      <dbl> 446.05112, 178.40076, 0.00000, 0.00000, 452.7…
    ## $ calanus_glacialis_vi     <dbl> 1115.12779, 535.20229, 0.00000, 0.00000, 1448…
    ## $ calanus_hyperboreus_i    <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    ## $ calanus_hyperboreus_ii   <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    ## $ calanus_hyperboreus_iii  <dbl> 0.000000, 0.000000, 0.000000, 0.000000, 0.000…
    ## $ calanus_hyperboreus_iv   <dbl> 8697.996764, 1962.408410, 177.935243, 0.00000…
    ## $ calanus_hyperboreus_v    <dbl> 10482.20123, 3389.61453, 177.93524, 25.86173,…
    ## $ calanus_hyperboreus_vi   <dbl> 3122.35781, 1070.40459, 0.00000, 0.00000, 181…
