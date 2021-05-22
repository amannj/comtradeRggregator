# Our file is called "test-isavailable_Comtrade.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package



test_that("is.available_Comtrade returns list of all available countries", {
  da1 <- is.available_Comtrade(
    frequency = "annual",
    tradecode = "H3",
    year = "2008"
  )

  expect_type(da1, "character")
})


test_that("is.available_Comtrade returns evaluated list of all available countries", {
  da2 <- is.available_Comtrade(
    is.contained = c("Austria", "Germany"),
    frequency = "annual",
    tradecode = "H2",
    year = "2012"
  )
  expect_true(da2[1])
  expect_true(da2[2])
})


test_that("is.available_Comtrade returns evaluated list of all available countries", {
  da3 <- function() {
    is.available_Comtrade(
      is.contained = c("Austria", "Germany"),
      frequency = "monthly",
      month = "01",
      tradecode = "H3",
      year = "2020"
    )
  }
  expect_message(da3())
})


test_that("is.available_Comtrade returns evaluated list of all available countries", {
  da3 <- is.available_Comtrade(
    is.contained = c("Austria", "Germany"),
    frequency = "monthly",
    month = "01",
    tradecode = "H3",
    year = "2020"
  )
  expect_false(da3[1])
  expect_true(da3[2])
})


test_that("is.available_Comtrade returns evaluated list of all available countries", {
  da4 <- is.available_Comtrade(
    is.contained = "ustr",
    is.fuzzy = TRUE,
    frequency = "annual",
    tradecode = "HS2017",
    year = "2019"
  )

  expect_equal(da4[1], "Australia")
  expect_equal(da4[2], "Austria")
})


test_that("is.available_Comtrade returns evaluated list of all available countries", {
  da4 <- is.available_Comtrade(
    is.contained = "ustr",
    is.fuzzy = TRUE,
    frequency = "monthly",
    tradecode = "HS2017",
    year = "2019",
    month = "05"
  )
  expect_equal(da4[1], "Australia")
})
