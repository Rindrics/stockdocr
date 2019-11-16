context("test-components")

test_that("toggle_paste concatenates args", {
  expect_equal(toggle_paste(1, 2),
               "12")
  expect_equal(toggle_paste(1, 2, sep = "+"),
               "1+2")
  expect_equal(toggle_paste("a", 2),
               "a2")
  expect_equal(toggle_paste("a", "b"),
               "ab")
  expect_equal(toggle_paste("a", "b", "3", sep = ","),
               "a,b,3")
})

test_that("toggle_paste returns the first arg", {
  expect_equal(toggle_paste(1, 2, concat = FALSE),
               "1")
  expect_equal(toggle_paste(1, 2, sep = "+", concat = FALSE),
               "1")
  expect_equal(toggle_paste("a", 2, concat = FALSE),
               "a")
  expect_equal(toggle_paste("a", "b", concat = FALSE),
               "a")
  expect_equal(toggle_paste("a", "b", "3", sep = ",", concat = FALSE),
               "a")
})
