test_that("Add_ldz tests", {
  df <- tibble(var = c("1", "11", "111"))
  data <- add_lzs(data = df, variable = "var", variable.length = 3)
  expect_s3_class(data, "data.frame")
  expect_equal(nrow(data), 3)
  expect_equal(data %>% pull() %>% .[1], "001")
  expect_equal(data %>% pull() %>% .[2], "011")
  expect_equal(data %>% pull() %>% .[3], "111")
})


test_that("gen_lzs() needs numeric input", {
  r1 <- function() gen_lzs('1')
  expect_error(r1())
})
