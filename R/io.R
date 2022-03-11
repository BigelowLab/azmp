#' Generate a listing of column types suitable for\code{\link[readr]{read_tsv}}
#' 
#' @return a named list of column types
cols_calanus <- function(){
  list(
    region = readr::col_character(),
    transect = readr::col_character(),
    station = readr::col_character(),
    year = readr::col_double(),
    month = readr::col_double(),
    day = readr::col_double(),
    time = readr::col_time(format = ""),
    timezone = readr::col_character(),
    longitude = readr::col_double(),
    latitude = readr::col_double(),
    depth = readr::col_double(),
    mesh_size = readr::col_double(),
    calanus_finmarchicus_i = readr::col_double(),
    calanus_finmarchicus_ii = readr::col_double(),
    calanus_finmarchicus_iii = readr::col_double(),
    calanus_finmarchicus_iv = readr::col_double(),
    calanus_finmarchicus_v = readr::col_double(),
    calanus_finmarchicus_vi = readr::col_double(),
    calanus_glacialis_i = readr::col_double(),
    calanus_glacialis_ii = readr::col_double(),
    calanus_glacialis_iii = readr::col_double(),
    calanus_glacialis_iv = readr::col_double(),
    calanus_glacialis_v = readr::col_double(),
    calanus_glacialis_vi = readr::col_double(),
    calanus_hyperboreus_i = readr::col_double(),
    calanus_hyperboreus_ii = readr::col_double(),
    calanus_hyperboreus_iii = readr::col_double(),
    calanus_hyperboreus_iv = readr::col_double(),
    calanus_hyperboreus_v = readr::col_double(),
    calanus_hyperboreus_vi = readr::col_double()
  )
}


#' Read calanus abundance tables
#' 
#' @export
#' @param filename character, the file to read
#' @param form character, one of 'tibble' or 'sf'
#' @return  tibble or sf POINT table
read_calanus <- function(filename = get_data_path("CalanusAbundance_m2_CAN_data.txt"),
                         form = c("tibble", "sf")[1]){
  
  x <- readr::read_tsv(filename,
                       col_types = cols_calanus())
  
  if (tolower(form[1]) == "sf"){
    x <- sf::st_as_sf(x, coords = c("longitude", "latitude"), crs = 4326)
  }
  x
}