# Our file is called "test-convert_Comtrade.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package



test_that("convert_Comtrade returns a data frame of length 1", {
  dat <- tibble("commodity_code" = c("220110"))
  out <- convert_Comtrade(dat,
    classification.from = "H3",
    classification.to = "I3"
  )

  expect_s3_class(out, "data.frame")
  expect_equal(nrow(out), 1)
})


test_that("convert_Comtrade returns a warning message", {
  dat <- tibble("commodity_code" = c("220110", "000001"))
  out <- function() {
    convert_Comtrade(dat,
      classification.from = "H3",
      classification.to = "I3"
    )
  }
  expect_warning(out())
})


test_that("convert_Comtrade returns an error message", {
  dat <- tibble("commodity_code" = c("01"))
  out <- function() {
    convert_Comtrade(dat,
      classification.from = "H3",
      classification.to = "I3"
    )
  }

  expect_error(out())
})


test_that("convert_Comtrade returns an error message as classification doesn't exist ", {
  dat <- tibble("commodity_code" = c("01"))
  out <- function() {
    convert_Comtrade(dat,
      classification.from = "H",
      classification.to = "I3"
    )
  }

  expect_error(out())
})


test_that("convert_Comtrade returns an error message as concordence does not exist", {
  dat <- tibble("commodity_code" = c("220110"))
  out <- function() {
    convert_Comtrade(dat,
      classification.from = "H3",
      classification.to = "I4"
    )
  }

  expect_error(out())
})


test_that("convert_Comtrade returns data frame of length 2", {
  dat <- tibble("commodity_code" = c("1543", "2720"))
  out <- convert_Comtrade(dat,
    classification.from = "I3",
    classification.to = "I31"
  )

  expect_s3_class(out, "data.frame")
  expect_equal(nrow(out), 2)
})

