context("getDataForTag")

test_that("app_url is a character", {
  expect_error(getDataForTag(50, "a", "class", "hrTbp R8zArc"))
})

test_that("app_url starts with the string https://play.google.com/store/apps/details?id=", {
  expect_error(getDataForTag("www.google.com", "a", "class", "hrTbp R8zArc"))
})

test_that("Entering characters that don't correspond to a valid tag produces a warning", {
  expect_warning(getDataForTag("https://play.google.com/store/apps/details?id=com.hulu.plus", ".", ".", "."))
})
