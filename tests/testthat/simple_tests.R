# Setup ----------

# devtools::install_github("amannj/comtradeRggregator",
#                          ref = "master",
#                          auth_token = "..."
# )
library(comtradeRggregator)

## Please update to use your own when testing
mytoken <- "lhsmuyUVrMuKuxtet0TbbJdfVUChniTF2DqR8kUxb9PqNxf2aQ+AqE+BwKHKycyg84HWaXUszKnPCKJ8zO5eFqoANzWiPaGX7dX/XEUAO0jImhk6ro/YqiL4hsPn4VLxHK5hSnE8vsHebKzR28GjyA=="
mytempDirectory <- "C:/Users/juerg/Desktop/tmp"
# mytoken <- '...'

# Test 1: Basic country selection and storage of tmp files  -------------------------------
### Works for Austria
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "World",
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all", #  trade statistics to be selected; default is 'all' which includes `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`, `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg`.
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL, # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
  sleep = 10
) -> AT_World
### Works for Austria's exports to Germany
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = c("Germany"),
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "exports", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all", #  trade statistics to be selected; default is 'all' which includes `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`, `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg`.
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
) -> X_AT_DE
### Works for Austria's exports to multiple countries
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = c("Germany", "Australia", "France", "Japan", "Italy", "Spain"),
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "exports", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all", #  trade statistics to be selected; default is 'all' which includes `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`, `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg`.
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
) -> X_AT_some
X_AT_some %>% distinct(trade_flow)
X_AT_some %>% distinct(partner)

### Fails if country does not exist
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = c("Germany", "Atlantis"),
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "exports", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all", #  trade statistics to be selected; default is 'all' which includes `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`, `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg`.
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)

### Works for user-specified temporary directories
## Note: you have to create that folder yourself first and link to it with: `mytempDirectory`
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "World",
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all", #  trade statistics to be selected; default is 'all' which includes `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`, `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg`.
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = FALSE, # Remove temporary files from data download; default is false
  location.temporaryFiles = mytempDirectory # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)
### Doesn't work for countries that don't exist
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Atlantis", # Select list of countries to be extracted; default is 'all'
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all",
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)

### fails because input arguments are not specified correctly (checks for reasonable values/default arguments
download_Comtrade(
  year = "2218", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Atlantis", # Select list of countries to be extracted; default is 'all'
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all",
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)


# Test 2: country selection cond. on data availability  -------------------------------
### Fails because there is no monthly trade data for Austria:
download_Comtrade(
  year = c("2018", "2019"), #  Years for which to extract
  frequency = "monthly", #  or "monthly"
  month = c("01", "02"), # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = c("Austria", "Australia"), # Select list of countries to be extracted; default is 'all'
  partners = "World",
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all",
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)
### Works for Australia
download_Comtrade(
  year = c("2018", "2019"), #  Years for which to extract
  frequency = c("monthly"), #  or "monthly"
  month = c("01", "02"), # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = c("Australia"), # Select list of countries to be extracted; default is 'all'
  partners = "World",
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all",
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)


# Test 3: Trade classification  -------------------------------
## Fails as ag 5 not defined for HS3
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "World",
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag5", #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all",
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)
## Fails as ag 5 not defined for SITCrev3
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "World",
  tradecode = "SITCrev3", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  select.stats = "all",
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)
## Works
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "World",
  tradecode = "SITCrev3", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag5", #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  select.stats = "all",
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)


# Test 4: Mirror data  -------------------------------
## Fails because partner does not exist
download_Comtrade(
  year = c("2018"), #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = c("Atlantis", "Germany"), # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all",
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = TRUE, # Extract mirrored trade data; only one country supported at the moment
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)
## Doesn't work for monthly data (no monthly trade data for AUT)
download_Comtrade(
  year = c("2018"), #  Years for which to extract
  frequency = "monthly", #  or "monthly"
  month = "01", # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "Germany", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  select.stats = "all",
  type = "commodities", # services not available
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = TRUE, # Extract mirrored trade data; only one country supported at the moment
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)



## Test 4.5: Test if mirror data adds up   -------------------------------

