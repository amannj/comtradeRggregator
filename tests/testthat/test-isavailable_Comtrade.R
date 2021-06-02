# Our file is called "test-isavailable_Comtrade.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package



test_that("is.available_Comtrade returns data frame", {
  da1 <- is.available_Comtrade(
    frequency = "annual",
    tradecode = "H3",
    year = "2008"
  )

  expect_s3_class(da1, "data.frame")
})


test_that("is.available_Comtrade returns evaluated list of all available countries", {
  da2 <- is.available_Comtrade(
    is.contained = c("Austria", "Germany"),
    frequency = "annual",
    tradecode = "H2",
    year = "2012"
  )
  expect_s3_class(da2, "data.frame")
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
  expect_s3_class(da3, "data.frame")
  expect_equal(nrow(da3), 1)
})


test_that("is.available_Comtrade returns evaluated list of all available countries", {
  da4 <- is.available_Comtrade(
    is.contained = "ustr",
    is.fuzzy = TRUE,
    frequency = "annual",
    tradecode = "HS2017",
    year = "2019"
  )

  expect_s3_class(da4, "data.frame")
  expect_equal(nrow(da4), 2)
})


test_that("is.available_Comtrade returns evaluated list of all available countries", {
  da5 <- is.available_Comtrade(
    is.contained = "ustr",
    is.fuzzy = TRUE,
    frequency = "monthly",
    tradecode = "HS2017",
    year = "2019",
    month = "05"
  )
  expect_s3_class(da5, "data.frame")
  expect_equal(nrow(da5), 1)
})

