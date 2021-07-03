# Our file is called "test-download_ComtradeDA.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package

mytoken <- "lhsmuyUVrMuKuxtet0TbbJdfVUChniTF2DqR8kUxb9PqNxf2aQ+AqE+BwKHKycyg84HWaXUszKnPCKJ8zO5eFqoANzWiPaGX7dX/XEUAO0jImhk6ro/YqiL4hsPn4VLxHK5hSnE8vsHebKzR28GjyA=="
mytempDirectory <- "C:/Users/juerg/Desktop/tmp"


test_that("download_Comtrade returns a data frame", {
  AT_World <- download_Comtrade(
    year = "2018",
    frequency = "annual",
    countries = "Austria",
    partners = "World",
    tradecode = "HS2007",
    ag = "ag6",
    direction = "all",
    type = "commodities",
    select.stats = "all",
    token = mytoken,
    ext_cnt = 5,
    is.mirrorData = FALSE,
    rm.temporaryFiles = TRUE,
    location.temporaryFiles = NULL,
    sleep = 5
  )

  expect_s3_class(AT_World, "data.frame")
})


test_that("download_Comtrade returns consistent mirror data", {
  download_Comtrade(
    year = c("2018"),
    frequency = "annual",
    month = NULL,
    countries = "Germany",
    partners = "Austria",
    tradecode = "HS2007",
    ag = c("ag6"),
    select.stats = "trade_value_usd",
    direction = "imports",
    type = "commodities",
    rm.temporaryFiles = TRUE,
    token = mytoken,
    ext_cnt = 5,
    is.mirrorData = FALSE,
    location.temporaryFiles = NULL
  ) -> IM_DE_AT

  download_Comtrade(
    year = c("2018"),
    frequency = "annual",
    month = NULL,
    countries = "Austria",
    partners = "Germany",
    tradecode = "HS2007",
    ag = c("ag6"),
    select.stats = "trade_value_usd",
    direction = "exports",
    type = "commodities",
    rm.temporaryFiles = TRUE,
    token = mytoken,
    ext_cnt = 5,
    is.mirrorData = TRUE,
    location.temporaryFiles = NULL
  ) -> mirrX_AT_DE

  IM_DE_AT %>%
    summarise(sum(trade_value_usd)) %>%
    pull() / mirrX_AT_DE %>%
      summarise(sum(trade_value_usd)) %>%
      pull() -> s_out


  expect_s3_class(IM_DE_AT, "data.frame")
  expect_s3_class(mirrX_AT_DE, "data.frame")
  expect_equal(s_out, 1)
})


test_that("download_Comtrade fails if country doesn't exist", {
  AT_World <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "annual",
      countries = "Atlantis",
      partners = "World",
      tradecode = "HS2012",
      ag = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  expect_error(AT_World())
})


test_that("download_Comtrade fails if no reasonable input arguments
          are provided", {
  err1 <- function() {
    download_Comtrade(
      year = "5018",
      frequency = "annual",
      countries = "Austria",
      partners = "World",
      tradecode = "HS2012",
      ag = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err2 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "daily",
      countries = "Austria",
      partners = "World",
      tradecode = "HS2012",
      ag = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err3 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "daily",
      countries = "Austria",
      partners = "NoCountries",
      tradecode = "HS2012",
      ag = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err4 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "daily",
      countries = "Austria",
      partners = "NoCountries",
      tradecode = "HS99",
      ag = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err5 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "daily",
      countries = "Austria",
      partners = "NoCountries",
      tradecode = "HS2017",
      ag = "ag22",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err6 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "daily",
      countries = "Austria",
      partners = "NoCountries",
      tradecode = "HS2017",
      ag = "ag6",
      direction = "net exports",
      type = "commodities",
      select.stats = "all",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err7 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "daily",
      countries = "Austria",
      partners = "NoCountries",
      tradecode = "HS2017",
      ag = "ag6",
      direction = "exports",
      type = "services",
      select.stats = "all",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err8 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "daily",
      countries = "Austria",
      partners = "NoCountries",
      tradecode = "HS2017",
      ag = "ag6",
      direction = "exports",
      type = "commodities",
      select.stats = "mystats",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
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
})


test_that("download_Comtrade fails if no monthly data for country available", {
  AT_World <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "monthly",
      month = "01",
      countries = "Austria",
      partners = "World",
      tradecode = "HS2012",
      ag = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = mytoken,
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  expect_error(AT_World())
})
