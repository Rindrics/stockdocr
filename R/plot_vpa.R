get_year_from_vpa_result <- function(vpares) {
  as.numeric(names(vpares[["ssb"]]))
}
plot_vpa <- function(vpares, var) {
  var  <- res_vpa[[as.character(var)]] %>% colSums()
  year <- get_year_from_vpa_result(vpares)
  data.frame(year = year, var = var) %>%
    ggplot2::ggplot(ggplot2::aes(year, var)) +
    ggplot2::geom_point() +
    ggplot2::geom_line() +
    ggplot2::theme_bw()
}
