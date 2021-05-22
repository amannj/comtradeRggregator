# Our file is called "test-rm_temporaryFiles.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package



test_that("remove temporary files of folder that exists but file does not exist", {
  rm1 <- function() rm_temporaryFiles(location.temporaryFiles = NULL)

  expect_message(rm1(), "Temporary*")
})


test_that("remove temporary files of folder that exists and file exists", {
  loc_path <- system.file(package = "comtradeRggregator")
  loc <- paste0(loc_path, "/tests-data")
  dir.create(loc)

  df <- tibble(a = c(1, 2, 3))
  saveRDS(df, paste0(loc, "/df.rds"))

  rm1 <- function() rm_temporaryFiles(location.temporaryFiles = loc)
  expect_message(rm1(), "Temporary*")

  unlink(loc, recursive = TRUE)
})


test_that("try to remove temporary files of folder that does not exist (wrong class)", {
  rm1 <- function() rm_temporaryFiles(location.temporaryFiles = 12)

  expect_error(rm1(), "Location for temporary files defined incorrectly.*")
})


test_that("try to remove temporary files of folder that does not exist (wrong location)", {
  rm1 <- function() rm_temporaryFiles(location.temporaryFiles = "random location")

  expect_error(rm1(), "Location for temporary files defined incorrectly.*")
})
