test_that("gen_CountryList tests annual", {
  dat <- gen_CountryList(
    type = "commodities",
    frequency = "annual",
    time = "2018",
    .px = "HS",
    time_count = 1
  )
  expect_type(dat, "character")
})


test_that("gen_CountryList tests monthly", {
  dat <- gen_CountryList(
    type = "commodities",
    frequency = "monthly",
    time = "2012-01",
    .px = "HS",
    time_count = 1
  )
  expect_type(dat, "character")
})


test_that("gen_lzs() needs numeric input", {
  r1 <- function() {
    gen_CountryList(
      type = "commodities",
      frequency = "quarterly",
      time = "2012-01",
      .px = "HS",
      time_count = 1
    )
  }
  expect_error(r1(), "Option*")
})
