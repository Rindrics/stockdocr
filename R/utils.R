#' Concatenate 2-length-vector with specific character
#'
#' @param range_vec Vector composed of two objects
#' @param sep Character between two vectors
str_range <- function(range_vec, sep = "\u2013") {
  paste0(range_vec[1], sep, range_vec[2])
}

#' Convert tonnage to kilogram
#' 
#' @param weight_ton Weight in ton
#' @export
ton_to_kg <- function(weight_ton) {
  return(weight_ton * 1000)
}

#' Convert tonnage to kiloton
#' 
#' @inheritParams ton_to_kg
#' @export
ton_to_kton <- function(weight_ton) {
  return(weight_ton / 1000)
}

#' Set given class to object
#'
#' To use S3 function
#' @param x Object to be given \code{class}
#' @param class Class to be given \code{x}
#' @example
#' foo <- 1:3
#' set_class(foo, class = "bar")
set_class <- function(x, class) {
  out <- x
  class(out) <- as.character(class)
  return(out)
}
