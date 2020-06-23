context("getDataForTag")

test_that("search term is a character", {
  expect_error(getDataForApps(50))
})

test_that("search term is non-empty", {
  expect_error(getDataForApps(""))
})

