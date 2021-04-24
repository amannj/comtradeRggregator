#' @title Build Comtrade Data from Temporary Files
#'
#' @description Builds final Comtrade data set from temporary files downloaded by `download_Comtrade()`.
#' where argument `rm.temporaryFiles` had been set to `FALSE`.
#'
#' @param directory  Location of temporary file downloads; default is
#'
#' `<your package directory>\data\tmp\<date-and-time-stamp>`;
#'
#' alternatively specify the temporary download directory you wish to remove.
#' @param rm.temporaryFiles ...
#' @param is.mirrorData ...
#' @param partner ...
#' @keywords remove
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' rm_temporaryFiles(location.temporaryFiles = NULL)
#' rm_temporaryFiles(location.temporaryFiles = "your-temporary-download-directory")
build_Comtrade <- function(directory = loc_folder,
                           rm.temporaryFiles = rm.temporaryFiles,
                           is.mirrorData = is.mirrorData,
                           partner = NULL) {
  tmp.Files <- list.files(directory)
  tmp.Data <- lapply(tmp.Files, function(x) {
    readRDS(paste0(directory, "/", x))
  })

  df_out <- bind_rows(tmp.Data)

  if (is.mirrorData == TRUE) {
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
