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
#' @description Evaluates if a particular trade data set provided
#' in argument `nomenclature` is available for the provided level of
#' aggregation in argument `ag`. Automatically switches to
#' `HS (combined)` if argument `frequency = 'monthly'`.
#' Returns classification abbreviation `.px` for further processing
#' of Comtrade download
#' @param ag Level of aggregation of trade data; varies by trade data
#' set.
#' @param nomenclature  Select trade database and classification to be
#' extracted; default is `HS2007`;
#' monthly trade data only available following `HS` classification;
#'  for the full list of possible trade classifications and their
#'  corresponding input arguments used in the `comtradeRggregator`
#'  package please see the list of all supported trade classifications (
#'  [link](amannj.github.io/resources/comtradeRggregator/index.html#trade-classifications)).
#' @param frequency   Frequency of data extract; either `annual` or
#' `monthly`; default is `annual`.
#' @return Trade classification abbreviation `.px` for further processing
#' of Comtrade download
#' @keywords selection
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' eval_ag(ag = "AG2", nomenclature = "HS2007")
#' eval_ag(ag = "AG2", nomenclature = "HS", frequency = "monthly")
eval_ag <- function(ag = ag,
                    nomenclature = nomenclature,
                    frequency = "annual") {

  ## Match classifications
  .px <- convert_nomenclature(nomenclature = nomenclature, return = "Abbr", eval = TRUE)

  if (.px == "HS" | tolower(frequency) == "monthly") {
    is_ag <- c("TOTAL", "AG2", "AG4", "AG6")
  } else if (.px == "H0") {
    is_ag <- c("TOTAL", "AG2", "AG4", "AG6")
  } else if (.px == "H1") {
    is_ag <- c("TOTAL", "AG2", "AG4", "AG6")
  } else if (.px == "H2") {
    is_ag <- c("TOTAL", "AG2", "AG4", "AG6")
  } else if (.px == "H3") {
    is_ag <- c("TOTAL", "AG2", "AG4", "AG6")
  } else if (.px == "H4") {
    is_ag <- c("TOTAL", "AG2", "AG4", "AG6")
  } else if (.px == "H5") {
    is_ag <- c("TOTAL", "AG2", "AG4", "AG6")
  } else if (.px == "ST") {
    is_ag <- c("TOTAL", "AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (.px == "S1") {
    is_ag <- c("TOTAL", "AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (.px == "S2") {
    is_ag <- c("TOTAL", "AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (.px == "S3") {
    is_ag <- c("TOTAL", "AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (.px == "S4") {
    is_ag <- c("TOTAL", "AG1", "AG2", "AG3", "AG4", "AG5")
  } else if (.px == "BE") {
    is_ag <- c("TOTAL", "AG1", "AG2", "AG3")
  }

  ## Evaluate matching classifications
  if (sum(ag %in% is_ag) != length(ag)) {
    ag_missing <- ag[ag %in% is_ag == FALSE]
    stop(
      "\nSpecified aggregate '", paste0(ag_missing, collapse = "', '"),
      "' not reported in selected trade data base.\nSelected trade database '",
      nomenclature, "' reportes in aggregated commodity codes: '",
      paste0(is_ag, collapse = "','"),
      "'.\nPlease see https://comtrade.un.org for more information.\n"
    )
  } else {
    return(.px)
  }
}


#' @title Evaluate String Scalar
#'
#' @description Evaluates if passed object `x` is a string scalar,
#' i.e. a a character string of length 1.
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
#' @description Evaluates if input arguments match
#' expected arguments.
#' @param is Object passing provided argument(s).
#' @param ok Object passing expected argument(s).
#' @param arg Name of parameter evaluated; used for return
#' error message
#' @keywords check arguments
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' check_args(is = c("a"), ok = ("a"), arg = "test")
#' \dontrun{
#' check_args(is = c("b"), ok = ("a"), arg = "test")
#' }
check_args <- function(is, ok, arg) {
  if (is %in% ok != TRUE) {
    stop(paste0("Variable '", arg, "' incorrectly specified."))
  }
}


#' @title Convert nomenclature arguments
#'
#' @description  Converts and harmonises nomenclature inputs for further
#' processing.
#' @param nomenclature Specifies selected nomenclature;
#' see
#' [here](amannj.github.io/resources/comtradeRggregator/index.html#trade-classifications)
#' for more information.
#' @param return Return either `Name` or `Abbr` (abbreviation) of commodity code
#' @param eval if `TRUE`, `nomenclature` must be contained within
#' `df_nomenclature` which is used as input validation for
#' `download_Comtrade()`; set `FALSE` for `convert_Comtrade()`.
#' @keywords nomenclature conversion
#' @examples
#' convert_nomenclature(nomenclature = 'H3', return = 'Name')
#' convert_nomenclature(nomenclature = 'HS2007', return = 'Abbr')
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @source \url{amannj.github.io/resources/comtradeRggregator/index.html#trade-classifications}
convert_nomenclature <- function(nomenclature = nomenclature,
                               return = "Name",
                               eval = TRUE) {

  # List of nomenclatures available via Comtrade
  df_nomenclature <- tibble(
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
      "BE5",
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
      "BEC5",
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
  # Extract relevant row
  df_nomenclature <- df_nomenclature[which(df_nomenclature == nomenclature,
    arr.ind = TRUE
  )[1], ]

  if (eval == TRUE) {
    empty_df <- df_nomenclature %>%
      filter(!is.na(.data$Abbr) & !is.na(.data$Name)) %>%
      nrow() == 0
    if (empty_df) {
      stop(
        "Nomenclature '", nomenclature,
        "' not available.
           Please check available trade classifications for download.'"
      )
    }
  }
  if (nomenclature != "HS") {
    df_nomenclature %>% pull(return)
  } else {
    return("HS")
  }
}
