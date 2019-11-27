table_foo <- function(vpares, year, caption) {
  rbind(c(paste0("SB", year), ssb(vpares, year = year, unit = "kton")),
        c(paste0("F", year), paste(faa(vpares, year = year), collapse = ", ")),
        c(paste0("U", year), harvest_rate(vpares, year = year))) %>%
    as.data.frame() %>%
    magrittr::set_colnames(c("foo", "bar")) %>%
    knitr::kable(booktabs = TRUE, caption = caption)

}

