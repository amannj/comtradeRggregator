#' @title Check Data Availability for Comtrade Trade Data Query
#'
#' @description Check if data of a particular trade data set, frequency or country is available.
#' Data availability varies by country and classification, and new trade data is released/revised very frequently on [Comtrade](https://comtrade.un.org/).
#' `comtradeRggregator` uses trade information corresponding to
#' [official Comtrade data availability](https://comtrade.un.org/data/da) which it updates once a day and stores locally on your machine:
#'
#'   `<your local package location>/data/Comtrade_DataAvailability/Comtrade_DataAvailability-<date stamp>.csv.gz`.
#'
#'   The locally stored Comtrade Data Availability file is used in every `download_Comtrade()` data query.
#'   In other words, if new data becomes available and is documented in the
#'   [official Comtrade data availability file](https://comtrade.un.org/data/da), `comtradeRggregator`
#'   will use this information no later than 24 hours after its publication.
#' @param is.contained  Check if a particular country/set of countries is available for a particular data set; default is `NULL` which returns list of all countries available for a given data set.
#' @param type Type of trade data to be extracted; either `services` or `commodities`; currently only `commodities` implemented.
#' @param frequency   Frequency of data extract; either `annual` or `monthly`; default is `annual`.
#' @param month   Optional parameter for `monthly` extract; ignored for `annual` extracts; only takes one entry as monthly trade data availability varies by month.
#' @param tradecode  Select trade database and classification to be extracted; default is `HS2007`; monthly trade data only available following `HS` classification; the full list of possible trade classifications and their corresponding input arguments used in the `comtradeRggregator` package are provided in *Table Supported Trade Classification*.
#' @param year Year for which to extract data.
#' @param directory Location of directory; default is `"data/Comtrade_DataAvailability"`.
#' @param file Location of Comtrade Data Availability file; default is `Comtrade_DataAvailability-<time and date stamp>.csv.gz`
#' @keywords Data Availability
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' \dontrun{
#' is.available_Comtrade(frequency = "annual", tradecode = "H3", year = 2008)
#' is.available_Comtrade(
#'   is.contained = c("Austria", "Germany"),
#'   frequency = "annual", tradecode = "H2", year = 2012
#' )
#' is.available_Comtrade(
#'   is.contained = c("Austria", "Germany"),
#'   frequency = "monthly", month = "01", tradecode = "H3", year = 2020
#' )
#' }
is.available_Comtrade <- function(is.contained = NULL,
                                  type = "commodities",
                                  frequency = "annual",
                                  month = NULL,
                                  tradecode = "H3",
                                  year = 2008,
                                  directory = "data/Comtrade_DataAvailability",
                                  file = paste0("Comtrade_DataAvailability-", Sys.Date())) {

  ## Download data availability file once per extract and day   ------------
  update_ComtradeDA(directory, file)

  if (tolower(frequency) == "annual") {
    Comtrade_DA %>%
      filter(
        type == toupper(type),
        freq == toupper(frequency),
        px == tradecode,
        ps == year
      ) %>%
      pull(rDesc) -> ls_cnt
  }

  if (tolower(frequency) == "monthly") {
    if (is.null(month)) {
      stop("Please provide month.")
    }
    if (length(month) > 1) {
      stop("Monthly data coverage varies by month; please only provide one month.")
    }
    readr::read_csv(paste0(directory, "/", file, ".csv.gz"), col_types = cols()) %>%
      filter(
        type == toupper(type),
        freq == toupper(frequency),
        ps == paste0(year, month)
      ) %>%
      pull(rDesc) -> ls_cnt
  }

  if (!is.null(is.contained)) {
    ls_cnt <- is.contained %in% ls_cnt
  }
  return(ls_cnt)
}
