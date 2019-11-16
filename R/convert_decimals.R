#' Create character from numbers

#' Concatenate two characters
#'
#' @param x The first character
#' @param y The other
#' @param ... Additional arguments to be concatenated
#' @param sep Separate character between two args
#' @param concat If FALSE, x will be returned
toggle_paste <- function(x, y, ..., sep = "", concat = TRUE) {
  if (concat == FALSE) return(as.character(x))
  paste(x, y, ..., sep = sep)
}

#' Convert decimals
#'
#' @param value Value to be converted
#' @param ... Arguments to be passed to methods
#' @export
conv <- function(value, ...) {
  UseMethod("conv")
}

#' Convert catch in kilogram to various decimal order
#'
#' @param catch_kg Catch in kilogram
#' @param to decimal order to convert in character such as
#' \describe{
#'   \item{"ton"}{ton}
#'   \item{"dton"}{10 ton}
#'   \item{"cton"}{100 ton}
#'   \item{"kon"}{kilo ton}
#'   \item{"10on"}{10 kilo ton}
#' }
#' @param add_jpdigit If TRUE, Japanese kanji digit mark will be added
conv.catch_kg <- function(catch_kg, to, add_jpdigit = TRUE) {
  switch(to,
         "ton"    = toggle_paste(round(catch_kg / 10 ^ 3, 1),  "",
                                  concat = add_jpdigit),
         "dton"   = toggle_paste(round(catch_kg / 10 ^ 4, 1), "\u5341",
                                  concat = add_jpdigit),
         "cton"   = toggle_paste(round(catch_kg / 10 ^ 5, 1), "\u767e",
                                  concat = add_jpdigit),
         "kton"   = toggle_paste(round(catch_kg / 10 ^ 6, 1), "\u5343",
                                  concat = add_jpdigit),
         "10kton" = toggle_paste(round(catch_kg / 10 ^ 7, 1), "\u4e07",
                                  concat = add_jpdigit))
}

#' Convert number of recruitments in 10^6 fishes to several decimal order
#'
#' @inheritParams conv.catch_kg
#' @param r_106fish Number of recruitments in "million fish"
#' @param to decimal order to convert in character such as
#' \describe{
#'   \item{"mil"}{million fishes}
#'   \item{"100mil"}{100 million fishes, "oku" in Japanese}
#'   #' }
conv.recruit_106fish <- function(r_106fish, to, add_jpdigit = TRUE) {
  switch(to,
         "mil"    = toggle_paste(round(r_106fish,       1), "\u767e\u4e07",
                                  concat = add_jpdigit),
         "100mil" = toggle_paste(round(r_106fish / 100, 1), "\u5104",
                                  concat = add_jpdigit))
}
