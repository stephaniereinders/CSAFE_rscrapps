context("getDataForTag")

test_that("app_url is a character", {
  expect_error(getDataForTag(50, "a", "class", "hrTbp R8zArc"))
})

test_that("app_url starts with the string https://play.google.com/store/apps/details?id=", {
  expect_error(getDataForTag("www.google.com", "a", "class", "hrTbp R8zArc"))
})

test_that("html_tag, html_attribute, and html_attribute_value are characters", {
  expect_error(getDataForTag("https://play.google.com/store/apps/details?id=com.dinaga.photosecret", 1, "class", "hrTbp R8zArc"))
  expect_error(getDataForTag("https://play.google.com/store/apps/details?id=com.dinaga.photosecret", "div", 1, "hrTbp R8zArc"))
  expect_error(getDataForTag("https://play.google.com/store/apps/details?id=com.dinaga.photosecret", "div", "class", 1))
})
