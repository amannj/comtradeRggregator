#' @title  Extract Comtrade Data
#'
#' @description  Main function to generate trade data querie that is processed in `download_Comtrade_core()`  to interact with `comtradr::ct_search()` and Comtrade's API to extract Comtrade trade data
#' @param year Year for which to extract data.
#' @param frequency Frequency of data extract; either `annual` or `monthly`; default is `annual`.
#' @param month  Optional parameter for `monthly` extract; ignored for `annual` extracts; default is all 12 month if `frequency = 'monthly'`.
#' @param countries Select list of countries to be extracted; default is `all`.
#' @param partners Specify partner country/countries or `World` (as provided by Comtrade) for global, aggregated trade; default is `World`.
#' @param tradecode Select trade database and classification to be extracted; default is `HS2007`; monthly trade data only available following `HS` classification; the full list of possible trade classifications and their corresponding input arguments used in the `comtradeRggregator` package are provided in *Table Supported Trade Classification*.
#' @param ag  Level of aggregation of trade data; varies by trade data set.
#' @param type Type of trade data to be extracted (either `services` or `commodities`); currently only `type = commodities` implemented.
#' @param select.stats  Trade statistics to be reported; either `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`, `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg` or `all`; default is `all`.
#' @param direction Direction of trade flow reported; either `imports`, `exports`, `re_-_imports`, `re_-_exports` or `all`; default is `all`.
#' @param token Set Comtrade token to increase hourly queries from [Comtrade API](https://comtrade.un.org/Data/Doc/API); increases the speed of large data extraction as it increases the number of queries that can be run per hour.
#' @param ext_cnt Number of countries extracted with each query; default is 5 which is also the maximum in [comtradr](https://github.com/ropensci/comtradr)
#' @param is.mirrorData  Extract mirror trade data? default is `FALSE`; Set to `TRUE` to extract mirror trade data from country/countries specified in argument `partners`. For example, if `is.mirrorData = TRUE` export data from countries specified in argument `countries` to countries specified in argument `partners` is measured as import data from countries specified in argument `countries` to countries specified in argument `partners` as reported by countries specified in argument `partners`.
#' @param rm.temporaryFiles Remove temporary download files stored at location provided in argument `location.temporaryFiles`; default is `TRUE`.
#' @param location.temporaryFiles  Location of temporary file downloads; default is `<your package directory>\data\tmp\<date-and-time-stamp>`; if you decide to use a different location, an alternative temporary folder needs to be created first.
#' @param sleep Number of seconds to wait before the next Comtrade API query is started; default is 20.
#' @keywords Comtrade data download
#' @export
#' @import dplyr comtradr tibble readr rlang



