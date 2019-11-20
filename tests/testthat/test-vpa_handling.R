context("Handling VPA result")

test_that("pull given weight from vpa results", {
  year   <- 2017
  unit   <- "kton"
  draft  <- FALSE
  add_jp <- TRUE
  expect_equal(pull_value_from_vpa_result(stockdocr:::res_vpa, varname = "biomass",
                                          yr = year),
               60380.74, tolerance = 0.01)
  expect_equal(pull_value_from_vpa_result(stockdocr:::res_vpa, varname = "SSB",
                                      yr = year),
               21728.52, tolerance = 0.01)
  expect_equal(pull_value_from_vpa_result(stockdocr:::res_vpa, varname = "catch",
                                          yr = year),
               26016, tolerance = 0.01)
})

test_that("pull weight of given year from vpa results", {
  unit    <- "kton"
  draft   <- FALSE
  add_jp  <- FALSE
  years   <- 1988:2017
  expect_equal(purrr::map_dbl(years, pull_value_from_vpa_result,
                              vpares = stockdocr:::res_vpa, varname = "SSB") %>%
                 ton_to_kton() %>%
                 round(1), 
               c(12.2, 15.3, 15.1, 19.1, 23.5, 28.8, 34.8, 38.2,
                 48.5, 61.9, 64, 38.8, 53.4, 47.3, 54.5, 54.4,
                 47.9, 46.1, 59.8, 53.4, 48.8, 42.7, 40.1, 39.3,
                 38.3, 37.6, 27.6, 23.1, 22.9, 21.7))
  expect_equal(purrr::map_dbl(years, pull_value_from_vpa_result,
                              vpares = stockdocr:::res_vpa, varname = "biomass") %>%
                 ton_to_kton() %>%
                 round(1) ,
               c(34.4, 40.9, 43.8, 46.5, 79.3, 87.7, 81.9, 92.1,
                 125.2, 152.7, 131.0, 153.4, 158.6, 149, 162.3,
                 142.9, 126.5, 118.8, 124.7, 139, 110.8, 109.4,
                 112.8, 103.6, 89.5, 83.9, 75.6, 54.1, 56.3,
                 60.4))
  expect_equal(purrr::map_dbl(years, pull_value_from_vpa_result,
                              vpares = stockdocr:::res_vpa, varname = "catch") %>%
                 ton_to_kton() %>%
                 round(1) ,
               c(14.7, 19.4, 18.3, 16.6, 36.5, 38.8, 33.9, 32.9,
                 48.5, 65.4, 67.7, 70.5, 83.0, 69.2, 81.1, 71.4,
                 58.1, 46.7, 55.7, 67.7, 50.0, 51.5, 54.0, 48.0,
                 40.4, 43.1, 40.0, 23.5, 26.0, 26.0))
})

test_that("ssb output in draft mode", {
  draft <- TRUE
  expect_equal(ssb(stockdocr:::res_vpa, year = 2017,
                   unit = "ton", draft = draft),
               "<span style=\"background-color:skyblue\">21728.5</span>")
  expect_equal(ssb(stockdocr:::res_vpa, year = 2017,
                   unit = "kton", draft = draft),
               "<span style=\"background-color:skyblue\">21.7千</span>")
})

test_that("ssb output in final mode", {
  draft <- FALSE
  expect_equal(ssb(stockdocr:::res_vpa, year = 2017,
                   unit = "ton", draft = draft),
               "21728.5")
  expect_equal(ssb(stockdocr:::res_vpa, year = 2017,
                   unit = "kton", draft = draft),
               "21.7千")
})


test_that("harvest_rate", {
  expect_equal(harvest_rate(stockdocr:::res_vpa,
                            year = 2017, draft = FALSE),
               43.1)
  expect_equal(harvest_rate(stockdocr:::res_vpa,
                            year = 2017, draft = TRUE),
               "<span style=\"background-color:skyblue\">43.1</span>")
})
