#' @title Convert Comtrade Trade Data
#'
#' @description Offers conversion tables for Comtrade trade data following official tables from the
#'  [UN Statistics Division (UNSD)](https://unstats.un.org/unsd/classifications/Econ#corresp-hs) and the
#'  [World Integrated Trade Solution (WITS)](https://wits.worldbank.org/product_concordance.html).
#'  For a complete list of concordance tables please see
#'  [`comtradeRggregator`'s Concordance Table](https://amannj.github.io/resources/comtradeRggregator/index.html#concordance-table).
#' Please see [here](https://amannj.github.io/resources/comtradeRggregator/index.html#trade-classifications)
#' for a list of all nomenclatures supported by `comtradeRggregator`.
#' @param data A data frame or vector containing (a variable listing) commodity codes following one of the supported
#' nomenclatures; see [here](https://amannj.github.io/resources/comtradeRggregator/index.html#trade-classifications).
#' @param classification.from Abbreviation of origin classification supported by
#' [`comtradeRggregator`'s Concordance Table](https://amannj.github.io/resources/comtradeRggregator/index.html#concordance-table).
#' @param commodity.code  Name of variable containing the commodity codes corresponding to trade classification; default is `commodity_code`.
#' @param classification.to Abbreviation of target classification based on
#' [`comtradeRggregator`'s Concordance Table](https://amannj.github.io/resources/comtradeRggregator/index.html#concordance-table).
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
#' # Convert HS2007/H3 trade data to ISIC Rev. 3
#' AT_World %>%
#'   convert_Comtrade(
#'     classification.from = "H3",
#'     commodity.code = "commodity_code",
#'     classification.to = "I3"
#'   )
#' }
#' @source \url{https://unstats.un.org/unsd/classifications/Econ#corresp-hs}
#' \url{https://wits.worldbank.org/product_concordance.html}
#' \url{https://unstats.un.org/unsd/classifications/Econ#corresp-hs}
#' \url{https://amannj.github.io/resources/comtradeRggregator/index.html#trade-classifications}
#' \url{https://amannj.github.io/resources/comtradeRggregator/index.html#concordance-table}
convert_Comtrade <- function(data,
                             classification.from = "H3",
                             commodity.code = "commodity_code",
                             classification.to = "I3") {


  ## Check `tradecode` and return arg  ------
  cls.from <- convert_tradecodes(tradecode = classification.from, return = "Abbr", eval = TRUE)
  cls.to <- convert_tradecodes(tradecode = classification.to, return = "Abbr", eval = TRUE)

  # Check length of commodity codes----
  s_cclgth <- as.character(data %>%
    mutate(x = nchar(.data[[commodity.code]])) %>%
    group_by(x) %>% tally(x) %>% na.omit() %>% pull(x))

  # Checks for correct lengths of commodity variable -------
  if (cls.from == "H3") {
    check_args(s_cclgth, "6", paste0(commodity.code, " has wrong length for conversion (check Concordance Table for more information); "))
  } else if (cls.from == "I3") {
    check_args(s_cclgth, "4", paste0(commodity.code, " has wrong length for conversion (check Concordance Table for more information); "))
  } else {
    warning("No check of commodity code length implemented yet.")
  }

  # Get concordance table ----------
  try(
    {
      df_conc <- get((paste0(cls.from, "_", cls.to)))
    },
    silent = TRUE
  )
  if (!exists("df_conc")) {
    stop("No concordance table between ", classification.from, " and ", classification.to, " available. Please check abbreviations and/or Concordance Table.")
  }

  # Prepare concordance table for merge  ----------
  ## Eliminate duplicate columns and only keep one common key
  common_names <- colnames(df_conc)[colnames(df_conc) %in% colnames(data)]
  df_conc <- df_conc %>%
    select(-contains(common_names[grepl("Description", common_names)]))

  colnames(df_conc)[1] <- commodity.code

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