## Works for AUT-DEU mirror trade
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "Germany", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  select.stats = "trade_value_usd",
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = TRUE, # Extract mirrored trade data; only one country supported at the moment
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
) -> mirr_AT_DE
## Works for AUT-DEU mirror trade
download_Comtrade(
  year = c("2018"), #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Germany", # Select list of countries to be extracted; default is 'all'
  partners = "Austria", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
  select.stats = "trade_value_usd",
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = TRUE, # Extract mirrored trade data; only one country supported at the moment
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
) -> mirr_DE_AT
## Compare the two:
mirr_AT_DE %>%
  summarise(sum(trade_value_usd)) %>%
  pull() / mirr_DE_AT %>%
    summarise(sum(trade_value_usd)) %>%
    pull()
# around 1.053245

## Check if Exports from Austria to Germany are similar to Imports to Germany from Austria (mirror data)
download_Comtrade(
  year = c("2018"), #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "Germany", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
  select.stats = "trade_value_usd",
  direction = "exports", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
) -> X_AT_DE

download_Comtrade(
  year = c("2018"), #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Germany", # Select list of countries to be extracted; default is 'all'
  partners = "Austria", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
  select.stats = "trade_value_usd",
  direction = "imports", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
) -> IM_DE_AT
X_AT_DE %>%
  summarise(sum(trade_value_usd)) %>%
  pull() / IM_DE_AT %>%
    summarise(sum(trade_value_usd)) %>%
    pull()
# around 1.073449

download_Comtrade(
  year = c("2018"), #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "Germany", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
  select.stats = "trade_value_usd",
  direction = "exports", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = TRUE, # Extract mirrored trade data; only one country supported at the moment
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
) -> mirrX_AT_DE
X_AT_DE %>%
  summarise(sum(trade_value_usd)) %>%
  pull() / mirrX_AT_DE %>%
    summarise(sum(trade_value_usd)) %>%
    pull()
# around 1.073449

IM_DE_AT %>%
  summarise(sum(trade_value_usd)) %>%
  pull() / mirrX_AT_DE %>%
    summarise(sum(trade_value_usd)) %>%
    pull()
# need to be 100% by construction



## Also works with 'world' mirror data
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  partners = "World",
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = "all", #  trade statistics to be selected; default is 'all' which includes `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`, `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg`.
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = TRUE, # Extract mirrored trade data; only one country supported at the moment
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
) -> AT_World_mirrored
## Compare the two:
AT_World_mirrored %>%
  summarise(sum(trade_value_usd)) %>%
  pull() / AT_World %>%
    summarise(sum(trade_value_usd)) %>%
    pull()
# around 0.97



# Test 5: Test is.available_Comtrade() function   -------------------------------
### Works
is.available_Comtrade(frequency = "annual", tradecode = "H3", year = 2008)
### Works
is.available_Comtrade(is.contained = c("Austria", "Germany"), frequency = "annual", tradecode = "H2", year = 2012)
### Works
is.available_Comtrade(is.contained = c("Austria", "Germany"), frequency = "monthly", month = "01")
### Should fail as data availability varies by month
is.available_Comtrade(is.contained = c("Germany"), frequency = "monthly", month = c("01", "02"))


# Test 6: Only select particular trade   -------------------------------
### Works
download_Comtrade(
  year = "2018", #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  tradecode = "HS2012", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = "ag6", #  select level of (dis)aggregation; evaluated automatically
  direction = "exports", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = c("trade_value_usd", "qty"), # only select trade_value_usd and quantity
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)
### Fails because of incorrect  stats names
download_Comtrade(
  year = c("2018"), #  Years for which to extract
  frequency = "annual", #  or "monthly"
  month = NULL, # or c("01", "02"); specify months to be extracted for monthly data extraction; default is all 12 months if frequency == 'monthly'
  countries = "Austria", # Select list of countries to be extracted; default is 'all'
  tradecode = "HS2007", # select trade classification to be extracted; default is HS03; monthly data only available as HS
  ag = c("ag6"), #  select level of (dis)aggregation; evaluated automatically
  direction = "all", # imports, exports, re-imports, re-exports or all; default is all
  type = "commodities", # services not available
  select.stats = c("lala", "qty"), # only select trade_value_usd and quantity
  rm.temporaryFiles = TRUE, # Remove temporary files from data download; default is false
  token = mytoken, # set Comtrade token;
  ext_cnt = 5, # number of countries extracted with each query; default is 5 which is also the max. in comtradr
  is.mirrorData = FALSE, # Extract mirrored trade data; only one country supported at the moment
  location.temporaryFiles = NULL # location of temporary file downloads; default is `<package-directory>\data\tmp\<date-and-time-stamp>
)


