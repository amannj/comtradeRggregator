#' @title Convert Comtrade Trade Data
#'
#' @description Adds leading zeros to variable `var` of data
#' frame such that `nchar(var) = length`.
#' @param data A data frame.
#' @param variable Name of variable to be transformed.
#' @param variable.length  The desired length of variable
#' `variable`; i.e. `nchar(length.variable)`.
#' @keywords leading
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' df <- tibble(var = c("1", "11", "111"))
#' add_lzs(data = df, variable = "var", variable.length = 3)
add_lzs <- function(data,
                    variable,
                    variable.length) {
  data %>%
    mutate(lz = variable.length - nchar(.data[[variable]])) %>%
    mutate(lz = paste0(gen_lzs(lz), .data[[variable]])) %>%
    mutate({{ variable }} := lz) %>%
    select(-lz)
}


#' @title Generate Leading Zeros
#'
#' @description Returns vectors with `x` repeated zeros based on
#' input vector containing `x`;
#' @param x Numeric vector.
#' @keywords leading zero
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' gen_lzs(c(1, 2, 5))
gen_lzs <- function(x) {
  if (is.numeric(x)) {
    lz <- function(x) {
      paste0(rep("0", x), collapse = "")
    }
    vapply(x, lz, character(1))
  } else {
    stop("Input argument must be of class numeric.")
  }
}
