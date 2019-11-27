test_that("multiplication works", {
  checkme("hello", mode = "draft")
  expect_equal(checkme("hello", mode = "final"), "hello")
  expect_equal(checkme("hello", mode = "draft"), "<br><br>- [ ] hello<br><br>")
})
