#' Test if a data path config file exists
#' 
#' @export
#' @param filename char, the name of the config files
#' @return logical TRUE if the config file exists
has_data_path <- function(filename = "~/.azmpdata"){
  file.exists(filename[1])
}

#' Write the configuration file
#' 
#' @export
#' @param path char, the path to the data - like '/mnt/ecocast/coredata/dfompo/AZMP_data'
#' @param filename char, the name of the config files
set_data_path <- function(path, filename = "~/.azmpdata"){
  cat(path[1], sep = "\n", file = filename[1])
}

#' Retrieve the user specified data path
#'
#' @export
#' @param ... elements for \code{\link[base]{file.path}}
#' @param root char, the root path directory
#' @return character, the path to the data
get_data_path <- function(...,
                          root = readLines("~/.azmpdata")){
  file.path(root, ...)
}
