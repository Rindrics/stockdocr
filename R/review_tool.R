
checkme <- function(string, mode) {
  if (mode == "draft") {
    return(paste0("<br><br>- \u25A2 ", string, "<br><br>"))
  }
  return(string)
}
