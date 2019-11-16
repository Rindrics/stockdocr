context("test-utility functions")

test_that("str_range concatenates two numeric args with en-dash", {
  expect_equal(str_range(c(1, 2)),             "1\u20132")
  expect_equal(str_range(c(2, 1)),             "2\u20131")
})

test_that("str_range concatenates two character args with en-dash", {
  expect_equal(str_range(c("a", "b")),         "a\u2013b")
  expect_equal(str_range(c("100千", "123千")), "100千\u2013123千")
})

test_that("str_range concatenates two args with given sep argument", {
  expect_equal(str_range(c(1, 2),             sep = "_"), "1_2")
  expect_equal(str_range(c(2, 1),             sep = "_"), "2_1")
  expect_equal(str_range(c("a", "b"),         sep = "_"), "a_b")
  expect_equal(str_range(c("100千", "123千"), sep = "_"), "100千_123千")

  expect_equal(str_range(c(1, 2),             sep = "."), "1.2")
  expect_equal(str_range(c(2, 1),             sep = "."), "2.1")
  expect_equal(str_range(c("a", "b"),         sep = "."), "a.b")
  expect_equal(str_range(c("100千", "123千"), sep = "."), "100千.123千")
})

test_that("str_range concatenates return of range function", {
  expect_equal(str_range(range(1:10)), "1\u201310")
  expect_equal(str_range(range(10:1)), "1\u201310")
})
