#' @title Core function of `download_Comtrade()`
#'
#' @description Core function for `download_Comtrade()`.
#' @param rep Parameter passed on from `download_Comtrade()`.
#' @param date Year/year-month for which to extract data.
#' @param dir  Parameter passed on from `download_Comtrade()`.
#' @param is.mirrorData  Parameter passed on from `download_Comtrade()`.
#' @param commodity Parameter passed on from `download_Comtrade()`.
#' @param select.stats  Parameter passed on from `download_Comtrade()`.
#' @param frequency Parameter passed on from `download_Comtrade()`.
#' @param partners Parameter passed on from `download_Comtrade()`.
#' @param sleep Parameter passed on from `download_Comtrade()`.
#' @keywords Comtrade data download
#' @export
#' @import dplyr comtradr tibble readr rlang


## Wrapper function -----------
download_Comtrade_wrapper <- function(rep = "Austria",
                                      date = "2019",
                                      dir = "all",
                                      is.mirrorData = FALSE,
                                      commodity = "AG6",
                                      select.stats = c(
                                        "trade_value_usd", "qty_unit_code",
                                        "qty_unit", "alt_qty_unit_code",
                                        "alt_qty_unit", "qty",
                                        "alt_qty", "netweight_kg",
                                        "gross_weight_kg"
                                      ),
                                      frequency = "annual",
                                      partners = partners,
                                      sleep = sleep) {

  ### Core function ----------------
  download_COMTRADE_core <- function(...) {

    ## Standard data extract
    if (is.mirrorData == FALSE) {
      message(
        "Regular data download from partner(s): ",
        paste0(partners, collapse = ", "), ";"
      )
      df_download <- try({
        comtradr::ct_search(
          reporters = rep,
          partners = partners,
          freq = frequency,
          start_date = date,
          end_date = date,
          commod_codes = commodity,
          trade_direction = dir
        ) %>%
          # Reshape
          as_tibble() %>%
          select(
            "classification", "period", "trade_flow", "reporter",
            "partner", "commodity_code", "commodity",
            all_of(select.stats)
          )
      })
      ## Extract mirrored data instead
    } else {
      if (is.mirrorData == TRUE) {
        if (is.null(partners)) {
          stop("Please provide mirror data country.")
        }
        message(
          "Mirror data download from partner(s): ",
          paste0(partners, collapse = ", "), ";"
        )
        df_download <- try({
          comtradr::ct_search(
            reporters = rep,
            partners = partners,
            freq = frequency,
            start_date = date,
            end_date = date,
            commod_codes = commodity,
            trade_direction = dir
          ) %>%
            # Reshape
            as_tibble() %>%
            select(
              "classification", "period", "trade_flow", "reporter",
              "partner", "commodity_code", "commodity",
              all_of(select.stats)
            ) %>%
            mutate("partner" = paste0(.data$partner, " mirrored")) %>%
            # "Mirror" data object for better consistency across extracts
            rename(
              "partnernew" = reporter,
              "reporter" = partner
            ) %>%
            mutate(
              trade_flow = ifelse(trade_flow == "Import",
                "ExportX",
                ifelse(trade_flow == "Export", "ImportX",
                  ifelse(trade_flow == "Re-Export",
                    "Re-ImportX",
                    "Re-ExportX"
                  )
                )
              ),
              trade_flow = substr(trade_flow, 1, nchar(trade_flow) - 1)
            ) %>%
            select("classification", "period",
              "trade_flow", "reporter",
              partner = "partnernew",
              everything()
            )
        })
      }
    }
    return(df_download)
  }

  # Wrapper ----------------
  ## Extract data
  df_download <- download_COMTRADE_core()

  ## If error in data extract....
  while (!is.na(suppressWarnings(stringr::str_match(
    df_download[1],
    "hourly"
  ))) |
    !is.na(suppressWarnings(stringr::str_match(
      df_download[1],
      "409"
    )))) {
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
  while (!is.na(suppressWarnings(
    stringr::str_match(
      df_download[1],
      "Error in curl::curl_fetch_memory"
    )
  ))) {
    # ... wait for an hour ...
    message("curl::curl_fetch_memory; wait for 1 min.
            If error persists consider decreasing `cnt_extr`
            in `download_Comtrade()`.")
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
    stop("Other error code.")
  }
  message(
    "   reported by: ", paste0(rep, collapse = ", "), "; year: ",
    date, "; trade direction: '",
    paste0(dir, collapse = "', '"),
    "'.\n    Done! Going to sleep for ", sleep, " sec.\n"
  )
  Sys.sleep(sleep)

  return(df_download)
}
