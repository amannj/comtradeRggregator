#' @title Build Comtrade Data from Temporary Files
#'
#' @description Builds final Comtrade data set from temporary files downloaded by `download_Comtrade()`.
#' where argument `rm.temporaryFiles` had been set to `FALSE`.
#'
#' @param directory  Location of temporary file downloads; default is
#'
#' `<your package directory>\data\tmp\<date-and-time-stamp>`;
#'
#' alternatively specify the temporary download directory.
#' @param rm.temporaryFiles Remove temporary download files stored at location provided in argument `location.temporaryFiles`; default is `FALSE`.
#' @param is.mirrorData Extract mirror trade data? default is `FALSE`; Set to `TRUE` to extract mirror trade data from country/countries specified in argument `partners`. For example, if `is.mirrorData = TRUE` export data from countries specified in argument `countries` to countries specified in argument `partners` is measured as import data from countries specified in argument `countries` to countries specified in argument `partners` as reported by countries specified in argument `partners`.
#' @param partner List of partner countries. Needs to be provided if `is.mirrorData = TRUE`; default is `NULL`, no mirror data download.
#' @keywords build comtrade
#' @export
#' @import dplyr comtradr tibble readr rlang
build_Comtrade <- function(directory = loc_folder,
                           rm.temporaryFiles = FALSE,
                           is.mirrorData = FALSE,
                           partner = NULL) {
  tmp.Files <- list.files(directory)
  tmp.Data <- lapply(tmp.Files, function(x) {
    readRDS(paste0(directory, "/", x))
  })

  df_out <- bind_rows(tmp.Data)

  if (is.mirrorData == TRUE) {
    if (is.null(partner)) {
      stop("Please provide list of partner countries fo")
    }


    df_out %>%
      rename(
        partnernew = reporter,
        reporter = partner
      ) %>%
      mutate(
        trade_flow = ifelse(trade_flow == "Import", "ExportX",
          ifelse(trade_flow == "Export", "ImportX",
            ifelse(trade_flow == "Re-Export", "Re-ImportX", "Re-ExportX")
          )
        ),
        trade_flow = substr(trade_flow, 1, nchar(trade_flow) - 1)
      ) %>%
      select(classification, period, trade_flow, reporter, partner = partnernew, everything()) -> df_out

    if (partner == "World") {
      df_out %>%
        mutate(partner = "World") %>%
        group_by(classification, period, trade_flow, reporter, partner, commodity_code, commodity) %>%
        summarise(trade_value_usd = sum(trade_value_usd, na.rm = TRUE)) %>%
        ungroup() -> df_out
    }
  }
  ## Remove temporary files/folder
  if (rm.temporaryFiles == TRUE) {
    lapply(tmp.Files, function(x) {
      file.remove(paste0(directory, "/", x))
    })
    unlink(directory, recursive = TRUE)
  }

  ## Return final object
  return(df_out)
}
