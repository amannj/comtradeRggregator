#' @title  Extract Comtrade Data
#'
#' @description  Main function to generate trade data query that is processed
#' in `download_Comtrade_core()`  to interact with `comtradr::ct_search()`
#' and [Comtrade's API](https://comtrade.un.org/data/doc/api/) to
#' extract Comtrade trade data.
#' @param year Year for which to extract data.
#' @param frequency Frequency of data extract;
#' either `annual` or `monthly`; default is `annual`.
#' @param month  Optional parameter for `monthly` extract; ignored for
#'  `annual` extracts; default is all 12 months if
#'  `frequency = 'monthly'` while argument `monthly` remains unspecified.
#' @param countries Specify country(s) of interest, as a character vector;
#' can either be a vector of country names, or `all` (will download all available
#' countries for the given specification); default is `all`.
#' @param partners Specify partner country/countries or `World`
#' (as provided by Comtrade); use option `all` if you want to
#' download trade data from all
#' available countries but not Comtrade's `World` aggregate; default is `World`.
#'    - If `is.mirrorData = FALSE` and `partners = 'World'`,
#'    `download_Comtrade()` will download aggregated *"World"* trade as
#'    provided by [Comtrade](https://comtrade.un.org).
#'    - If `is.mirrorData = TRUE` and `partners = 'World'`, no *"World"*
#'    aggregate is available via [Comtrade](https://comtrade.un.org).
#'    In this case, `download_Comtrade()` will download mirror trade data
#'    for [all available countries](https://comtrade.un.org/data/da), and
#'    creates and returns an artificial 'World' aggregate by summing up over
#'    all available countries.
#' @param nomenclature Select nomenclature and corresponding trade database for
#' data extraction;  default is `HS2007`/`H3`; monthly trade data only available
#' for `HS`. The full list of possible trade classifications and
#' corresponding input arguments are
#' provided in table Trade Classification
#' ([link](https://github.com/amannj/comtradeRggregator#trade-classifications));
#' argument accepts long classification names, e.g. `HS2007`, as well as
#' abbreviations, e.g. `HS3`, as inputs.
#' @param commodity Specify commodity code or trade data aggregate for download.
#' Both vary by trade data set; see
#' Trade Classification
#' ([link](https://amannj.github.io/resources/comtradeRggregator/index.html#trade-classifications))
#' for more information.
#' @param type Type of trade data to be extracted
#' (either `services` or `commodities`); currently only
#' `type = commodities` implemented.
#' @param select.stats  Trade statistics to be reported;
#' either `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`,
#' `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg`
#' or `all`; default is `all`.
#' @param direction Direction of trade flow reported; either `imports`,
#' `exports`, `re-imports`, `re-exports` or `all`; default is `all`.
#' @param token Set Comtrade token to increase hourly queries from
#' [Comtrade API](https://comtrade.un.org/Data/Doc/API); increases the speed
#' of large data extraction as it increases the number of queries that can be
#' run per hour.
#' @param ext_cnt Number of countries extracted with each query; default is
#' 5 which is also the maximum in
#' [comtradr](https://github.com/ropensci/comtradr). In case your query exceeds
#'  the maximum resultset allowed by the comtrade API, reduce the number of
#'  countries you extract with every query using the ext_cnt parameter.
#'  For example, if a data extraction request fails with the default parameter
#'  value `ext_cnt = 5`, try reducing it to, say, `ext_cnt = 3`.
#'  This reduces the size of the resultset.
#' @param is.mirrorData  Extract mirror trade data? default is `FALSE`;
#' set to `TRUE` to extract mirror trade data from country/countries specified
#' in argument `partners`. For example, if `is.mirrorData = TRUE` export data
#' from countries specified in argument `countries` to countries specified in
#' argument `partners` is measured as import data from countries specified in
#' argument `countries` to countries specified in argument `partners` as
#' reported by countries specified in argument `partners`.
#' @param rm.temporaryFiles Remove temporary download files stored at location
#' provided in argument `location.temporaryFiles`; default is `TRUE`.
#' @param location.temporaryFiles  Location of temporary file downloads;
#' default is `your local package directory\data\tmp\<date-and-time-stamp>`;
#' if you decide to use a different location, an alternative temporary
#' folder needs to be created first.
#' @param build.Comtrade After having downloaded the separate temporary
#' files (which will be saved to `location.temporaryFiles`), should function
#'  `download_Comtrade()` return a complete data object? Default is `TRUE`.
#' @param sleep Number of seconds to wait before the next Comtrade API
#' query is started; default is 5.
#' @keywords Comtrade data download
#' @export
#' @import dplyr comtradr tibble readr rlang
#' @examples
#' \dontrun{
#' AT_World <- download_Comtrade(
#'   year = "2018",
#'   frequency = "annual",
#'   countries = "Austria",
#'   partners = "World",
#'   nomenclature = "HS2007",
#'   commodity = "AG6",
#'   type = "commodities",
#'   select.stats = "trade_value_usd",
#'   direction = "all"
#' )
#' AT_World
#' }
#'
download_Comtrade <- function(year = "2018",
                              frequency = "annual",
                              month = NULL,
                              countries = "all",
                              partners = "World",
                              nomenclature = "HS2007",
                              commodity = "AG6",
                              type = "commodities",
                              select.stats = "all",
                              direction = "all",
                              token = NULL,
                              ext_cnt = 5,
                              is.mirrorData = FALSE,
                              rm.temporaryFiles = TRUE,
                              location.temporaryFiles = NULL,
                              build.Comtrade = TRUE,
                              sleep = 5) {


  # Check input arguments of `download_Comtrade()` ------------
  ## Check `year` ------
  year.is <- as.numeric(year)
  year.ok <- c("1962":format(Sys.Date(), format = "%Y"))
  if ((sum(year.is %in% year.ok) == length(year.is)) == FALSE) {
    stop(paste0("Variable 'year' incorrectly specified."))
  }


  ## Check `frequency` ------
  frequency.ok <- c("annual", "monthly")
  check_args(frequency, frequency.ok, "frequency")



  ## Check `month` ------
  if (frequency == "monthly") {
    if (is.null(month)) {
      month.is <- "12"
    } else {
      month.is <- month
    }
  } else {
    # Redundant for annual data; set to arbitrary month to pass `check_args()`
    month.is <- "12"
  }
  month.is <- as.numeric(month.is)
  month.ok <- c("1":"12")
  if ((sum(month.is %in% month.ok) == length(month.is)) == FALSE) {
    stop(paste0("Variable 'month' incorrectly specified."))
  }


  ## Check `nomenclature` and return arg  ------
  nomenclature <- convert_nomenclature(
    nomenclature = nomenclature,
    return = "Name"
  )

  ### Check for updates to country/commodity databases:
  ### Checks if Comtrade has made an update to either database specified
  ### by arg. `nomenclature` and
  ### updates/switches databases automatically.
  ct_type <- comtradr::ct_commodity_db_type()

  if (ct_type != nomenclature) {
    comtradr::ct_update_databases(commodity_type = nomenclature)
  }
  ### Return warning message for monthly data.
  if (tolower(frequency) == "monthly") {
    message("\nMonthly datasets may mix codes from multiple HS revisions and data are provided 'as is'.\nPlease see https://comtrade.un.org for more information.\n")
  }


  ## Check `commodity` ------
  commodity <- toupper(commodity)
  commodity.ok <- c("TOTAL", paste0("AG", c("1":"6")))
  commodity.num <- stringr::str_extract(commodity, "^([0-9]*)$")
  ### Check if aggregated download (AG) or individual trade codes are supplied;
  ag <- ifelse(
    commodity %in% commodity.ok,
    commodity,
    ### check if supplied trade codes match structure of corresponding nomenclature
    ifelse(
      !is.na(commodity.num) & nchar(commodity.num) %in% nchar(commodity),
      paste0("AG", nchar(commodity.num)),
      stop("Variable 'commodity' incorrectly specified.")
    )
  )



  ### Check if selected trade aggregation is reported in the respective
  ### database and return error if not.
  .px <- eval_ag(
    ag = ag,
    nomenclature = nomenclature,
    frequency = frequency
  )


  ## Check `type` ------
  type.ok <- c("commodities")
  check_args(type, type.ok, "type")


  ## Check `select.stats` ------
  all_stats <- c(
    "trade_value_usd", "qty_unit_code", "qty_unit",
    "alt_qty_unit_code", "alt_qty_unit", "qty",
    "alt_qty", "netweight_kg", "gross_weight_kg"
  )
  if ("all" %in% select.stats) {
    .select.stats <- all_stats
  } else {
    .select.stats <- select.stats
  }

  if (sum(.select.stats %not.in% c("all", all_stats)) > 0) {
    stop(
      "\nIncorrect trade statistic(s) specified; possible selections are: '",
      paste0(all_stats, collapse = "', '"),
      "' or 'all' (to select all the above).\n"
    )
  }


  ## Check `direction` ------
  direction.ok <- c("all", "imports", "exports", "re_imports", "re_exports")
  check_args(direction, direction.ok, "direction")

  ### Adjust trade direction for mirror data queries.
  if (is.mirrorData) {
    direction <- ifelse(direction == "imports", "exports",
      ifelse(direction == "exports", "imports",
        ifelse(direction == "re_imports", "re_exports",
          ifelse(direction == "re_exports", "re_imports", "all")
        )
      )
    )
  }


  ## Check `token`  ------
  is.active_token <- check_token(token = token)


  ## Check `ext_cnt` ------
  ext_cnt.is <- as.numeric(ext_cnt)
  ext_cnt.ok <- 1:5
  check_args(ext_cnt.is, ext_cnt.ok, "ext_cnt")


  ## Check `is.mirrorData` ------
  is.mirrorData.ok <- c(TRUE, FALSE)
  check_args(is.mirrorData, is.mirrorData.ok, "is.mirrorData")


  ## Check `rm.temporaryFiles` ------
  rm.temporaryFiles.ok <- c(TRUE, FALSE)
  check_args(rm.temporaryFiles, rm.temporaryFiles.ok, "rm.temporaryFiles")


  ## Check `location.temporaryFiles` ------
  if (!is.null(location.temporaryFiles)) {
    if (!is.character(location.temporaryFiles)) {
      stop("Argument 'location.temporaryFiles' is wrong class.")
    }
  }


  ## Check `build.Comtrade` ------
  build.Comtrade.ok <- c(TRUE, FALSE)
  check_args(build.Comtrade, build.Comtrade.ok, "build.Comtrade")


  ## Check `sleep` -----
  sleep.ok <- c(5:600)
  check_args(sleep, sleep.ok, "sleep")


  ## Define internal download directory -----------
  int_ddir <- system.file("data", package = "comtradeRggregator")



  # Generate folder structure for temporary downloads  ------------
  time_stamp <- format(Sys.time(), "%Y-%m-%d_%I.%M%p")

  if (is.null(location.temporaryFiles)) {

    ## Check if `tmp` folder exists and create otherwise
    if (identical(list.files(int_ddir, pattern = "tmp"), character(0))) {
      dir.create(paste0(int_ddir, "/tmp"))
    }

    loc_folder <- paste0(int_ddir, "/tmp/", time_stamp)
    cur_folder_exists <- list.files(paste0(int_ddir, "/tmp/"),
      pattern = paste0(time_stamp)
    )
  } else if (is.strsclr(location.temporaryFiles)) {
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



  # Download data availability file once per extract and day   ------------
  Comtrade_DA <- update_ComtradeDA(
    directory = int_ddir,
    file = paste0("Comtrade_DataAvailability-", Sys.Date())
  )



  # Extract COMTRADE data ------------
  ## Run
  for (yr in year) {
    # Update time loops
    if (tolower(frequency) == "annual") {
      time <- yr
    } else if (tolower(frequency) == "monthly") {
      if (is.null(month)) {
        # default is 12 months
        month <- sprintf("%0.2d", 01:12)
        time <- paste0(yr, "-", month)
      } else {
        # update time
        month <- sprintf("%0.2d", as.numeric(month))
        time <- paste0(yr, "-", month)
      }
    }

    # Initialise loop
    for (t in seq_along(time)) {
      ## Extract list of exporters for which in a given period
      ## (year or year-month) and trade classification data is available
      ls_cnt <- gen_CountryList(
        directory = int_ddir,
        file = paste0("Comtrade_DataAvailability-", Sys.Date()),
        type = type,
        frequency = frequency,
        .px = .px,
        time = time,
        time_count = t
      )

      ## Check data availability for `countries` and
      ## `partner` for every period t
      ### Check if selected countries are available in Comrade list of reporters
      if ("all" %in% tolower(countries)) {
        countries <- "All"
      } else if (is.mirrorData == FALSE) {
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
      }

      ### Check country availability for `partners` conditional on available
      ### data (ls_cont)
      if (is.null(partners)) {
        stop("\nPlease specify partner country/countries for mirror data
             extract: either 'world' or a (set of) specific
             country/countries.\n")
      }
      if ("world" %in% tolower(partners)) {
        partners <- "World"
      }
      if ("all" %in% tolower(partners)) {
        partners <- "All"
      }
      if ("World" %not.in% partners & "All" %not.in% partners) {
        cnt_exist <- ls_cnt[ls_cnt %in% partners == TRUE]
        cnt_missing <- partners[partners %in% cnt_exist == FALSE]

        if (!identical(cnt_missing, character(0))) {
          stop(
            "Partner(s) '", paste0(cnt_missing, collapse = "', '"),
            "' not contained in Comtrade data base.
               Please check availability and spelling.\n"
          )
        }
      }

      ### Check if selected list of countries is > 5
      ### (cometradr's extraction limit) and break extraction up in J groups
      ### of length ext_cnt plus sub-set country list for small extract
      ls_cntj <- ls_cnt
      if ("All" %not.in% countries & is.mirrorData == FALSE) {
        ls_cntj <- ls_cnt[ls_cnt %in% countries]
      } else if ("All" %not.in% countries & is.mirrorData == TRUE) {
        ls_cntj <- countries
      }

      .ext_cnt <- ext_cnt
      idx <- 1:.ext_cnt
      J <- ceiling(length(ls_cntj) / .ext_cnt)

      ## Loop through reporter groups j=1,...J and aggregation level
      for (j in 1:J) {
        for (.ag in unique(ag)) {
          ### If multiple aggregates are downloaded, replace `commodity`
          ### argument with evaluated aggregate for download
          if (identical(ag, commodity)) {
            down.commod <- .ag
          } else {
            down.commod <- commodity[ag == .ag]
          }

          ### Select country list for extraction
          i <- ls_cntj[idx][!is.na(ls_cntj[idx])]

          ### All imports and exports for a list of up to five countries
          ### (non-mirrored countries)
          if (is.mirrorData == FALSE) {
            if ("World" %in% partners & is.strsclr(partners)) {
              df_download_all <- download_Comtrade_wrapper(
                rep = i,
                partners = partners,
                date = time[t],
                dir = direction,
                commodity = down.commod,
                is.mirrorData = is.mirrorData,
                select.stats = .select.stats,
                frequency = tolower(frequency),
                sleep = sleep
              )
              if (nrow(df_download_all) > 0) {
                saveRDS(
                  df_download_all,
                  paste0(
                    loc_folder, "/",
                    nomenclature, "-vanilla_",
                    .ag, "-", tolower(frequency), "_",
                    time[t], "_", j, "-", J, ".rds"
                  )
                )
              }
            } else {
              ### Check length of partner countries
              ls_cntk <- ls_cnt
              if ("All" %not.in% partners) {
                ls_cntk <- ls_cntk[ls_cntk %in% partners]
              }
              kdx <- 1:5
              K <- ceiling(length(ls_cntk) / ext_cnt)

              ### Loop through every k group of partners
              for (k in 1:K) {
                l <- ls_cntk[kdx][!is.na(ls_cntk[kdx])]

                df_download_all <- download_Comtrade_wrapper(
                  rep = i,
                  partners = l,
                  date = time[t],
                  dir = direction,
                  commodity = down.commod,
                  is.mirrorData = is.mirrorData,
                  select.stats = .select.stats,
                  frequency = tolower(frequency),
                  sleep = sleep
                )
                if (nrow(df_download_all) > 0) {
                  saveRDS(
                    df_download_all,
                    paste0(
                      loc_folder, "/",
                      nomenclature, "-vanilla_",
                      .ag, "-", tolower(frequency), "_",
                      k, "-", K, "_",
                      time[t], "_", j, "-", J, ".rds"
                    )
                  )
                }
                ### Update index
                kdx <- kdx + .ext_cnt
              }
            }
          }
          ### All imports and exports for a list of up to five countries
          ### (mirrored country)
          if (is.mirrorData == TRUE) {
            ### Check length of partner countries
            ls_cntk <- ls_cnt
            if ("World" %not.in% partners) {
              ls_cntk <- ls_cntk[ls_cntk %in% partners]
            }
            kdx <- 1:.ext_cnt
            K <- ceiling(length(ls_cntk) / ext_cnt)

            ### Loop through every k group of partners
            for (k in 1:K) {
              l <- ls_cntk[kdx][!is.na(ls_cntk[kdx])]

              df_download_mirrored <- download_Comtrade_wrapper(
                rep = l,
                partners = i,
                date = time[t],
                dir = direction,
                commodity = down.commod,
                is.mirrorData = is.mirrorData,
                select.stats = .select.stats,
                frequency = tolower(frequency),
                sleep = sleep
              )
              if (nrow(df_download_mirrored) > 0) {
                saveRDS(
                  df_download_mirrored,
                  paste0(
                    loc_folder, "/",
                    nomenclature, "-mirrored_",
                    .ag, "-", tolower(frequency), "_",
                    k, "-", K, "_",
                    time[t], "_", j, "-", J, ".rds"
                  )
                )
              }
              # Update index
              kdx <- kdx + .ext_cnt
            }
          }
          ### Update message
          message(j, "/", J, " for ", .ag, " and year ", t, " completed.")
          message("")
        }
        ## Update index
        idx <- idx + .ext_cnt
      }
    }
  }

  # Aggregate data, remove tmp files and return object ------------
  if (build.Comtrade == TRUE) {
    df_out <- build_Comtrade(
      directory = loc_folder,
      rm.temporaryFiles = rm.temporaryFiles,
      is.mirrorData = is.mirrorData,
      partner = partners
    )
  }
  if (build.Comtrade == FALSE) {
    message("Data download complete. Please see location specified in argument
            `location.temporaryFiles` for location of temporary files.")
    df_out <- NULL
  }
  return(df_out)
}
