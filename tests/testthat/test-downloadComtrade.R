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
    sleep = 10
  )


  expect_s3_class(AT_World, "data.frame")
})


test_that("download_Comtrade returns consistent mirror data", {

  download_Comtrade(
    year = c("2018"), #  Years for which to extract
    frequency = "annual", #  or "monthly"
    month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
    countries = "Germany", # Select list of countries to be extracted; default is 'all'
    partners = "Austria", # either 'world' (all countries) or specific country name(s)
    tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
    ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
    select.stats = "trade_value_usd",
    direction = "imports", # imports, exports, re-imports, re-exports or all; default is all
    type = "commodities", # services not available
    rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
    token = mytoken, # set Comtrade token;
    ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
    is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
    location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
  ) -> IM_DE_AT

  download_Comtrade(
    year = c("2018"), #  Years for which to extract
    frequency = "annual", #  or "monthly"
    month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
    countries = "Austria", # Select list of countries to be extracted; default is 'all'
    partners = "Germany", # either 'world' (all countries) or specific country name(s)
    tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
    ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
    select.stats = "trade_value_usd",
    direction = "exports", # imports, exports, re-imports, re-exports or all; default is all
    type = "commodities", # services not available
    rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
    token = mytoken, # set Comtrade token;
    ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
    is.mirrorData = TRUE, # Extract mirrored trade data; only one country supported at the moment
    location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
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

  AT_World <- function() download_Comtrade(
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

  expect_error(rm1())
})


test_that("download_Comtrade fails if no reasonable input arguments are provided", {

  err1 <- function() download_Comtrade(
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

  err2 <- function() download_Comtrade(
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

  err3 <- function() download_Comtrade(
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

  err4 <- function() download_Comtrade(
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

  err5 <- function() download_Comtrade(
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

  err6 <- function() download_Comtrade(
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

  err7 <- function() download_Comtrade(
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

  err8 <- function() download_Comtrade(
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

  expect_error(rm1())
  expect_error(rm2())
  expect_error(rm3())
  expect_error(rm4())
  expect_error(rm5())
  expect_error(rm6())
  expect_error(rm7())
  expect_error(rm8())
})


test_that("download_Comtrade fails if no monthly data for country available", {

  AT_World <- function() download_Comtrade(
    year = "2018",
    frequency = "monthly",
    month = '01',
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

  expect_error(rm1())
})
