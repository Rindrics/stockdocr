#' Pull weight value from vpa result
#'
#' @inheritParam frasyr::convert_vpa_tibble
#' @param yr Year to filter output
#' @param varname Name of variable from \code($stat) of
#' frasyr::convert_vpa_tibble output
pull_value_from_vpa_result <- function(vpares, yr, varname) {
  df <- frasyr::convert_vpa_tibble(vpares)
  assertthat::assert_that(
    all(colnames(df) == c("value", "year", "type", "sim", "stat", "age")),
    msg = "Colnames of output from 'frasyr::convert_vpa_tibble' changed.")
  out <- df %>%
    dplyr::filter(stat == varname,
                  year == yr) %>%
    dplyr::pull(value)
  assertthat::assert_that(
    length(out) > 0,
    msg = paste0("'", varname, "' is not found in output of frasyr::convert_vpa_tibble"))
  return(out)
}

#' Return biomass of given year
#'
#' @inheritParams conv.catch_kg
#' @param year Year of the value you want
#' @param draft If TRUE, value will be returned wrapped by HTML tag
#' for highlight in document review
#' @export
b <- function(vpares, year, unit = "kton", add_jpdigit = TRUE, draft = FALSE) {
  vpares %>%
    pull_value_from_vpa_result(year, varname = "biomass") %>%
    ton_to_kg() %>%
    set_class(class = "catch_kg") %>%
    conv(to = unit, add_jpdigit = add_jpdigit) %>%
    highlight(draft = draft)
}

#' Return recruitment of given year
#'
#' @inheritParams conv.recruit_106fish
#' @inheritParams b
#' @export
r <- function(vpares, year, unit = "100mil", add_jpdigit = TRUE, draft = FALSE) {
  vpares %>%
    pull_value_from_vpa_result(year, varname = "Recruitment") %>%
    set_class(class = "recruit_106fish") %>%
    conv(to = unit, add_jpdigit = add_jpdigit) %>%
    highlight(draft = draft)
}

#' Return SSB of given year
#'
#' @inheritParams b
#' @export
ssb <- function(vpares, year, unit = "kton", add_jpdigit = TRUE, draft = FALSE) {
  vpares %>%
    pull_value_from_vpa_result(year, varname = "SSB") %>%
    ton_to_kg() %>%
    set_class(class = "catch_kg") %>%
    conv(to = unit, add_jpdigit = add_jpdigit) %>%
    highlight(draft = draft)
}

#' Return harvest rate of given year
#'
#' @inheritParams conv.recruit_106fish
#' @inheritParams highlight
#' @export
harvest_rate <- function(vpares, year, draft = FALSE) {
  biomass <- pull_value_from_vpa_result(vpares, year, varname = "biomass")
  catch   <- pull_value_from_vpa_result(vpares, year, varname = "catch")

  round(as.numeric(catch) / as.numeric(biomass) * 100, 1) %>%
    highlight(draft = draft)
}

#' Return fishing mortality of given year
#'
#' @inheritParams b
#' @export
faa <- function(vpares, year, draft = FALSE) {
  vpares[["faa"]][as.character(year)] %>%
    unlist() %>%
    unname() %>%
    round(2) %>%
    highlight(draft = draft)
}
