#' @title Inverse `%in%`
#'
#' @description Provides inverse version of R's `%in%` selection.
#' @param x A variable.
#' @param y  Another variable.
#' @keywords selection
#' @export
#' @seealso [base::match()], `browseVignettes("base")`
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' 5 %in% c(1, 5)
#' 5 %not.in% c(1, 5)
"%not.in%" <- function(x, y) !("%in%"(x, y))





#' @title Evaluate Trade Classification
#'
#' @description Evaluates if a particular trade data set provided in argument `tradecode` is available for the provided level of
#' aggregation in argument `ag`. Automatically switches to `HS (combined)` if argument `frequency = 'monthly'`.
#' Returns classification abbreviation `.px` for further processing of Comtrade download
#' @param ag Level of aggregation of trade data; varies by trade data set.
#' @param tradecode  Select trade database and classification to be extracted; default is `HS2007`;
#' monthly trade data only available following `HS` classification; the full list of possible trade classifications and their corresponding input
#' arguments used in the `comtradeRggregator` package are provided in *Table Supported Trade Classification*.
#' @param frequency   Frequency of data extract; either `annual` or `monthly`; default is `annual`.
#' @return Trade classification abbreviation `.px` for further processing of Comtrade download
#' @keywords selection
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' eval_ag(ag = "AG2", tradecode = "HS2007")
#' eval_ag(ag = "AG2", tradecode = "HS", frequency = "monthly")
eval_ag <- function(ag = ag,
                    tradecode = tradecode,
                    frequency = "annual") {


  ## Match classifications
  if (tradecode == "HS" | tolower(frequency) == "monthly") {
    .px <- "HS"
    is_ag <- c("AG2", "AG4", "AG6")
  } else if (tradecode == "HS1992") {
    .px <- "H0"
    is_ag <- c("AG2", "AG4", "AG6")
  } else if (tradecode == "HS1996") {
    .px <- "H1"
    is_ag <- c("AG2", "AG4", "AG6")
  } else if (tradecode == "HS2002") {
    .px <- "H2"
    is_ag <- c("AG2", "AG4", "AG6")
  } else if (tradecode == "HS2007") {
    .px <- "H3"
    is_ag <- c("AG2", "AG4", "AG6")
  } else if (tradecode == "HS2012") {
    .px <- "H4"
    is_ag <- c("AG2", "AG4", "AG6")
  } else if (tradecode == "HS2017") {
    .px <- "H5"
    is_ag <- c("AG2", "AG4", "AG6")
  } else if (tradecode == "SITC") {
    .px <- "ST"
    is_ag <- c("AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (tradecode == "SITCrev1") {
    .px <- "S1"
    is_ag <- c("AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (tradecode == "SITCrev2") {
    .px <- "S2"
    is_ag <- c("AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (tradecode == "SITCrev3") {
    .px <- "S3"
    is_ag <- c("AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (tradecode == "SITCrev4") {
    .px <- "S4"
    is_ag <- c("AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (tradecode == "BEC") {
    .px <- "BEC"
    is_ag <- c("AG1", "AG2", "AG3")
  } else {
    stop("\nVariable 'tradecode' incorrectly specified.\n")
  }

  ## Evaluate matching classifications
  if (sum(ag %in% is_ag) != length(ag)) {
    ag_missing <- ag[ag %in% is_ag == FALSE]
    stop("\nSpecified aggregate(s) '", paste0(ag_missing, collapse = "', '"), "' not reported in selected trade data base.\nSelected trade data base '", tradecode, "' reportes in aggregated commodity codes: '", paste0(is_ag, collapse = "','"), "'.\nPlease see https://comtrade.un.org for more information.\n")
  } else {
    return(.px)
  }
}




#' @title Evaluate String Scalar
#'
#' @description Evaluates if passed object `x` is a string scalar, i.e. a a character string of length 1.
#' @param x An object
#' @return  Boolean expression.
#' @keywords string scalar
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' is.strsclr("1")
#' is.strsclr(c("1", "a")) == FALSE
is.strsclr <- function(x) is.character(x) && length(x) == 1



#' @title Check Input Arguments
#'
#' @description Evaluates if input arguments for function  `download_Comtrade()` provided to parameter `.is` match expected arguments provided to parameter `.ok`.
#' @param is Object passing provided argument(s).
#' @param ok Object passing expected argument(s).
#' @param arg Name of parameter evaluated; needed for return error message
#' @keywords check arguments
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' check_args(is = c("a"), ok = ("a"), arg = "test")
check_args <- function(is, ok, arg) {
  if (is %in% ok != TRUE) {
    stop(paste0("Variable '", arg, "' incorrectly specified."))
  }
}



#' @title Generate Leading Zeros
#'
#' @description Returns vectors with `x` repeated zeros based on input vector containing `x`;
#' @param x Numeric vector.
#' @keywords leading zero
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' gen_lzs(c(1,2,5))
gen_lzs <- function(x) {
  if (is.numeric(x)) {
    lz <- function(x) {
      paste0(rep("0", x), collapse = "")
    }
    sapply(x, lz)
  } else {
    stop("Input argument must be of class numeric.")
  }
}
