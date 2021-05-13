# Our file is called "test-update_ComtradeDA.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package

## Use same test twice on a 'new' day to check all code blocks
test_that("Update ComtradeDA", {
  data <- update_ComtradeDA()
  expect_s3_class(data, "data.frame")
})

test_that("Update ComtradeDA", {
  data <- update_ComtradeDA()
  expect_s3_class(data, "data.frame")
})
