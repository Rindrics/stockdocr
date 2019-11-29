context("checkme()")

test_that("do nothing if draft == FALSE", {
  draft <- FALSE
  expect_equal(checkme("foo", draft), "foo")
  expect_equal(checkme(1,     draft), 1)
  expect_equal(checkme(NA,    draft), NA)
})

test_that("return tagged string draft == TRUE", {
  draft <- TRUE
  expect_equal(checkme("foo", draft),
               "<div style=\"background-color:yellow\">- ▢ foo</div>")
  expect_equal(checkme(1,     draft),
               "<div style=\"background-color:yellow\">- ▢ 1</div>")
  expect_equal(checkme(NA,    draft),
               "<div style=\"background-color:yellow\">- ▢ NA</div>")
})

context("highlight")

test_that("do nothing if draft == FALSE", {
  draft <- FALSE
  expect_equal(highlight("foo", draft), "foo")
  expect_equal(highlight(1,     draft), 1)
  expect_equal(highlight(NA,    draft), NA)
})

test_that("return tagged string draft == TRUE", {
  draft <- TRUE
  expect_equal(highlight("foo", draft),
               "<span style=\"background-color:skyblue\">foo</span>")
  expect_equal(highlight(1,     draft),
               "<span style=\"background-color:skyblue\">1</span>")
  expect_equal(highlight(NA,    draft),
               "<span style=\"background-color:skyblue\">NA</span>")
})

test_that("highlight with given color", {
  draft <- TRUE
  expect_equal(highlight(1,     draft, color = "red"),
               "<span style=\"background-color:red\">1</span>")
  expect_equal(highlight("foo", draft, color = "green"),
               "<span style=\"background-color:green\">foo</span>")
  expect_equal(highlight(NA,    draft, color = "blue"),
               "<span style=\"background-color:blue\">NA</span>")
})
