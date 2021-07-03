#' @title Remove Temporary Data Downloads
#'
#' @description Remove all temporary files and download
#' directories created by `download_Comtrade()`.
#' Run this In case in `download_Comtrade()` had been set
#' to `rm.temporaryFiles = FALSE` but you now wish to
#' remove  all temporary files and directories.
#' @param location.temporaryFiles  Location of temporary
#' file downloads; default is
#'
#' `your local package directory\data\tmp\<date-and-time-stamp>`;
#'
#' alternatively specify the temporary download directory
#' you wish to remove.
#' @param location.temporaryFiles  Location of temporary file
#' downloads; default is
#' `your local package directory\data\tmp\<date-and-time-stamp>`;
#' if you decide to use a different location, an alternative
#' temporary folder needs to be created first.
#' @keywords remove
#' @export
#' @import dplyr comtradr tibble readr rlang
rm_temporaryFiles <- function(location.temporaryFiles = NULL) {

  ## Obtain location of temporary directory
  if (is.null(location.temporaryFiles)) {
    int_ddir <- system.file("data", package = "comtradeRggregator")
    file.dir <- paste0(int_ddir, "/tmp/")
  } else if (is.strsclr(location.temporaryFiles)) {
    file.dir <- location.temporaryFiles
  } else {
    stop("\nLocation for temporary files defined incorrectly.
         Please change argument 'location.temporaryFiles'.\n")
  }

  ## Check if specified location exists
  if (!file.exists(file.dir) & !is.null(location.temporaryFiles)) {
    stop("\nLocation for temporary files defined incorrectly.
         Please change argument 'location.temporaryFiles'.\n")
  }

  ## Remove if temporary directory is not empty
  tmp.Files <- list.files(file.dir)

  if (!identical(tmp.Files, character(0))) {
    unlink(paste0(file.dir, "/*"), recursive = TRUE, force = TRUE)
    message("Temporary files deleted.")
  } else {
    message("Temporary directory already empty. Nothing to delete.")
  }
}
