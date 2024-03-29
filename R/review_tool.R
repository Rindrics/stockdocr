#' Highlight string for review
#'
#' Suitable for strings generated by eval because they will be kept "inline"
#' @param string String to be highlighted
#' @param draft If FALSE, \code{string} will be returned without highlight
#' @param color Color for highlighting
highlight <- function(string, draft = TRUE, color = "skyblue") {
  if (draft) {
    return(paste0("<span style=\"background-color:", color, "\">",
                  string, "</span>"))
  }
  return(string)
}

#' Highlight hand-written phrase for review
#'
#' @inheritParams highlight
#' @export
checkme <- function(string, draft = TRUE) {
  if (draft) {
    return(paste0("<div style=\"background-color:yellow\">- \u25A2 ",
                  string, "</div>"))
  }
  return(string)
}
