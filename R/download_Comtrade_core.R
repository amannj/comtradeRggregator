#' @title Core function of `download_Comtrade()`
#'
#' @description  Interacts with `comtradr::ct_search()` and Comtrade's API to extract Comtrade trade data.
#' @param rep Country/countries to be extracted; default is `all`.
#' @param date Year/year-month for which to extract data.
#' @param dir  Direction of trade flow reported; either `imports`, `exports`, `re_-_imports`, `re_-_exports` or `all`; default is `all`.
#' @param is.mirrorData  Extract mirror trade data? default is `FALSE`; Set to `TRUE` to extract mirror trade data from country/countries specified in argument `partners`. For example, if `is.mirrorData = TRUE` export data from countries specified in argument `countries` to countries specified in argument `partners` is measured as import data from countries specified in argument `countries` to countries specified in argument `partners` as reported by countries specified in argument `partners`.
#' @param aggregation_level Level of aggregation of trade data; varies by trade data set.
#' @param select.stats  Trade statistics to be reported; either `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`, `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg` or `all`; default is `all`.
#' @param frequency Frequency of data extract; either `annual` or `monthly`; default is `annual`.
#' @param partners Specify partner country/countries or `World` (as provided by Comtrade) for global, aggregated trade; default is `World`.
#' @param sleep Number of seconds to wait before the next Comtrade API query is started; default is 20.
#' @keywords Comtrade data download
#' @export
#' @import dplyr comtradr tibble readr rlang


## Wrapper function -----------
download_Comtrade_wrapper <- function(rep = "Austria",
                                      date = "2019",
                                      dir = "all",
                                      is.mirrorData = FALSE,
                                      aggregation_level = "AG6",
                                      select.stats = .select.stats,
                                      frequency = "annual",
                                      partners = partners,
                                      sleep = sleep) {

  ### Core function ----------------
  download_COMTRADE_core <- function(...) {

    ## Standard data extract
    if (is.mirrorData == FALSE) {
      message("\nRegular data download.")
      df_download <- try({
        comtradr::ct_search(
          reporters = rep,
          partners = partners,
          freq = frequency,
          start_date = date,
          end_date = date,
          commod_codes = aggregation_level,
          trade_direction = dir
        ) %>%
          # Reshape
          as_tibble() %>%
          select(
            classification, period, trade_flow, reporter,
            partner, commodity_code, commodity,
            all_of(select.stats)
          )
      })
      ## Extract mirrored data instead
    } else {
      if (is.mirrorData == TRUE) {
        if (is.null(partners)) {
          stop("Please provide mirror data country.")
        }
        message("Mirror data download for ", partners, " for:")
        df_download <- try({
          comtradr::ct_search(
            reporters = rep,
            partners = partners,
            freq = frequency,
            start_date = date,
            end_date = date,
            commod_codes = aggregation_level,
            trade_direction = dir
          ) %>%
            # Reshape
            as_tibble() %>%
            select(
              classification, period, trade_flow, reporter,
              partner, commodity_code, commodity,
              all_of(select.stats)
            ) %>%
            mutate(partner = paste0(partners, " mirrored"))
        })
      }
    }
    return(df_download)
  }

  # Wrapper ----------------
  ## Extract data
  df_download <- download_COMTRADE_core()

  ## If error in data extract....
  while (!is.na(suppressWarnings(stringr::str_match(df_download[1], "hourly"))) |
    !is.na(suppressWarnings(stringr::str_match(df_download[1], "409")))) {
    # ... wait for an hour ...
    message("...wait for 60 min.")
    rm(df_download)
    Sys.sleep(3600)
    # ... then try again
    message("...resume:")
    df_download <- download_COMTRADE_core()
  }
  while (!is.na(suppressWarnings(stringr::str_match(df_download[1], "500")))) {
    # ... wait for an hour ...
    message("Unspecified server error; wait for 1 min.")
    rm(df_download)
    Sys.sleep(60)
    # ... then try again
    message("...resume:")
    df_download <- download_COMTRADE_core()
  }
  if (!is.na(suppressWarnings(stringr::str_match(df_download[1], "400")))) {
    stop("[400] bad request, incorrect parameters (input data).")
  }
  if (!is.na(suppressWarnings(stringr::str_match(df_download[1], "Error")))) {
    stop("Other error; sort this out!")
  }
  message("   ", paste0(rep, collapse = ", "), "; year ", date, " direction '", paste0(dir, collapse = "', '"), "' done.\n    Going to sleep for ", sleep, " sec.")
  Sys.sleep(sleep)

  return(df_download)
}
