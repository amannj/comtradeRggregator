#' \code{comtradeRggregator} package
#'
#' The goal of the `comtradeRggregator` package is to provide a simple tool to
#' download and reclassify large chunks of [Comtrade trade data](https://comtrade.un.org).
#' It offers functionality to download and aggregate [Comtrade trade data](https://comtrade.un.org)
#' using [Comtrade's API](https://comtrade.un.org/data/doc/api/) by building on
#' the [comtradr](https://github.com/ropensci/comtradr) package. Furthermore, it provides a
#' function for easy reclassification of trade data using official concordance tables from
#' the [United Nations Statistical Division (UNSD)](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp)
#' and the [World Integrated Trade Solution (WITS)](https://wits.worldbank.org/product_concordance.html).
#'
#' See the README on
#'  \href{https://github.com/amannj/comtradeRggregator}{GitHub}.
#'
#' @docType package
#' @name comtradeRggregator
NULL

## quiets concerns of R CMD check
if (getRversion() >= "2.15.1") {
  utils::globalVariables(c(
    ".",
    "lz",
    "loc_folder",
    "reporter",
    "trade_flow",
    "classifcation",
    "period",
    "partner",
    "partnernew",
    "commodity_code",
    "commodity",
    ".select.stats",
    "classification",
    "period",
    "trade_flow",
    ".px",
    "px",
    "freq",
    "rDesc",
    "ps",
    "H0_BE",
    "x",
    "na.omit",
    "country"
  ))
}
