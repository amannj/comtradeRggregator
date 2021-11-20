#' @title Build Comtrade Data from Temporary Files
#'
#' @description Builds final Comtrade data set from temporary files
#' downloaded using `download_Comtrade(..., rm.temporaryFiles = FALSE)`.
#'
#' Options `rm.temporaryFiles = FALSE` in `download_Comtrade()` are necessary
#' as temporary files will be deleted as part of
#' data download by default. See documentation of `download_Comtrade()`
#' for more information.
#'
#' @seealso [comtradeRggregator::download_Comtrade()]
#'
#' @param directory  Location of temporary file downloads; default is
#'
#' `<your local package directory>\data\tmp\<date-and-time-stamp>`.
#' @param rm.temporaryFiles Remove temporary download files stored at
#' location provided in argument `location.temporaryFiles` when building
#' Comtrade trade data set; default is `TRUE`.
#' @param is.mirrorData Is data set that is to be built mirror data? default
#' is `FALSE`, i.e. non-mirror data.
#' @param partner List of partner countries. Needs to be provided
#' if `is.mirrorData = TRUE`; default is `NULL`, i.e. no mirror data download.
#'   - If `is.mirrorData = TRUE`, export (import) data from  countries
#'   specified in
#'   argument `partner` is measured as import (export) of countries
#'   specified in argument `partner` as reported by countries
#'   specified in argument `partner`.

#' @keywords build comtrade
#' @export
#' @import dplyr comtradr tibble readr rlang
build_Comtrade <- function(directory =
                             system.file("data",
                               package = "comtradeRggregator"
                             ),
                           rm.temporaryFiles = FALSE,
                           is.mirrorData = FALSE,
                           partner = NULL) {
  tmp.Files <- list.files(directory)
  tmp.Data <- lapply(tmp.Files, function(x) {
    readRDS(paste0(directory, "/", x))
  })

  df_out <- bind_rows(tmp.Data) %>%
    distinct(across(everything()))

  if (nrow(df_out) == 1) {
    warning("Data query did not produce any results.
            Empty data frame is returned.")
    df_out <- NULL
  } else if (nrow(df_out) > 1) {
     if (is.mirrorData == TRUE) {
    #   if (is.null(partner)) {
    #     stop("Please provide list of partner countries for
    #          mirror data download.")
    #   }
    #   df_out %>%
    #     rename(
    #       "partnernew" = .data$reporter,
    #       "reporter" = .data$partner
    #     ) %>%
    #     mutate(
    #       trade_flow = ifelse(.data$trade_flow == "Import",
    #         "ExportX",
    #         ifelse(.data$trade_flow == "Export", "ImportX",
    #           ifelse(.data$trade_flow == "Re-Export",
    #             "Re-ImportX",
    #             "Re-ExportX"
    #           )
    #         )
    #       ),
    #       trade_flow = substr(.data$trade_flow, 1, nchar(.data$trade_flow) - 1)
    #     ) %>%
    #     select("classification", "period",
    #       "trade_flow", "reporter",
    #       partner = "partnernew",
    #       everything()
    #     ) -> df_out
    #
      if (partner == "World") {
        df_out %>%
          mutate(partner = "World") %>%
          group_by(
            .data$classification, .data$period,
            .data$trade_flow, .data$reporter,
            .data$partner, .data$commodity_code, .data$commodity
          ) %>%
          summarise(trade_value_usd = sum(.data$trade_value_usd,
            na.rm = TRUE
          )) %>%
          ungroup() -> df_out
      }
    }
    # Remove temporary files/folder
    if (rm.temporaryFiles == TRUE) {
      lapply(tmp.Files, function(x) {
        file.remove(paste0(directory, "/", x))
      })
      unlink(directory, recursive = TRUE)
    }

    ## Return final object
    df_out <- df_out %>%
      arrange("reporter", "period", "partner", "trade_flow", "commodity_code")
  }
  return(df_out)
}
