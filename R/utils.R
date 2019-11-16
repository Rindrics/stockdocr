#' Concatenate 2-length-vector with specific character
#'
#' @param range_vec Vector composed of two objects
#' @param sep Character between two vectors
str_range <- function(range_vec, sep = "\u2013") {
  paste0(range_vec[1], sep, range_vec[2])
}
