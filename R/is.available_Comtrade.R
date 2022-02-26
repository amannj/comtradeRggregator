#' @title Check Data Availability for Comtrade Trade Data Query
#'
#' @description Check if data of a particular trade data set, frequency or
#' country is available. Only returns list of countries that actively report
#' trade data for the specified classification.
#' Data availability varies by country and classification, and new trade data is
#' released/revised very frequently on [Comtrade](https://comtrade.un.org/).
#' `comtradeRggregator` uses trade information corresponding to
#' [official Comtrade data availability](https://comtrade.un.org/data/da) which
#' it updates once a day and stores locally on your machine:
#'
#'`your local package directory/data/Comtrade_DataAvailability-<date stamp>.rds`
#'
#'   The locally stored Comtrade Data Availability file is used in every
#'   `download_Comtrade()` data query. In other words, if new data becomes
#'   available and is documented in the official Comtrade
#'   [data availability file](https://comtrade.un.org/data/da),
#'   `comtradeRggregator`
#'   will use this information no later than 24 hours after its publication.
#' @param is.contained  Check if a particular country (set of countries) is
#' available for a particular data set; default is `NULL` which returns list
#' of all countries available for a given data set.
#' @param type Type of trade data to be extracted; either `services` or
#' `commodities`; currently only `commodities` implemented.
#' @param is.fuzzy Fuzzy match of country name fragments provided in
#' `is.contained`; default is `FALSE`.
#' @param frequency Frequency of data extract; either `annual` or `monthly`;
#'  default is `annual`.
#' @param month Optional parameter for `monthly` extract; ignored for `annual`
#' extracts; only takes one entry as monthly trade data availability varies
#' by month.
#' @param nomenclature  Select trade database and classification to be extracted;
#' default is `HS2007`; monthly trade data only available following `HS`
#' classification; the full list of possible trade classifications and their
#' corresponding input arguments used in the `comtradeRggregator` package are
#' provided in table Trade Classifications
#' ([link](https://amannj.github.io/resources/comtradeRggregator/index.html#trade-classifications)).
#' @param year Year for which to extract data.
#' @param file  Location of Comtrade Data Availability file; default is
#' `Comtrade_DataAvailability-<time and date stamp>.csv.gz`.
#' @param directory Location of directory; default is
#'  `"<location of package on your system>\data"`.
#' @keywords Data Availability
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' \dontrun{
#' is.available_Comtrade(frequency = "annual", nomenclature = "H3", year = 2008)
#' is.available_Comtrade(
#'   is.contained = c("Austria", "Germany"),
#'   frequency = "annual", nomenclature = "H2", year = 2012
#' )
#' is.available_Comtrade(
#'   is.contained = c("Austria", "Germany"),
#'   frequency = "monthly", month = "01", nomenclature = "H3", year = 2020
#' )
#' }
is.available_Comtrade <- function(is.contained = NULL,
                                  is.fuzzy = FALSE,
                                  type = "commodities",
                                  frequency = "annual",
                                  month = NULL,
                                  nomenclature = "H3",
                                  year = 2008,
                                  directory =
                                    system.file("data",
                                                package = "comtradeRggregator"),
                                  file = paste0("Comtrade_DataAvailability-",
                                                Sys.Date())) {

  ## Check `nomenclature` and return arg  ------
  nomenclature <- convert_nomenclature(nomenclature = nomenclature, return = "Abbr")


  ## Download data availability file once per extract and day   ------------
  Comtrade_DA <- update_ComtradeDA(directory, file) %>%
    filter(
      .data$type == toupper(type),
      .data$freq == toupper(frequency)
    )

  ## Return ls_cnt if `is.contained` is not triggered --------------
  if (tolower(frequency) == "annual") {
    Comtrade_DA %>%
      filter(
        .data$px %in% nomenclature,
        .data$ps %in% year
      ) %>%
      select('country' = .data$rDesc, 'year' = .data$ps) %>%
      arrange('country', 'year') -> ls_cnt
  }

  if (tolower(frequency) == "monthly") {
    if (is.null(month)) {
      stop("Please provide month.")
    }
    if (length(month) > 1) {
      stop("Monthly data coverage varies by month;
           please only provide one month.")
    }
    message("Only HS Combined nomenclature available for monthly trade data.")
    Comtrade_DA %>%
      filter(
        .data$ps == paste0(year, month)
      ) %>%
      mutate('ps' = paste0(year, '-',month)) %>%
      select('country' = .data$rDesc, 'year' = .data$ps) %>%
      arrange('country', 'year') -> ls_cnt
  }

  ## Country look-up if `is.contained` is not triggered --------------
  if (!is.null(is.contained)) {
    if (is.fuzzy == FALSE) {
      ls_cnt <- ls_cnt %>%
        filter(.data$country %in% is.contained) %>%
        arrange('country', 'year')
    } else if (is.fuzzy == TRUE) {
      ls_cnt <- ls_cnt %>%
        filter(.data$country %in% grep(is.contained,
                                   .data$country,
                                   value = TRUE)) %>%
        arrange('country', 'year')
    }
  }
  return(ls_cnt)
}
