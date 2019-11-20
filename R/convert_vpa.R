handle_vpa <- function(vpares, varname, year, unit, add_jp) {
  out_kg <- vpares[[varname]][as.character(year)] %>%
    colSums() %>%
    "*"(1000)
  class(out_kg) <- "catch_kg"
  conv(out_kg, to = unit, add_jpdigit = add_jp)
}

b <- function(vpares, year, unit, add_jp = TRUE) {
  handle_vpa(vpares, year, varname = "baa", unit = unit, add_jp = add_jp)
}

r <- function(vpares, year, unit = "100mil", add_jp = TRUE) {
  row_age0  <- 1
  r_106fish <- vpares[["naa"]][as.character(year)][row_age0, ]
  class(r_106fish) <- "recruit_106fish"
  conv(r_106fish, to = unit, add_jpdigit = add_jp)
}
ssb <- function(vpares, year, unit, add_jp = TRUE) {
  handle_vpa(vpares, year, varname = "ssb", unit = unit, add_jp = add_jp)
}

harvest_rate <- function(vpares, year) {
  biomass <- handle_vpa(vpares, year, varname = "baa", unit = "ton", add_jp = FALSE)
  catch   <- handle_vpa(vpares, year, varname = "wcaa", unit = "ton", add_jp = FALSE)
  as.numeric(catch) / as.numeric(biomass) * 100
}

faa <- function(vpares, year) {
  vpares[["faa"]][as.character(year)] %>%
    unlist() %>%
    unname() %>%
    round(2)
}
