# Our file is called "test-rm_temporaryFiles.R"
library(testthat) # load testthat package
#local_edition(3)
library(comtradeRggregator) # load package



test_that("remove temporary files of folder that exists
          but file does not exist", {
  msg1 <- function() rm_temporaryFiles(location.temporaryFiles = NULL)

  expect_message(msg1(), "Temporary*")
})


test_that("remove temporary files of folder that exists and file exists", {

  loc_path <- system.file(package = "comtradeRggregator")
  loc <- paste0(loc_path, "/tests-data")
  dir.create(loc)

  df <- tibble(a = c(1, 2, 3))
  saveRDS(df, paste0(loc, "/df.rds"))

  msg2 <- function() rm_temporaryFiles(location.temporaryFiles = loc)
  expect_message(msg2(), "Temporary files deleted.")

  msg3 <- function() rm_temporaryFiles(location.temporaryFiles = loc)
  expect_message(msg3(), "Temporary directory already empty.*")

  unlink(loc, recursive = TRUE)
})


test_that("try to remove temporary files of folder that does
          not exist (wrong class)", {
  err1 <- function() rm_temporaryFiles(location.temporaryFiles = 12)

  expect_error(err1())
})


test_that("try to remove temporary files of folder that does
          not exist (wrong location)", {
  err2 <- function() rm_temporaryFiles(
    location.temporaryFiles = "random location")

  expect_error(err2())
})
