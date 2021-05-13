# Our file is called "test-update_ComtradeDA.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package

test_that("remove temporary files of folder that exists", {
  rm1 <- function() rm_temporaryFiles(location.temporaryFiles = NULL)

  expect_message(rm1(), "Temporary*")
})


test_that("remove temporary files of folder that does not exist (wrong class)", {
  rm1 <- function() rm_temporaryFiles(location.temporaryFiles = 12)

  expect_error(rm1(), "Location for temporary files defined incorrectly.*")
})


test_that("remove temporary files of folder that does not exist (wrong location)", {
  rm1 <- function() rm_temporaryFiles(location.temporaryFiles = "random location")

  expect_error(rm1(), "Location for temporary files defined incorrectly.*")
})
