test_that("download_Comtrade returns a data frame", {
  AT_World <- download_Comtrade(
    year = "2018",
    frequency = "annual",
    countries = "Austria",
    partners = "World",
    nomenclature = "HS2007",
    commodity = "ag6",
    direction = "all",
    type = "commodities",
    select.stats = "all",
    token = Sys.getenv("COMTRADE_TOKEN"),
    ext_cnt = 5,
    is.mirrorData = FALSE,
    rm.temporaryFiles = TRUE,
    location.temporaryFiles = NULL,
    sleep = 5
  )

  expect_s3_class(AT_World, "data.frame")
})


test_that("download_Comtrade returns a data frame, temporary files user location", {
  loc_path <- system.file(package = "comtradeRggregator")
  loc <- paste0(loc_path, "/tests-data")
  dir.create(loc)

  DE_World <- download_Comtrade(
    year = "2007",
    frequency = "annual",
    countries = "Germany",
    partners = "World",
    nomenclature = "HS2007",
    commodity = "ag6",
    direction = "all",
    type = "commodities",
    select.stats = "all",
    token = Sys.getenv("COMTRADE_TOKEN"),
    ext_cnt = 5,
    is.mirrorData = FALSE,
    rm.temporaryFiles = TRUE,
    location.temporaryFiles = loc,
    sleep = 5
  )

  expect_s3_class(DE_World, "data.frame")

  unlink(loc, recursive = TRUE)
})



test_that("download_Comtrade returns NULL if build.Comtraede != TRUE", {
  AT_World <- download_Comtrade(
    year = "2018",
    frequency = "annual",
    countries = "Austria",
    partners = "World",
    nomenclature = "HS2007",
    commodity = "ag6",
    direction = "all",
    type = "commodities",
    select.stats = "all",
    token = Sys.getenv("COMTRADE_TOKEN"),
    ext_cnt = 5,
    build.Comtrade = FALSE,
    is.mirrorData = FALSE,
    rm.temporaryFiles = TRUE,
    location.temporaryFiles = NULL,
    sleep = 20
  )

  expect_equal(AT_World, NULL)
})





test_that("download_Comtrade fails if country doesn't exist", {
  AT_World <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "annual",
      countries = "Atlantis",
      partners = "World",
      nomenclature = "HS2012",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = Sys.getenv("COMTRADE_TOKEN"),
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
      nomenclature = "HS2012",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = Sys.getenv("COMTRADE_TOKEN"),
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
      nomenclature = "HS2012",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = Sys.getenv("COMTRADE_TOKEN"),
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
      nomenclature = "HS2012",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = Sys.getenv("COMTRADE_TOKEN"),
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
      nomenclature = "HS99",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = Sys.getenv("COMTRADE_TOKEN"),
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
      nomenclature = "HS2017",
      commodity = "ag22",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = Sys.getenv("COMTRADE_TOKEN"),
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
      nomenclature = "HS2017",
      commodity = "ag6",
      direction = "net exports",
      type = "commodities",
      select.stats = "all",
      token = Sys.getenv("COMTRADE_TOKEN"),
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
      nomenclature = "HS2017",
      commodity = "ag6",
      direction = "exports",
      type = "services",
      select.stats = "all",
      token = Sys.getenv("COMTRADE_TOKEN"),
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
      nomenclature = "HS2017",
      commodity = "ag6",
      direction = "exports",
      type = "commodities",
      select.stats = "mystats",
      token = Sys.getenv("COMTRADE_TOKEN"),
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err9 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "monthly",
      month = 13,
      countries = "Australia",
      partners = "NoCountries",
      nomenclature = "HS2017",
      commodity = "ag6",
      direction = "exports",
      type = "commodities",
      select.stats = "mystats",
      token = Sys.getenv("COMTRADE_TOKEN"),
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err10 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "annual",
      countries = "Austria",
      partners = "World",
      nomenclature = "HS2012",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "some",
      token = Sys.getenv("COMTRADE_TOKEN"),
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  err11 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "annual",
      countries = "Austria",
      partners = "World",
      nomenclature = "HS2012",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "some",
      token = Sys.getenv("COMTRADE_TOKEN"),
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = 42,
      sleep = 10
    )
  }

  err12 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "annual",
      countries = "Austria",
      partners = NULL,
      nomenclature = "HS2012",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "some",
      token = Sys.getenv("COMTRADE_TOKEN"),
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = 42,
      sleep = 10
    )
  }

  err13 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "annual",
      countries = "Austria",
      partners = "Atlantis",
      nomenclature = "HS2012",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "some",
      token = Sys.getenv("COMTRADE_TOKEN"),
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = 42,
      sleep = 10
    )
  }

  err14 <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "annual",
      countries = "Austria",
      partners = "World",
      nomenclature = "HS2007",
      commodity = "ag6",
      direction = c("imports", "exploits"),
      type = "commodities",
      select.stats = "trade_value_usd",
      token = Sys.getenv("COMTRADE_TOKEN"),
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 5
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
  expect_error(err9())
  expect_error(err10())
  expect_error(err11())
  expect_error(err12())
  expect_error(err13())
  expect_error(err14())
})