# Test 7.hs: Check all concordance tables for HS  -------------------------------
download_Comtrade(
  year = "2018",
  month = "01",
  frequency = "monthly",
  countries = "Australia",
  partners = "World",
  tradecode = "HS",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> AU_World_HS
codes <- c("BE", "CC", "CP", "GP", "H0", "H1", "H2", "H3", "H4", "I2", "I3", "IU", "MT", "S1", "S2", "S3", "S4")
for (c in codes) {
  AU_World_HS %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      convert.to = c
    ) -> out
  message("\n-------------------\n HS combined to ", c, "\n-------------------\n")
  print(out)
}


# Test 7.h0: Check all concordance tables for HS 0 -------------------------------
download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "World",
  tradecode = "HS1992",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> AT_World_H0
codes <- c("BE", "CC", "CP", "GP", "I2", "I3", "IU", "MT", "S1", "S2", "S3", "S4")
for (c in codes) {
  AT_World_H0 %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      convert.to = c
    ) -> out
  message("\n-------------------\n HS0 to ", c, "\n-------------------\n")
  print(out)
}

# Test 7.h1: Check all concordance tables for HS 1 -------------------------------
download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "World",
  tradecode = "HS1996",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> AT_World_H1
codes <- c("BE", "CC", "CP", "GP", "H0", "I2", "I3", "IU", "MT", "S1", "S2", "S3", "S4")
for (c in codes) {
  AT_World_H1 %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      convert.to = c
    ) -> out
  message("\n-------------------\n HS1 to ", c, "\n-------------------\n")
  print(out)
}

# Test 7.h2: Check all concordance tables for HS 2 -------------------------------
download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "World",
  tradecode = "HS2002",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> AT_World_H2
codes <- c("BE", "CC", "CP", "GP", "H0", "H1", "I2", "I3", "IU", "MT", "S1", "S2", "S3", "S4")
for (c in codes) {
  AT_World_H2 %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      convert.to = c
    ) -> out
  message("\n-------------------\n HS2 to ", c, "\n-------------------\n")
  print(out)
}

# Test 7.h3: Check all concordance tables for HS 3 -------------------------------
download_Comtrade(
  year = "2010",
  frequency = "annual",
  countries = "Austria",
  partners = "World",
  tradecode = "HS2007",
  ag = "AG2",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> AT_World_H3
codes <- c("BE", "CC", "CP", "GP", "H0", "H1", "H2", "I2", "I3", "IU", "MT", "S1", "S2", "S3", "S4")
for (c in codes) {
  AT_World_H3 %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      convert.to = c
    ) -> out
  message("\n-------------------\n HS3 to ", c, "\n-------------------\n")
  print(out)
}

# Test 7.h4: Check all concordance tables for HS 4 -------------------------------
download_Comtrade(
  year = "2017",
  frequency = "annual",
  countries = "Germany",
  partners = "World",
  tradecode = "HS2012",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> DE_World_H4

codes <- c("H0", "H1", "H2", "H3", "S1", "S2", "S3", "S4")
for (c in codes) {
  DE_World_H4 %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      convert.to = c
    ) -> out
  message("\n-------------------\n HS4 to ", c, "\n-------------------\n")
  print(out)
}

# Test 7.h5: Check all concordance tables for HS 5 -------------------------------
download_Comtrade(
  year = "2017",
  frequency = "annual",
  countries = "Germany",
  partners = "World",
  tradecode = "HS2017",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> DE_World_H5

codes <- c("H0", "H1", "H2", "H3", "H4", "S1", "S2", "S3", "S4")
for (c in codes) {
  DE_World_H5 %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      convert.to = c
    ) -> out
  message("\n-------------------\n HS5 to ", c, "\n-------------------\n")
  print(out)
}




# Test 8: Concordance   -------------------------------
df <- tibble(var = c("1", "11", "111"))
df %>% add_lzs(variable = "var", variable.length = 5)


# Test 9: Remove temporary files   -------------------------------
rm_temporaryFiles(location.temporaryFiles = NULL)
rm_temporaryFiles(location.temporaryFiles = NULL) # feedback if tmp folder already empty
rm_temporaryFiles(location.temporaryFiles = mytempDirectory)
rm_temporaryFiles(location.temporaryFiles = mytempDirectory) # same
