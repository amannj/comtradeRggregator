# Our file is called "test-update_ComtradeDA.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package

test_that("Update ComtradeDA", {
  data <- update_ComtradeDA()
  expect_s3_class(data, "data.frame")
})

