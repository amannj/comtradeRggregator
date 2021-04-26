#' @title Check Available Countries for Comtrade Query
#'
#' @description Extract or validate list of exporters for which in a given period (year or year-month) and trade classification data is available.
#' Data availability varies by country and classification, and new trade data is released/revised very frequently on [Comtrade](https://comtrade.un.org/).
#' `comtradeRggregator` uses trade information corresponding to
#' [official Comtrade data availability](https://comtrade.un.org/data/da) which it updates once a day and stores locally on your machine:
#'   `<your local package location>/data/Comtrade_DataAvailability/Comtrade_DataAvailability-<date stamp>.csv.gz`
#'   The locally stored Comtrade Data Availability file is used in every `download_Comtrade()` data query.
#'   In other words, if new data becomes available and is documented in the [official Comtrade data availability file](https://comtrade.un.org/data/da),
#'   `comtradeRggregator` will use this information no later than 24 hours after its publication.
#' @param directory Location of Comtrade Data Availability file; default is `data/Comtrade_DataAvailability/`
#' @param file Name of file containing information on Comtrade's data availability; default is `Comtrade_DataAvailability-<date stamp>`.
#' @param type Type of trade data to be extracted (either `services` or `commodities`); currently only `type = commodities` implemented.
#' @param frequency Frequency of data extract; either `annual` or `monthly`; default is `annual`.
#' @param time Generic time id for internal processing; either a particular year or particular month of a particular year
#' @param px Trade classification abbreviation `.px` for further processing of Comtrade download
#' @param t Generic time index for internatl processing.
#' @keywords Comtrade country list
#' @export
#' @import dplyr comtradr tibble readr rlang


gen_CountryList <- function(directory = "data",
                            file = paste0("Comtrade_DataAvailability-", Sys.Date()),
                            type = type,
                            frequency = frequency,
                            time = time,
                            px = .px,
                            t = t) {

  ## Check if update necessary first
  Comtrade_DA <- update_ComtradeDA(directory, file)
  ## Extract Comtrade Data Availability file
  Comtrade_DA %>%
    select(type, freq, px, rDesc, ps, px) %>%
    filter(type == toupper(type) & freq == toupper(frequency)) -> ls_cnt

  ## Filter by period
  if (tolower(frequency) == "annual") {
    ls_cnt %>%
      filter(ps == time, px == px) -> ls_cnt
  } else if (tolower(frequency) == "monthly") {
    ls_cnt %>%
      mutate(
        ps = as.character(ps),
        ps = paste0(substr(ps, 1, 4), "-", substr(ps, 5, 6))
      ) %>%
      filter(ps == time[t]) -> ls_cnt
  } else {
    stop("Option `frequency` incorrectly specified.")
  }

  ## Collapse and return
  ## Eliminated aggregates are either country aggregates of follow different name(s).
  ls_cnt %>%
    group_by(rDesc) %>%
    tally() %>%
    filter(rDesc %not.in% c("ASEAN", "EU-28", "Other Asia, nes", "Eswatini", "North Macedonia")) %>%
    pull(rDesc)
}
