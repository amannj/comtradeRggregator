# Our file is called "test-utils.R" - we test all utils.R functions
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load our package



# Test %not.in% ----------
test_that("%not.in% TRUE or FALSE", {
  is.not.in <- 5 %not.in% c(1, 5)
  expect_false(is.not.in)
})

test_that("%not.in% TRUE or FALSE", {
  is.not.in <- 10 %not.in% c(1, 5)
  expect_true(is.not.in)
})



# Test eval_ag --------
## Tradecoe false
test_that("eval_ag evaluates if tradecode and ag match", {
  ag0 <- function() eval_ag(ag = c("AG2"), tradecode = "S5", frequency = "annual")
  expect_error(ag0(), "Tradecode*")
})

## HS correct
test_that("eval_ag checks ag and returns tradecode abbreviation", {
  ag1 <- eval_ag(ag = c("AG2", "AG4", "AG6"), tradecode = "HS", frequency = "annual")
  expect_equal(ag1, "HS")
})
test_that("eval_ag checks ag and returns tradecode abbreviation", {
  ag1 <- eval_ag(ag = c("AG2", "AG4", "AG6"), tradecode = "H0", frequency = "annual")
  expect_equal(ag1, "H0")
})
test_that("eval_ag checks ag and returns tradecode abbreviation", {
  ag1 <- eval_ag(ag = c("AG2", "AG4", "AG6"), tradecode = "H1", frequency = "annual")
  expect_equal(ag1, "H1")
})
test_that("eval_ag checks ag and returns tradecode abbreviation", {
  ag1 <- eval_ag(ag = c("AG2", "AG4", "AG6"), tradecode = "H2", frequency = "annual")
  expect_equal(ag1, "H2")
})
test_that("eval_ag checks ag and returns tradecode abbreviation", {
  ag1 <- eval_ag(ag = c("AG2", "AG4", "AG6"), tradecode = "H3", frequency = "annual")
  expect_equal(ag1, "H3")
})
test_that("eval_ag checks ag and returns tradecode abbreviation", {
  ag1 <- eval_ag(ag = c("AG2", "AG4", "AG6"), tradecode = "H4", frequency = "annual")
  expect_equal(ag1, "H4")
})
test_that("eval_ag checks ag and returns tradecode abbreviation", {
  ag1 <- eval_ag(ag = c("AG2", "AG4", "AG6"), tradecode = "H5", frequency = "annual")
  expect_equal(ag1, "H5")
})
test_that("eval_ag checks ag and returns tradecode abbreviation", {
  ag1 <- eval_ag(ag = c("AG1", "AG2", "AG3"), tradecode = "BE", frequency = "annual")
  expect_equal(ag1, "BE")
})
# tradecode and wrong AG
test_that("eval_ag checks if ag and tradecodes don't match", {
  ag_HS <- function() eval_ag(ag = c("AGx"), tradecode = "HS", frequency = "annual")
  ag_H0 <- function() eval_ag(ag = c("AGx"), tradecode = "HS1992", frequency = "annual")
  ag_H1 <- function() eval_ag(ag = c("AGx"), tradecode = "HS1996", frequency = "annual")
  ag_H2 <- function() eval_ag(ag = c("AGx"), tradecode = "HS2002", frequency = "annual")
  ag_H3 <- function() eval_ag(ag = c("AGx"), tradecode = "HS2007", frequency = "annual")
  ag_H4 <- function() eval_ag(ag = c("AGx"), tradecode = "HS2012", frequency = "annual")
  ag_H5 <- function() eval_ag(ag = c("AGx"), tradecode = "HS2017", frequency = "annual")
  ag_ST <- function() eval_ag(ag = c("AGx"), tradecode = "SITC", frequency = "annual")
  ag_S1 <- function() eval_ag(ag = c("AGx"), tradecode = "SITCrev1", frequency = "annual")
  ag_S2 <- function() eval_ag(ag = c("AGx"), tradecode = "SITCrev2", frequency = "annual")
  ag_S3 <- function() eval_ag(ag = c("AGx"), tradecode = "SITCrev3", frequency = "annual")
  ag_S4 <- function() eval_ag(ag = c("AGx"), tradecode = "SITCrev4", frequency = "annual")
  ag_BE <- function() eval_ag(ag = c("AGx"), tradecode = "BEC", frequency = "annual")

  lapply(list(
    "ag_HS", "ag_H0",
    "ag_H3", "ag_H4",
    "ag_H5", "ag_ST",
    "ag_S1", "ag_S2",
    "ag_S3", "ag_S4",
    "ag_BE"
  ), function(x) {
    expect_error(do.call(x, list()), "Specified aggregate(s)*")
  })
})



# Test evaluate string scalar --------
test_that("is string scalar", {
  strsclr1 <- is.strsclr("1")
  expect_true(strsclr1)

  strsclr2 <- is.strsclr(c("1", "a")) == FALSE
  expect_true(strsclr2)
})



# Test check_args --------
test_that("is string scalar", {
  args <- function() check_args(is = c("a"), ok = ("b"), arg = "test")
  expect_error(args(), "Variable 'test' incorrectly specified.")
})



# Test conversion of trade codes with convert_tradecodes --------
test_that("Test conversion of trade codes with convert_tradecodes", {
  df_tradecode <- tibble(
    "Abbr" = c(
      "HS",
      "H0",
      "H1",
      "H2",
      "H3",
      "H4",
      "H5",
      "ST",
      "S1",
      "S2",
      "S3",
      "S4",
      "BE",
      "CC",
      "CP",
      "GP",
      "IU",
      "MT",
      "I2",
      "I3",
      "I31",
      "I4"
    ),
    "Name" = c(
      "HS",
      "HS1992",
      "HS1996",
      "HS2002",
      "HS2007",
      "HS2012",
      "HS2017",
      "SITC",
      "SITCrev1",
      "SITCrev2",
      "SITCrev3",
      "SITCrev4",
      "BEC",
      "CCCN",
      "CPC",
      "GTAP",
      "SIC",
      "MTN",
      "ISICrev2",
      "ISICrev3",
      "ISICrev31",
      "ISICrev4"
    )
  )

  for (i in 1:nrow(df_tradecode)) {
    ag <- convert_tradecodes(tradecode = df_tradecode[i, 1] %>% pull(), return = "Name", eval = TRUE)
    expect_equal(ag, df_tradecode[i, 2] %>% pull())
  }
})