download_Comtrade <- function(year = "2018", #  Years for which to extract
                              frequency = "annual", #  or "monthly"
                              month = NULL, # or c("01", "02"); pecify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
                              countries = "all", # Select list of countries to be extracted; default is 'all'
                              partners = "World", # either 'world' (all countries) or specific country name(s)
                              tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
                              ag = "AG6", #  select level of (dis)aggregation; evaluated automatically
                              type = "commodities", # services not available
                              select.stats = "all", # trade statistics to be selected; default is 'all' which includes `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`, `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg`
                              direction = "all", # imports, exports, re-imports, re-exports or all; default is all
                              token = NULL, # set Comtrade token; default is emp
                              ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr,
                              is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
                              rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
                              location.temporaryFiles = NULL, # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
                              sleep = 20
) {

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


  ## Check `countries` ------
  ### see data extraction


  ## Check `partners` ------
  ### see data extraction


  ## Check `tradecode` ------
  tradecode.ok <- c(
    "HS",
    "HS1992",
    "HS1996",
    "HS2002",
    "HS2007",
    "HS2012",
    "HS2017",
    "SITC",
    "SITCrev1",
    "SITCrev2",
    "SITCrev3",
    "SITCrev4",
    "BEC"
  )
  check_args(tradecode, tradecode.ok, "tradecode")

  ### Check for updates to country/commodity databases:
  ### Checks if Comtrade has made an update to either database specified by arg. `tradecode` and
  ### updates/switches databases automatically.
  ct_type <- comtradr::ct_commodity_db_type()

  if (ct_type != tradecode) {
    comtradr::ct_update_databases(commodity_type = tradecode)
  }
  ### Return warning message for monthly data.
  if (tolower(frequency) == "monthly") {
    message("\nMonthly datasets may mix codes from multiple HS revisions and are provided as is except for\nstandardization of trade flow and partner information, as well as conversion to U.S. dollars.\nPlease see https://comtrade.un.org for more information.\n")
  }


  ## Check `ag` ------
  ag <- toupper(ag)
  ag.ok <- paste0("AG", c("1":"6"))
  check_args(ag, ag.ok, "ag")

  ### Check if selected trade aggregation is reported in the respective database and return error if not.
  .px <- eval_ag(ag = ag,
                 tradecode = tradecode,
                 frequency = frequency)


  ## Check `type` ------
  type.ok <- c("commodities")
  check_args(type, type.ok, "type")


  ## Check `select.stats` ------
  all_stats <- c("trade_value_usd", "qty_unit_code", "qty_unit", "alt_qty_unit_code", "alt_qty_unit", "qty", "alt_qty", "netweight_kg", "gross_weight_kg")
  if ("all" %in% select.stats) {
    .select.stats <- all_stats
  } else {
    .select.stats <- select.stats
  }

  if (sum(.select.stats %not.in% c("all", all_stats)) > 0) {
    stop("\nIncorrect trade statistic(s) specified; possible selections are: '", paste0(all_stats, collapse = "', '"), "' or 'all' (to select all the above).\n")
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


  ## Check `token` and register  ------
  if (!is.null(token)) {
    comtradr::ct_register_token(token)

    if (100 < comtradr::ct_get_remaining_hourly_queries()) {
      message("\n Comtrade token added; download limit set to ", ct_get_remaining_hourly_queries(), " queries per hour.\n")
    } else {
      message("\n Comtrade token incorrect; download restricted to ", ct_get_remaining_hourly_queries(), " queries per hour.\n")
    }
  } else {
    message("\n No Comtrade token specified; download restricted to ", ct_get_remaining_hourly_queries(), " queries per hour.\n")
  }


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

  ## Check `sleep`
  sleep.ok <- c(5:600)
  check_args(sleep, sleep.ok, "sleep")



  # Generate folder structure for temporary downloads  ------------
  time_stamp <- format(Sys.time(), "%Y-%m-%d_%I.%M%p")

  if (is.null(location.temporaryFiles)) {
    loc_folder <- paste0("data/tmp/", time_stamp)
    cur_folder_exists <- list.files(paste0("data/tmp/"), pattern = paste0(time_stamp))
  } else if (is.strsclr(location.temporaryFiles)) {
    loc_folder <- paste0(location.temporaryFiles, "/", time_stamp)
    cur_folder_exists <- list.files(paste0(location.temporaryFiles, "/"), pattern = paste0(time_stamp))
  } else {
    stop("\nLocation for temporary files defined incorrectly. Please change argument 'location.temporaryFiles'.\n")
  }
  ## Create new folder or refer to existing folder
  if (identical(cur_folder_exists, character(0))) {
    dir.create(loc_folder)
    message("\nNew folder created in: '", loc_folder, "'. Temporary files will be stored there.\n")
  } else if (!identical(cur_folder_exists, character(0))) {
    message("\nFolder '", loc_folder, "' already exists. Temporary files will be stored there.\n")
  }



  # Download data availability file once per extract and day   ------------
  Comtrade_DA <- update_ComtradeDA(directory = "data/",
                                   file   = paste0("Comtrade_DataAvailability-", Sys.Date()))


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
        time <- paste0(yr, "-", month)
      }
    }

    # Initialise loop
    for (t in 1:length(time)) {
      ## Extract list of exporters for which in a given period (year or year-month) and trade classification data is available
      ls_cnt <- gen_CountryList(
        directory = "data/",
        file = paste0("Comtrade_DataAvailability-", Sys.Date()),
        type = type,
        frequency = frequency,
        px = .px,
        time = time,
        t = t
      )

      ## Check data availability for `countries` and `partner` for every period t
      ### Check if selected countries are available in Comrade's list of reporters
      if ("all" %in% countries) {
        countries <- "all"
      } else {
        cnt_exist <- ls_cnt[ls_cnt %in% countries == TRUE]
        cnt_missing <- countries[countries %in% cnt_exist == FALSE]

        if (!identical(cnt_missing, character(0))) {
          stop("\nCountry '", paste0(cnt_missing, collapse = "', '"), "' not contained in particular version of Comtrade data base. Please check availability for selected data base using `is.available_Comtrade()` and/or spelling.\n")
        }
      }

      ### Check country availability for `partners` conditional on available data (ls_cont)
      if (is.null(partners)) {
        stop("\nPlease specify partner country/countries for mirror data extract: either 'world' or a (set of) specific country/countries.\n")
      }
      if (("world" %in% partners) | ("World" %in% partners)) {
        partners <- "World"
      }
      if ("World" %not.in% partners) {
        cnt_exist <- ls_cnt[ls_cnt %in% partners == TRUE]
        cnt_missing <- partners[partners %in% cnt_exist == FALSE]

        if (!identical(cnt_missing, character(0))) {
          stop("Partner(s) '", paste0(cnt_missing, collapse = "', '"), "' not contained in Comtrade data base. Please check availability and spelling.\n")
        }
      }

      ### Check if selected list of countries is > 5 (cometradr's extraction limit) and break extraction up in J groups of length ext_cnt
      ### plus sub-set country list for small extract
      ls_cntj <- ls_cnt
      if (countries %not.in% "all") {
        ls_cntj <- ls_cnt[ls_cnt %in% countries]
      }
      .ext_cnt <- ext_cnt
      idx <- 1:.ext_cnt
      J <- ceiling(length(ls_cntj) / .ext_cnt)

      ## Loop through reporter groups j=1,...J and aggregation level
      for (j in 1:J) {
        for (.ag in ag) {
          ### Select country list for extraction
          i <- ls_cntj[idx][!is.na(ls_cntj[idx])]

          ### All imports and exports for a list of up to five countries (non-mirrored countries)
          if (is.mirrorData == FALSE) {
            if (partners == "World") {
              df_download_all <- download_Comtrade_wrapper(
                rep = i,
                partners = partners,
                date = time[t],
                dir = direction,
                aggregation_level = .ag,
                is.mirrorData = is.mirrorData,
                select.stats = .select.stats,
                frequency = tolower(frequency),
                sleep = sleep
              )
              if (nrow(df_download_all) > 0) {
                saveRDS(df_download_all, paste0(loc_folder, "/", tradecode, "-vanilla_", ag, "-", tolower(frequency), "_", time[t], "_", j, "-", J, ".rds"))
              }
            } else {
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

                df_download_all <- download_Comtrade_wrapper(
                  rep = i,
                  partners = l,
                  date = time[t],
                  dir = direction,
                  aggregation_level = .ag,
                  is.mirrorData = is.mirrorData,
                  select.stats = .select.stats,
                  frequency = tolower(frequency),
                  sleep = sleep
                )
                if (nrow(df_download_all) > 0) {
                  saveRDS(df_download_all, paste0(loc_folder, "/", tradecode, "-vanilla_", ag, "-", tolower(frequency), "_", k, "-", K, "_", time[t], "_", j, "-", J, ".rds"))
                }
                ### Update index
                kdx <- kdx + .ext_cnt
              }
            }
          }
          ### All imports and exports for a list of up to five countries (mirrored country)
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
                aggregation_level = .ag,
                is.mirrorData = is.mirrorData,
                select.stats = .select.stats,
                frequency = tolower(frequency),
                sleep = sleep
              )
              if (nrow(df_download_mirrored) > 0) {
                saveRDS(df_download_mirrored, paste0(loc_folder, "/", tradecode, "-mirrored_", ag, "-", tolower(frequency), "_", k, "-", K, "_", time[t], "_", j, "-", J, ".rds"))
              }
              # Update index
              kdx <- kdx + .ext_cnt
            }
          }
          ### Update message
          message(j, "/", J, " for ", ag, " and year ", t, " completed.")
          message('')
        }
        ## Update index
        idx <- idx + .ext_cnt
      }
    }
  }

  # Aggregate data, remove tmp files and save   ------------
  build_Comtrade(
    directory = loc_folder,
    rm.temporaryFiles = rm.temporaryFiles,
    is.mirrorData = is.mirrorData,
    partner = partners
  )
}
