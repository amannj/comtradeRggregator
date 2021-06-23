# Our file is called "test-update_ComtradeDA.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package


## Remove old DA file -------------
test_that("Update ComtradeDA", {

  loc_path <- paste0(system.file(package = "comtradeRggregator"), "/data")

  Comtrade_DA <- tibble('is' = 'old')
  save(Comtrade_DA, file = paste0(loc_path, '/Comtrade_DataAvailability-2021-01-01.rda'))

  data <- update_ComtradeDA()
  expect_s3_class(data, "data.frame")
})


## Use same test twice on a 'new' day to check all code blocks ---------
test_that("Update ComtradeDA", {
  data <- update_ComtradeDA()
  expect_s3_class(data, "data.frame")
})


test_that("Update ComtradeDA", {
  data <- update_ComtradeDA()
  expect_s3_class(data, "data.frame")
})



