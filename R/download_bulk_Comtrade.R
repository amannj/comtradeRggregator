#' @title Comtrade bulk download
#'
#' @description Bulk data download from comtrade.org....
#' @param type trade data type; valid input arguments are `commodities`
#' (for merchandise trade data), or `services` (for trade in services data);
#' default is `commodities`. Corresponds to parameter `type` in
#' UN Comtrade data request format (see link below).
#' @param frequency Frequency of data extract;
#' either `annual` or `monthly`; default is `annual`. Corresponds to parameter
#' `freq` in UN Comtrade data request format (see link below).
#' @param year Year for which to extract data. Corresponds to parameter
#' `ps` in UN Comtrade data request format (see link below).
#' @param month  Optional parameter for `monthly` extract; ignored for
#' `annual` extracts; default is all 12 months if
#' `frequency = 'monthly'` while argument `monthly` remains unspecified.
#' Corresponds to parameter `ps` in UN Comtrade data request format
#' (see link below).
#' @param countries Specify country(s) of interest, as a character vector;
#' can either be a vector of country names, or `all` (will download all available
#' countries for the given specification); default is `all`.
#' Corresponds to parameter `r` in UN Comtrade data request format
#' (see link below).
#' @param nomenclature Select nomenclature and corresponding trade database for
#' data extraction;  default is `HS2007`/`H3`; monthly trade data only available
#' for `HS`. The full list of possible trade classifications and
#' corresponding input arguments are
#' provided in table Trade Classification
#' ([link](https://github.com/amannj/comtradeRggregator#trade-classifications));
#' argument accepts long classification names, e.g. `HS2007`, as well as
#' abbreviations, e.g. `HS3`, as inputs.
#' @param token ...
#' @param rm.zip ...
#' @param load.data ...
#' @param location.temporaryFiles ...
#' @keywords download comtrade bulk
#' @source https://comtrade.un.org/data/doc/api/bulk/#DataRequestsDwn https://comtrade.un.org/Data/doc/api/#DataResponses
#' @export
#' @import dplyr tibble readr rlang
#' @importFrom httpuv encodeURIComponent
download_bulk_Comtrade <- function(type = "commodities",
                                  frequency = "annual",
                                  year = "2018",
                                  month = NULL,
                                  countries = "Australia",
                                  nomenclature = "H3",
                                  token = NULL,
                                  rm.zip = TRUE,
                                  load.data = FALSE,
                                  location.temporaryFiles = NULL) {



  # Check and transform input arguments ----------

  ## Check trade data `type` ------
  type.is <- c("commodities", "services")
  check_args(type, type.is, "type")
  type <- if (type == "commodities") "C" else "S"

  ## Check time extractions ----
  ### Check `frequency` ------
  frequency.ok <- c("annual", "monthly")
  check_args(frequency, frequency.ok, "frequency")
  freq <- if (frequency == "annual") "A" else "M"

  ### Check `year` ------
  year.is <- as.numeric(year)
  year.ok <- c("1962":format(Sys.Date(), format = "%Y"))
  if ((sum(year.is %in% year.ok) == length(year.is)) == FALSE) {
    stop(paste0("Variable 'year' incorrectly specified."))
  }

  ### Check `month` ------
  if (frequency == "monthly") {
    if (is.null(month)) {
      # If monthly but no month specified, use all 12 months.
      month.is <- sprintf("%0.2d", 01:12)
    } else {
      month.is <- sprintf("%0.2d", month)
    }
  } else {
    # Redundant for annual data; set to arbitrary month to pass `check_args()`
    month.is <- "12"
  }
  month.ok <- sprintf("%0.2d", 01:12)

  if ((sum(month.is %in% month.ok) == length(month.is)) == FALSE) {
    stop(paste0("Variable 'month' incorrectly specified."))
  }

  ### Generate ps ------
  if (frequency == "monthly") {
    ps <- paste0(as.character(year.is), as.character(month.is))
  } else {
    ps <- as.character(year.is)
  }


  ## Check `nomenclature` and return arg  ------
  px <- convert_nomenclature(
    nomenclature = nomenclature,
    return = "Abbr"
  )

  ## Monthly data only available with HS; produce error if misspecifed
  if (px != "HS" & frequency == "monthly") stop("Monthly data only available in HS nomenclature.")


  ## Check `country` ------
  if (countries == "all") {
    r <- "ALL"
  } else {
    ls_cnt <- gen_CountryList(
      directory = system.file("data", package = "comtradeRggregator"), # int_ddir,
      file = paste0("Comtrade_DataAvailability-", Sys.Date()),
      type = type,
      frequency = frequency,
      .px = px,
      time = year,
      time_count = 1
    )
    cnt_exist <- ls_cnt[ls_cnt %in% countries == TRUE]
    cnt_missing <- countries[countries %in% cnt_exist == FALSE]

    if (!identical(cnt_missing, character(0))) {
      stop(
        "\nCountry '", paste0(cnt_missing, collapse = "', '"),
        "' not contained in particular version of Comtrade data base.
               Please check availability for selected data base using
               `is.available_Comtrade()` and/or spelling.\n"
      )
    }
    r <- Comtrade_DA %>%
      filter(.data$rDesc %in% countries) %>%
      select(.data$r, .data$rDesc) %>%
      distinct() %>%
      pull(.data$r)
  }
  ### If more than one country specified, download all and sub-set later
  if (length(countries) > 1) {
    r <- "ALL"
  }

  ## Check `token` -------
  if (is.null(validate_token(token))) stop("Comtrade bulk downloads only possible with registered token.")


  ## Check `location` argument -------
  if (!is.null(location.temporaryFiles)) {
    if (!is.character(location.temporaryFiles)) {
      stop("Argument 'location.temporaryFiles' is wrong class.")
    }
  }


  # Extractions ------

  ## Generate folder structure for temporary downloads  ------------
  time_stamp <- format(Sys.time(), "%Y-%m-%d_%I.%M%p")

  if (is.strsclr(location.temporaryFiles)) {
    loc_folder <- paste0(location.temporaryFiles, "/", time_stamp)
    cur_folder_exists <- list.files(paste0(location.temporaryFiles, "/"),
                                    pattern = paste0(time_stamp)
    )
  } else {
    stop("\nLocation for temporary files defined incorrectly.
         Please change argument 'location.temporaryFiles'.\n")
  }
  ## Create new folder or refer to existing folder
  if (identical(cur_folder_exists, character(0))) {
    dir.create(loc_folder)
    message(
      "\nNew folder created in: '",
      loc_folder,
      "'. Temporary files will be stored there.\n"
    )
  } else if (!identical(cur_folder_exists, character(0))) {
    message(
      "\nFolder '",
      loc_folder,
      "' already exists. Temporary files will be stored there.\n"
    )
  }


  ## Encode token and bind api call -----
  token_encoded <- httpuv::encodeURIComponent(token)

  ## Extract for each time period separately
  for (t in seq_along(ps)) {
    api_call <- paste("https://comtrade.un.org/api/get/bulk", type, freq, ps[t], r,
                      paste0(px, "?token=", token_encoded),
                      sep = "/"
    )

    ## Download and store -----
    fn <- paste0("comtrade_", ps[t], "_", time_stamp, ".zip")
    utils::download.file(api_call, destfile = paste0(loc_folder, "/", fn), mode = "wb")
  }

  # # Unzip and read
  # zipfile <- unzip(
  #   zipfile = paste0(loc_folder, "/", fn),
  #   list = TRUE,
  #   exdir = loc_folder
  # )
  # data <- readr::read_csv(file = unzip(
  #   zipfile =
  #     paste0(loc_folder, "/", fn),
  #   paste0(zipfile$Name[1]),
  #   exdir = loc_folder
  # ))
  # head(data, n = 200)
}


