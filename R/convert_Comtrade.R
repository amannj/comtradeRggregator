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
#' @param classification Name of variable containing the trade classification, e.g. `HS2007`; default is `classification`.
#' @param commodity.code  Name of variable containing the commodity codes corresponding to trade classification; default is `commodity_code`.
#' @param convert.to Abbreviation of target classification based on Concordance table provided above.
#' @keywords concordance
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
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
#'     classification = "classification",
#'     commodity.code = "commodity_code",
#'     convert.to = "I3"
#'   )
#' }
convert_Comtrade <- function(data,
                             classification = "classification",
                             commodity.code = "commodity_code",
                             convert.to = "I3") {
  # Set symbols
  .cls <- sym(classification)
  .cc <- sym(commodity.code)

  # Extract classification var.
  convert.from <- data %>%
    distinct(!!.cls) %>%
    pull()

  # Check for single trade classification in data
  if (length(convert.from) != 1) {
    stop("\nTrade data contains multiple classifications.")
  }

  # Look through concordance tables

  if (convert.from == "H3" & convert.to == "BE") {
    ### from H3 to BE ---------------
    df_cc <- H3_BE %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "CC") {
    ### from H3 to CC ---------------
    df_cc <- H3_CC %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "CP") {
    ### from H3 to CP ---------------
    df_cc <- H3_CP %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "GP") {
    ### from H3 to GP ---------------
    df_cc <- H3_GP %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "H0") {
    ### from H3 to H0 ---------------
    df_cc <- H3_H0 %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "H1") {
    ### from H3 to H1 ---------------
    df_cc <- H3_H1 %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "H2") {
    ### from H3 to H2 ---------------
    df_cc <- H3_H2 %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "I2") {
    ### from H3 to I2 ---------------
    df_cc <- H3_I2 %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "I3") {
    ### from H3 to I3 ---------------
    df_cc <- H3_I3 %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "IU") {
    ### from H3 to IU ---------------
    df_cc <- H3_IU %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "MT") {
    ### from H3 to MT ---------------
    df_cc <- H3_MT %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "S1") {
    ### from H3 to S1 ---------------
    df_cc <- H3_S1 %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "S2") {
    ### from H3 to S2 ---------------
    df_cc <- H3_S2 %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "S3") {
    ### from H3 to S3 ---------------
    df_cc <- H3_S3 %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "S4") {
    ### from H3 to S3 ---------------
    df_cc <- H3_S4 %>%
      ## Harmonise key var.
      rename(!!.cc := `HS 2007 Product Code`)
  } else {
    ### No concordance available ---------------
    stop("No concordance table available.")
  }

  # Merge and aggregate
  data %>%
    full_join(df_cc, by = paste(commodity.code))
}
