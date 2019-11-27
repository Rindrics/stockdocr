# Script for shaping html after merge
library(magrittr)
filelist <- list.files("_book", pattern = ".+html$", full.names = TRUE)
for(f in filelist) {
  scan(file = f, what = "character") %>%
    paste(collapse = "\n") %>%
    stringr::str_replace_all("content=\"[0-9]+", "content=\"") %>%
    stringr::str_replace_all("(header-section-number\">)[0-9]+\\.(?:[0-9]+)?", "\\1") %>%
    stringr::str_replace_all("(header-section-number\">)[0-9]+<", "\\1<") %>%
    stringr::str_replace_all("(href=.+fig:.+>)[0-9]+\\.([0-9]+)", "\\1\\2") %>%
    stringr::str_replace_all("(href=.+tab:.+>)[0-9]+\\.([0-9]+)", "\\1\\2") %>%
    stringr::str_replace_all("Figure\n[0-9]+\\.([0-9]+):", "図\\1:") %>%
    stringr::str_replace_all("Table\n[0-9]+\\.([0-9]+):", "表\\1:") %>%
    cat(file = f)
}
