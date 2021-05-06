#' @title Convert Comtrade Trade Data
#'
#' @description This function offers conversion tables for Comtrade trade data following official tables from the
#'  [UN Statistics Division (UNSD)](https://unstats.un.org/unsd/classifications/Econ#corresp-hs) and the
#'  [World Integrated Trade Solution (WITS)](https://wits.worldbank.org/product_concordance.html) as provided below:
#'
#' | Table | to     |
#' | ---   | ---    |
#' | be    | added. |
#'
#'
#' @param data A data frame.
#' @param classification.from Abbreviation of origin classification based on the *Concordance Table*.
#' @param commodity.code  Name of variable containing the commodity codes corresponding to trade classification; default is `commodity_code`.
#' @param classification.to Abbreviation of target classification based on the *Concordance Table*.
#' @keywords concordance
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' df <- tibble("H3 commodity code" = c("010110", "071040"))
#' convert_Comtrade(df,
#'   classification.from = "H3",
#'   commodity.code = "H3 commodity code",
#'   classification.to = "I3"
#' )
#' \dontrun{
#' # Extract Comtrade trade data first
#' AT_World <- download_Comtrade(
#'   year = "2018",
#'   frequency = "annual",
#'   countries = "Austria",
#'   partners = "World",
#'   tradecode = "HS2007",
#'   ag = "AG6",
#'   type = "commodities",
#'   select.stats = "trade_value_usd",
#'   direction = "all"
#' )
#'
#' # Convert HS2007 trade data to ISIC Rev. 3
#' AT_World %>%
#'   convert_Comtrade(
#'     classification.from = "H3",
#'     commodity.code = "commodity_code",
#'     classification.to = "I3"
#'   )
#' }
#'
convert_Comtrade <- function(data,
                             classification.from = "H3",
                             commodity.code = "commodity_code",
                             classification.to = "I3") {

  # Check input args ----------
  tradecode.ok <- c(
    "HS",
    "HS1992", "H0",
    "HS1996", "H1",
    "HS2002", "H2",
    "HS2007", "H3",
    "HS2012", "H4",
    "HS2017", "H5",
    "SITCrev1", "S1",
    "SITCrev2", "S2",
    "SITCrev3", "S3",
    "SITCrev4", "S4",
    "I2", "I3", "I31", "I4",
    "BEC",
    "CCCN",
    "CPC",
    "CTAP",
    "MTN",
    "SIC"
  )
  check_args(classification.from, tradecode.ok, "classification.from")
  check_args(classification.from, tradecode.ok, "classification.from")


  ## Check `tradecode` and return arg  ------
  if (classification.from %in% c(
    "HS1992", "H0",
    "HS1996", "H1",
    "HS2002", "H2",
    "HS2007", "H3",
    "HS2012", "H4",
    "HS2017", "H5",
    "SITCrev1", "S1",
    "SITCrev2", "S2",
    "SITCrev3", "S3",
    "SITCrev4", "S4"
  )) {
    classification.from <- convert_tradecodes(tradecode = classification.from, return = "Abbr", eval = FALSE)
  }

  # Check length of commodity codes----
  s_cclgth <- as.character(data %>%
    mutate(x = nchar(.data[[commodity.code]])) %>%
    group_by(x) %>% tally(x) %>% na.omit() %>% pull(x))

  if (classification.from == "H3") {
    check_args(s_cclgth, "6", paste0(commodity.code, " has wrong length for conversion (check Concordance Table for more information); "))
  } else if (classification.from == "I3") {
    check_args(s_cclgth, "4", paste0(commodity.code, " has wrong length for conversion (check Concordance Table for more information); "))
  } else {
    warning("No check of commodity code length implemented yet.")
  }

  # Get concordance table ----------
  try(
    {
      df_conc <- get((paste0(classification.from, "_", classification.to)))
    },
    silent = TRUE
  )
  if (exists("df_conc") == FALSE) {
    stop("No concordance table between ", classification.from, " and ", classification.to, " available. Please check abbreviations and/or Concordance Table.")
  }
  colnames(df_conc)[1] <- commodity.code

  #

  # Evaluate non-matches and return if non-empty --------
  v_nonmatch <- data %>%
    anti_join(df_conc, by = commodity.code) %>%
    distinct(.data[[commodity.code]]) %>%
    pull(.data[[commodity.code]])

  if (!identical(v_nonmatch, character(0))) {
    warning("The following commodity codes of column '", commodity.code, "' could not be matched: ", paste0(v_nonmatch, collapse = ", "), ".")
  }

  # Merge concordance table ----------
  data %>%
    left_join(df_conc, by = paste(commodity.code))
}