test_that("download_Comtrade returns consistent mirror data", {
  download_Comtrade(
    year = c("2018"),
    frequency = "annual",
    month = NULL,
    countries = "Germany",
    partners = "Austria",
    nomenclature = "HS2007",
    commodity = c("ag6"),
    select.stats = "trade_value_usd",
    direction = "imports",
    type = "commodities",
    rm.temporaryFiles = TRUE,
    token = Sys.getenv("COMTRADE_TOKEN"),
    ext_cnt = 5,
    is.mirrorData = FALSE,
    location.temporaryFiles = NULL,
    sleep = 30
  ) -> IM_DE_AT

  download_Comtrade(
    year = c("2018"),
    frequency = "annual",
    month = NULL,
    countries = "Austria",
    partners = "Germany",
    nomenclature = "HS2007",
    commodity = c("ag6"),
    select.stats = "trade_value_usd",
    direction = "exports",
    type = "commodities",
    rm.temporaryFiles = TRUE,
    token = Sys.getenv("COMTRADE_TOKEN"),
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

test_that("download_Comtrade fails if no monthly data for country available", {
  AT_World <- function() {
    download_Comtrade(
      year = "2018",
      frequency = "monthly",
      month = "01",
      countries = "Austria",
      partners = "World",
      nomenclature = "HS2012",
      commodity = "ag6",
      direction = "all",
      type = "commodities",
      select.stats = "all",
      token = Sys.getenv("COMTRADE_TOKEN"),
      ext_cnt = 5,
      is.mirrorData = FALSE,
      rm.temporaryFiles = TRUE,
      location.temporaryFiles = NULL,
      sleep = 10
    )
  }

  expect_error(AT_World())
})


test_that("download_Comtrade takes 12 months as default monthly argument", {
  OZ_World <- download_Comtrade(
    year = "2018",
    frequency = "monthly",
    month = NULL,
    countries = "Australia",
    partners = "World",
    nomenclature = "HS2012",
    commodity = c("650100"),
    direction = "all",
    type = "commodities",
    select.stats = "all",
    token = Sys.getenv("COMTRADE_TOKEN"),
    ext_cnt = 5,
    is.mirrorData = FALSE,
    rm.temporaryFiles = TRUE,
    location.temporaryFiles = NULL,
    sleep = 6
  )

  expect_s3_class(OZ_World, "data.frame")
  expect_equal(ncol(OZ_World), 16)
})



test_that("download_Comtrade accepts commodity codes for different AG", {
  AT_DE <- download_Comtrade(
    year = "2018",
    frequency = "annual",
    countries = "Austria",
    partners = "Germany",
    nomenclature = "HS2007",
    commodity = c("65", "6501", "650100"),
    direction = "all",
    type = "commodities",
    select.stats = "all",
    token = Sys.getenv("COMTRADE_TOKEN"),
    ext_cnt = 5,
    is.mirrorData = FALSE,
    rm.temporaryFiles = TRUE,
    location.temporaryFiles = NULL,
    sleep = 5
  )

  expect_s3_class(AT_DE, "data.frame")
  expect_true(identical(
    AT_DE %>%
      distinct(commodity_code) %>% pull(),
    c("65", "6501", "650100")
  ))
})
