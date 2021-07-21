# Our file is called "test-convert_Comtrade.R"
library(testthat) # load testthat package
#local_edition(3)
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


test_that("convert_Comtrade returns an error message as classification
          doesn't exist", {
  dat <- tibble("commodity_code" = c("01"))
  out <- function() {
    convert_Comtrade(dat,
      classification.from = "H",
      classification.to = "I3"
    )
  }

  expect_error(out())
})


test_that("convert_Comtrade returns an error message as concordence
          does not exist", {
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

test_that("convert_Comtrade checks for correct length of classification", {
  dat <- tibble("commodity_code" = c("1"))

  err1 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "BE"
    )
  }
  err2 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "CC"
    )
  }
  err3 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "CP"
    )
  }
  err4 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "H0"
    )
  }
  err5 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "H1"
    )
  }
  err6 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "H2"
    )
  }
  err7 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "H3"
    )
  }
  err8 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "H4"
    )
  }
  err9 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "I2"
    )
  }
  err10 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "I3"
    )
  }
  err11 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "IU"
    )
  }
  err12 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "MT"
    )
  }
  err13 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "S1"
    )
  }
  err14 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "S2"
    )
  }
  err15 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "S3"
    )
  }
  err16 <- function() {
    convert_Comtrade(dat,
      classification.from = "HS",
      classification.to = "S4"
    )
  }
  err17 <- function() {
    convert_Comtrade(dat,
      classification.from = "H5",
      classification.to = "H4"
    )
  }
  err18 <- function() {
    convert_Comtrade(dat,
      classification.from = "H4",
      classification.to = "I31"
    )
  }
  err19 <- function() {
    convert_Comtrade(dat,
      classification.from = "I31",
      classification.to = "I4"
    )
  }
  err20 <- function() {
    convert_Comtrade(dat,
      classification.from = "H3",
      classification.to = "MT"
    )
  }
  err21 <- function() {
    convert_Comtrade(dat,
      classification.from = "H4",
      classification.to = "BE5"
    )
  }

  expect_error(err1())
  expect_error(err2())
  expect_error(err3())
  expect_error(err4())
  expect_error(err5())
  expect_error(err6())
  expect_error(err7())
  expect_error(err8())
  expect_error(err9())
  expect_error(err10())
  expect_error(err11())
  expect_error(err12())
  expect_error(err13())
  expect_error(err14())
  expect_error(err15())
  expect_error(err16())
  expect_error(err17())
  expect_error(err18())
  expect_error(err19())
  expect_error(err20())
  expect_error(err21())
})
