context("getDataForApps")

test_that("search term is not a variable", {
  expect_error(getDataForApps(mtcars))
})

test_that("num_apps must be a positive integer or 'all'", {
  expect_error(getDataForApps("games",-1))
})

# test_that("search term is a character", {
#   expect_error(getDataForApps(50))
# })
#
# test_that("search term is non-empty", {
#   expect_error(getDataForApps(""))
# })
#
# test_that("num_apps is not a positive integer and not 'all'", {
#   expect_error(getDataForApps("steganography", num_apps = 3.4))
#   expect_error(getDataForApps("steganography", num_apps = 0))
#   expect_error(getDataForApps("steganography", num_apps = "five"))
#   expect_error(getDataForApps("steganography", num_apps = "5"))
# })

