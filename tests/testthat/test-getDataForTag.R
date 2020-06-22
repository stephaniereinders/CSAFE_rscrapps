context("getDataForTag")

test_that("app_url is a character", {
  expect_error(getDataForTag(50, "a","class","hrTbp R8zArc"))
})

test_that("app_url is a valid url", {
  expect_error(getDataForTag("frogs", "a","class","hrTbp R8zArc"))
})

test_that("app_url starts with the string https://play.google.com/store/apps/details?id=", {
  expect_error(getDataForTag("www.google.com", "a","class","hrTbp R8zArc"))
})
