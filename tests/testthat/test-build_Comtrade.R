# Our file is called "test-build_Comtrade.R"
library(testthat) # load testthat package
# local_edition(3)
library(comtradeRggregator) # load package



test_that("build_Comtrade returns object 1 to 1 if no arguments are invoked", {
  loc_path <- system.file(package = "comtradeRggregator")
  loc <- paste0(loc_path, "/tests-data")
  dir.create(loc)

  df <- tibble(
    reporter = c(1, 2, 3),
    period = c(1, 2, 3),
    partner = c(1, 2, 3),
    trade_flow = c(1, 2, 3),
    commodity_code = c(1, 2, 3)
  )
  saveRDS(df, paste0(loc, "/df.rds"))

  out <- build_Comtrade(
    directory = loc,
    rm.temporaryFiles = TRUE,
    is.mirrorData = FALSE,
    partner = NULL
  )

  expect_s3_class(out, "data.frame")

  unlink(loc, recursive = TRUE)
})


test_that("build_Comtrade returns transformed object if
          arguments are invoked", {
  loc_path <- system.file(package = "comtradeRggregator")
  loc <- paste0(loc_path, "/tests-data")
  dir.create(loc)

  df <- tibble(
    "classification" = "H3",
    "period" = 2000,
    "commodity_code" = 1,
    "commodity" = "commodity",
    "reporter" = "Reporter",
    "partner" = "Partner",
    "trade_flow" = c("Import", "Export", "Re-Import", "Re-Export"),
    "trade_value_usd" = 1
  )
  saveRDS(df, paste0(loc, "/df.rds"))

  df <- build_Comtrade(
    directory = loc,
    rm.temporaryFiles = TRUE,
    is.mirrorData = TRUE,
    partner = "World"
  )

  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), 4)

  unlink(loc, recursive = TRUE)
})


test_that("build_Comtrade requires list of partner countries for
          mirror download", {
  loc_path <- system.file(package = "comtradeRggregator")
  loc <- paste0(loc_path, "/tests-data")
  dir.create(loc)

  df <- tibble(
    "classification" = "H3",
    "period" = 2000,
    "commodity_code" = 1,
    "commodity" = "commodity",
    "reporter" = "Reporter",
    "partner" = "Partner",
    "trade_flow" = c("Import", "Export", "Re-Import", "Re-Export"),
    "trade_value_usd" = 1
  )
  saveRDS(df, paste0(loc, "/df.rds"))

  df <- function() {
    build_Comtrade(
      directory = loc,
      rm.temporaryFiles = TRUE,
      is.mirrorData = TRUE,
      partner = NULL
    )
  }

  expect_error(df())
  unlink(loc, recursive = TRUE)
})


test_that("build_Comtrade returns NULL if input data frame is empty", {
  loc_path <- system.file(package = "comtradeRggregator")
  loc <- paste0(loc_path, "/tests-data")
  dir.create(loc)

  df <- tibble(
    "classification" = NA,
    "period" = NA,
    "commodity_code" = NA,
    "commodity" = NA,
    "reporter" = NA,
    "partner" = NA,
    "trade_flow" = NA,
    "trade_value_usd" = NA
  )
  saveRDS(df, paste0(loc, "/df.rds"))

  df <- function() {
    build_Comtrade(
      directory = loc,
      rm.temporaryFiles = TRUE,
      is.mirrorData = TRUE,
      partner = NULL
    )
  }

  expect_warning(df())
  unlink(loc, recursive = TRUE)
})
