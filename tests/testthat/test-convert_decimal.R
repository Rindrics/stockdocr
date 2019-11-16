context("test-convert_decimal")

test_that("convert catch decimals", {
  catch        <- 1234567890
  class(catch) <- "catch_kg"
  conv(catch, to = "ton", add_jpdigit = FALSE)
  expect_equal(conv(catch, to = "ton",    add_jpdigit = FALSE), "1234567.9")
  expect_equal(conv(catch, to = "dton",   add_jpdigit = FALSE), "123456.8")
  expect_equal(conv(catch, to = "cton",   add_jpdigit = FALSE), "12345.7")
  expect_equal(conv(catch, to = "kton",   add_jpdigit = FALSE), "1234.6")
  expect_equal(conv(catch, to = "10kton", add_jpdigit = FALSE), "123.5")
})

test_that("convert catch decimals with Japanese digit chars", {
  catch        <- 1234567890
  class(catch) <- "catch_kg"
  conv(catch, to = "ton", add_jpdigit = FALSE)
  expect_equal(conv(catch, to = "ton",    add_jpdigit = TRUE), "1234567.9")
  expect_equal(conv(catch, to = "dton",   add_jpdigit = TRUE), "123456.8十")
  expect_equal(conv(catch, to = "cton",   add_jpdigit = TRUE), "12345.7百")
  expect_equal(conv(catch, to = "kton",   add_jpdigit = TRUE), "1234.6千")
  expect_equal(conv(catch, to = "10kton", add_jpdigit = TRUE), "123.5万")
})

test_that("convert recruitment decimals", {
  recruit        <- 12345
  class(recruit) <- "recruit_106fish"
  conv(recruit, to = "ton", add_jpdigit = FALSE)
  expect_equal(conv(recruit, to = "mil",    add_jpdigit = FALSE), "12345")
  expect_equal(conv(recruit, to = "100mil", add_jpdigit = FALSE), "123.5")
})


test_that("convert recruitment decimals with Japanese digit chars", {
  recruit        <- 12345
  class(recruit) <- "recruit_106fish"
  conv(recruit, to = "ton", add_jpdigit = FALSE)
  expect_equal(conv(recruit, to = "mil",    add_jpdigit = TRUE), "12345百万")
  expect_equal(conv(recruit, to = "100mil", add_jpdigit = TRUE), "123.5億")
})
