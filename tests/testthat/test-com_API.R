test_that("check_token() checks if no token provided", {
  no_token <- function() check_token()
  expect_message(
    no_token(),
    "*No Comtrade token specified"
  )
})

test_that("check_token() checks if incorrect token provided", {
  bad_token <- "SomBadToken"
  no_token <- function() check_token(token = bad_token)
  expect_message(
    no_token(),
    "*Comtrade token incorrect"
  )
})
