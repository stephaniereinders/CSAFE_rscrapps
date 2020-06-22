context("getDataForSingleApp")

test_that("app_url is a character", {
  expect_error(getDataForSingleApp(50))
})

test_that("app_url starts with the string https://play.google.com/store/apps/details?id=", {
  expect_error(getDataForSingleApp("www.google.com"))
})
