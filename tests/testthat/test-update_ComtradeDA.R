## Remove old DA file -------------
test_that("Update ComtradeDA", {

  loc_path <- system.file(package = "comtradeRggregator")
  loc <- paste0(loc_path, "/tests-data")
  dir.create(loc)

  Comtrade_DA <- tibble('is' = 'old')
  save(Comtrade_DA, file = paste0(loc,
                                  '/Comtrade_DataAvailability-2021-01-01.rda'))

  data <- update_ComtradeDA(directory = loc)
  expect_s3_class(data, "data.frame")

  unlink(loc, recursive = TRUE)
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



