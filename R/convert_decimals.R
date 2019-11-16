#' Create character from numbers

#' Concatenate two characters
#'
#' @param x The first character
#' @param y The other
#' @param concat If FALSE, x will be returned
toggle_paste <- function(x, y, ..., sep = "", concat = TRUE) {
  if (concat == FALSE) return(as.character(x))
  paste(x, y, ..., sep = sep)
}
