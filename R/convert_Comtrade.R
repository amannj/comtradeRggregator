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

  if (convert.from == "HS" & convert.to == "BE") {
    ### from HS to BE ---------------
    df_cc <- HS_BE %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "CC") {
    ### from HS to CC ---------------
    df_cc <- HS_CC %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "CP") {
    ### from HS to CP ---------------
    df_cc <- HS_CP %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "GP") {
    ### from HS to GP ---------------
    df_cc <- HS_GP %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "H0") {
    ### from HS to H0 ---------------
    df_cc <- HS_H0 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "H1") {
    ### from HS to H1 ---------------
    df_cc <- HS_H1 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "H2") {
    ### from HS to H2 ---------------
    df_cc <- HS_H2 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "H3") {
    ### from HS to H3 ---------------
    df_cc <- HS_H3 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "H4") {
    ### from HS to H4 ---------------
    df_cc <- HS_H4 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "I2") {
    ### from HS to I2 ---------------
    df_cc <- HS_I2 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "I3") {
    ### from HS to I3 ---------------
    df_cc <- HS_I3 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "IU") {
    ### from HS to IU ---------------
    df_cc <- HS_IU %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "MT") {
    ### from HS to MT ---------------
    df_cc <- HS_MT %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "S1") {
    ### from HS to S1 ---------------
    df_cc <- HS_S1 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "S2") {
    ### from HS to S2 ---------------
    df_cc <- HS_S2 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "S3") {
    ### from HS to S3 ---------------
    df_cc <- HS_S3 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "HS" & convert.to == "S4") {
    ### from HS to S4 ---------------
    df_cc <- HS_S4 %>%
      rename(!!.cc := `HS - Combined  Product Code`)
  } else if (convert.from == "H0" & convert.to == "BE") {
    ### from H0 to BE ---------------
    df_cc <- H0_BE %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "CC") {
    ### from H0 to CC ---------------
    df_cc <- H0_CC %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "CP") {
    ### from H0 to CP ---------------
    df_cc <- H0_CP %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "GP") {
    ### from H0 to GP ---------------
    df_cc <- H0_GP %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "I2") {
    ### from H0 to I2 ---------------
    df_cc <- H0_I2 %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "I3") {
    ### from H0 to I3 ---------------
    df_cc <- H0_I3 %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "IU") {
    ### from H0 to IU ---------------
    df_cc <- H0_IU %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "MT") {
    ### from H0 to MT ---------------
    df_cc <- H0_MT %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "S1") {
    ### from H0 to S1 ---------------
    df_cc <- H0_S1 %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "S2") {
    ### from H0 to S2 ---------------
    df_cc <- H0_S2 %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "S3") {
    ### from H0 to S3 ---------------
    df_cc <- H0_S3 %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H0" & convert.to == "S4") {
    ### from H0 to S4 ---------------
    df_cc <- H0_S4 %>%
      rename(!!.cc := `HS 1988/92 Product Code`)
  } else if (convert.from == "H1" & convert.to == "BE") {
    ### from H1 to BE ---------------
    df_cc <- H1_BE %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "CC") {
    ### from H1 to CC ---------------
    df_cc <- H1_CC %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "CP") {
    ### from H1 to CP ---------------
    df_cc <- H1_CP %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "GP") {
    ### from H1 to GP ---------------
    df_cc <- H1_GP %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "H0") {
    ### from H1 to H0 ---------------
    df_cc <- H1_H0 %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "I2") {
    ### from H1 to I2 ---------------
    df_cc <- H1_I2 %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "I3") {
    ### from H1 to I3 ---------------
    df_cc <- H1_I3 %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "IU") {
    ### from H1 to IU ---------------
    df_cc <- H1_IU %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "MT") {
    ### from H1 to MT ---------------
    df_cc <- H1_MT %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "S1") {
    ### from H1 to S1 ---------------
    df_cc <- H1_S1 %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "S2") {
    ### from H1 to S2 ---------------
    df_cc <- H1_S2 %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "S3") {
    ### from H1 to S3 ---------------
    df_cc <- H1_S3 %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H1" & convert.to == "S4") {
    ### from H1 to S4 ---------------
    df_cc <- H1_S4 %>%
      rename(!!.cc := `HS 1996 Product Code`)
  } else if (convert.from == "H2" & convert.to == "BE") {
    ### from H2 to BE ---------------
    df_cc <- H2_BE %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "CC") {
    ### from H2 to CC ---------------
    df_cc <- H2_CC %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "CP") {
    ### from H2 to CP ---------------
    df_cc <- H2_CP %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "GP") {
    ### from H2 to GP ---------------
    df_cc <- H2_GP %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "H0") {
    ### from H2 to H0 ---------------
    df_cc <- H2_H0 %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "H1") {
    ### from H2 to H1 ---------------
    df_cc <- H2_H1 %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "I2") {
    ### from H2 to I2 ---------------
    df_cc <- H2_I2 %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "I3") {
    ### from H2 to I3 ---------------
    df_cc <- H2_I3 %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "IU") {
    ### from H2 to IU ---------------
    df_cc <- H2_IU %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "MT") {
    ### from H2 to MT ---------------
    df_cc <- H2_MT %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "S1") {
    ### from H2 to S1 ---------------
    df_cc <- H2_S1 %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "S2") {
    ### from H2 to S2 ---------------
    df_cc <- H2_S2 %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "S3") {
    ### from H2 to S3 ---------------
    df_cc <- H2_S3 %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H2" & convert.to == "S4") {
    ### from H2 to S4 ---------------
    df_cc <- H2_S4 %>%
      rename(!!.cc := `HS 2002 Product Code`)
  } else if (convert.from == "H3" & convert.to == "BE") {
    ### from H3 to BE ---------------
    df_cc <- H3_BE %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "CC") {
    ### from H3 to CC ---------------
    df_cc <- H3_CC %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "CP") {
    ### from H3 to CP ---------------
    df_cc <- H3_CP %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "GP") {
    ### from H3 to GP ---------------
    df_cc <- H3_GP %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "H0") {
    ### from H3 to H0 ---------------
    df_cc <- H3_H0 %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "H1") {
    ### from H3 to H1 ---------------
    df_cc <- H3_H1 %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "H2") {
    ### from H3 to H2 ---------------
    df_cc <- H3_H2 %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "I2") {
    ### from H3 to I2 ---------------
    df_cc <- H3_I2 %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "I3") {
    ### from H3 to I3 ---------------
    df_cc <- H3_I3 %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "IU") {
    ### from H3 to IU ---------------
    df_cc <- H3_IU %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "MT") {
    ### from H3 to MT ---------------
    df_cc <- H3_MT %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "S1") {
    ### from H3 to S1 ---------------
    df_cc <- H3_S1 %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "S2") {
    ### from H3 to S2 ---------------
    df_cc <- H3_S2 %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "S3") {
    ### from H3 to S3 ---------------
    df_cc <- H3_S3 %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H3" & convert.to == "S4") {
    ### from H3 to S4 ---------------
    df_cc <- H3_S4 %>%
      rename(!!.cc := `HS 2007 Product Code`)
  } else if (convert.from == "H4" & convert.to == "H0") {
    ### from H4 to H0 ---------------
    df_cc <- H4_H0 %>%
      rename(!!.cc := `HS 2012 Product Code`)
  } else if (convert.from == "H4" & convert.to == "H1") {
    ### from H4 to H1 ---------------
    df_cc <- H4_H1 %>%
      rename(!!.cc := `HS 2012 Product Code`)
  } else if (convert.from == "H4" & convert.to == "H2") {
    ### from H4 to H2 ---------------
    df_cc <- H4_H2 %>%
      rename(!!.cc := `HS 2012 Product Code`)
  } else if (convert.from == "H4" & convert.to == "H3") {
    ### from H4 to H3 ---------------
    df_cc <- H4_H3 %>%
      rename(!!.cc := `HS 2012 Product Code`)
  } else if (convert.from == "H4" & convert.to == "S1") {
    ### from H4 to S1 ---------------
    df_cc <- H4_S1 %>%
      rename(!!.cc := `HS 2012 Product Code`)
  } else if (convert.from == "H4" & convert.to == "S2") {
    ### from H4 to S2 ---------------
    df_cc <- H4_S2 %>%
      rename(!!.cc := `HS 2012 Product Code`)
  } else if (convert.from == "H4" & convert.to == "S3") {
    ### from H4 to S3 ---------------
    df_cc <- H4_S3 %>%
      rename(!!.cc := `HS 2012 Product Code`)
  } else if (convert.from == "H4" & convert.to == "S4") {
    ### from H4 to S4 ---------------
    df_cc <- H4_S4 %>%
      rename(!!.cc := `HS 2012 Product Code`)
  } else if (convert.from == "H5" & convert.to == "H0") {
    ### from H5 to H0 ---------------
    df_cc <- H5_H0 %>%
      rename(!!.cc := `HS 2017 Product Code`)
  } else if (convert.from == "H5" & convert.to == "H1") {
    ### from H5 to H1 ---------------
    df_cc <- H5_H1 %>%
      rename(!!.cc := `HS 2017 Product Code`)
  } else if (convert.from == "H5" & convert.to == "H2") {
    ### from H5 to H2 ---------------
    df_cc <- H5_H2 %>%
      rename(!!.cc := `HS 2017 Product Code`)
  } else if (convert.from == "H5" & convert.to == "H3") {
    ### from H5 to H3 ---------------
    df_cc <- H5_H3 %>%
      rename(!!.cc := `HS 2017 Product Code`)
  } else if (convert.from == "H5" & convert.to == "H4") {
    ### from H5 to H4 ---------------
    df_cc <- H5_H4 %>%
      rename(!!.cc := `HS 2017 Product Code`)
  } else if (convert.from == "H5" & convert.to == "S1") {
    ### from H5 to S1 ---------------
    df_cc <- H5_S1 %>%
      rename(!!.cc := `HS 2017 Product Code`)
  } else if (convert.from == "H5" & convert.to == "S2") {
    ### from H5 to S2 ---------------
    df_cc <- H5_S2 %>%
      rename(!!.cc := `HS 2017 Product Code`)
  } else if (convert.from == "H5" & convert.to == "S3") {
    ### from H5 to S3 ---------------
    df_cc <- H5_S3 %>%
      rename(!!.cc := `HS 2017 Product Code`)
  } else if (convert.from == "H5" & convert.to == "S4") {
    ### from H5 to S4 ---------------
    df_cc <- H5_S4 %>%
      rename(!!.cc := `HS 2017 Product Code`)
  } else if (convert.from == "S1" & convert.to == "BE") {
    ### from S1 to BE ---------------
    df_cc <- S1_BE %>%
      rename(!!.cc := `SITC Revision 1 Product Code`)
  } else if (convert.from == "S2" & convert.to == "BE") {
    ### from S2 to BE ---------------
    df_cc <- S2_BE %>%
      rename(!!.cc := `SITC Revision 2 Product Code`)
  } else if (convert.from == "S2" & convert.to == "I2") {
    ### from S2 to I2 ---------------
    df_cc <- S2_I2 %>%
      rename(!!.cc := `SITC Revision 2 Product Code`)
  } else if (convert.from == "S2" & convert.to == "S1") {
    ### from S2 to S1 ---------------
    df_cc <- S2_S1 %>%
      rename(!!.cc := `SITC Revision 2 Product Code`)
  } else if (convert.from == "S3" & convert.to == "S1") {
    ### from S3 to S1 ---------------
    df_cc <- S3_S1 %>%
      rename(!!.cc := `SITC Revision 3 Product Code`)
  } else if (convert.from == "S3" & convert.to == "S2") {
    ### from S3 to S2 ---------------
    df_cc <- S3_S2 %>%
      rename(!!.cc := `SITC Revision 3 Product Code`)
  } else if (convert.from == "I2" & convert.to == "I3") {
    ### from I2 to I3 ---------------
    df_cc <- I2_I3 %>%
      rename(!!.cc := `ISIC Revision 2 Product Code`)
  } else if (convert.from == "I2" & convert.to == "I3.1") {
    ### from I2 to I31 ---------------
    df_cc <- I2_I31 %>%
      rename(!!.cc := `ISIC Revision 2 Product Code`)
  } else if (convert.from == "I3" & convert.to == "I2") {
    ### from I3 to I2 ---------------
    df_cc <- I3_I2 %>%
      rename(!!.cc := `ISIC Revision 3 Product Code`)
  } else if (convert.from == "I3" & convert.to == "I3.1") {
    ### from I3 to I3.1 ---------------
    df_cc <- I3_I31 %>%
      rename(!!.cc := `ISIC Revision 3 Product Code`)
  } else if (convert.from == "I3.1" & convert.to == "I3") {
    ### from I3.1 to I3 ---------------
    df_cc <- I31_I3 %>%
      rename(!!.cc := `ISIC Revision 3.1 Product Code`)
  } else if (convert.from == "I3.1" & convert.to == "I4") {
    ### from I3.1 to I4 ---------------
    df_cc <- I31_I4 %>%
      rename(!!.cc := `ISIC Revision 3.1 Product Code`)
  } else {
    ### No concordance available ---------------
    stop("No concordance table available.")
  }

  # Merge and aggregate
  data %>%
    full_join(df_cc, by = paste(commodity.code))
}
