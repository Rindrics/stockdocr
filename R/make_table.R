sample_table <- function(vpares, year, caption, draft = TRUE) {
  rbind(c(paste0("SB", year),
          paste0(ssb(vpares, year = year, unit = "kton", draft = draft), "トン")),
        c(paste0("F", year),
          paste0("(0歳, 1歳, 2歳, 3歳以上) = ",
                 paste0("(",
                        paste(faa(vpares, year = year, draft = draft), collapse = ", "),
                        ")"))),
        c(paste0("U", year),
          paste0(harvest_rate(vpares, year = year, draft = draft), "%"))) %>%
    as.data.frame() %>%
    magrittr::set_colnames(c("項目", "値")) %>%
    knitr::kable(booktabs = TRUE, caption = caption)

}

