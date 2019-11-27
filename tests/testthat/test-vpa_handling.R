context("Handling VPA result")

test_that("ssb", {
  expect_equal(ssb(stockdocr:::res_vpa, year = 2017, unit = "ton"),  "21728.5")
  expect_equal(ssb(stockdocr:::res_vpa, year = 2017, unit = "kton"), "21.7千")
})

test_that("harvest_rate", {
  expect_equal(harvest_rate(stockdocr:::res_vpa, year = 2017), 43.1)
})
