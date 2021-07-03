#' @title Update Comtrade Data Availability File
#'
#' @description Extract or validate list of exporters for which in a
#'  given period (year or year-month) and trade classification data
#'  is available.
#' Data availability varies by country and classification, and new
#' trade data is released/revised very frequently on
#' [Comtrade](https://comtrade.un.org/).
#' `comtradeRggregator` uses trade information corresponding to
#' [official Comtrade data availability](https://comtrade.un.org/data/da)
#'  which it updates once a day and stores locally on your machine:
#'`your local package directory/data/Comtrade_DataAvailability-<date stamp>.rds`
#'   The locally stored Comtrade Data Availability file is used in
#'   every `download_Comtrade()` data query. In other words, if new data
#'   becomes available and is documented in the official Comtrade
#'   [data availability file](https://comtrade.un.org/data/da),
#'   `comtradeRggregator` will use this information no later than 24
#'   hours after its publication.
#' @param directory Location of Comtrade Data Availability file; default is
#'  `data/`
#' @param file Name of file containing information on Comtrade's data
#' availability; default is `Comtrade_DataAvailability-<date stamp>`.
#' @keywords Comtrade data availability
#' @export
#' @import dplyr comtradr tibble readr rlang
update_ComtradeDA <- function(directory =
                                system.file("data",
                                            package = "comtradeRggregator"),
                              file = paste0("Comtrade_DataAvailability-",
                                            Sys.Date())) {
  # Check and remove if file is outdated
  file_exists <- list.files(directory, pattern = file)

  if (identical(file_exists, character(0))) {
    file_old <- list.files(directory, pattern = "Comtrade_DataAvailability-")
    is.empty <- TRUE
    url <- "https://comtrade.un.org/api/refs/da/view?fmt=csv"
    while (is.empty == TRUE) {
      Comtrade_DA <- readr::read_csv(url, col_types = cols())
      if (nrow(Comtrade_DA) > 1) {
        is.empty <- FALSE
      }
    }
    unlink(paste0(directory, "/", file_old))
    save(Comtrade_DA, file = paste0(directory, "/", file, ".rda"))

    message(paste0(
      "\nComtrade Data Availability file updated and stored in file '",
      file, "' in folder '",
      directory, "'; will be used for look-up. Old files removed.\n"
    ))
    message("")
  } else if (!identical(file_exists, character(0))) {
    load(file = paste0(directory, "/", file, ".rda"))
    message(paste0(
      "\nComtrade Data Availability file '",
      file, "'\n   in folder '",
      directory, "'\n   already exists and will be used for look-up.\n"
    ))
    message("")
  }
  return(Comtrade_DA)
}
