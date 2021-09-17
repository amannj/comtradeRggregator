# Setup ----------

# devtools::install_github("amannj/comtradeRggregator",
#                          ref = "master",
#                          auth_token = "..."
# )

##run codecov
covr::codecov(token = "625f5add-28a3-4c5b-9964-a1d71a14258d")

# run gp
#   library(comtradeRggregator)
#   goodpractice::gp()

actualtoken <- "lhsmuyUVrMuKuxtet0TbbJdfVUChniTF2DqR8kUxb9PqNxf2aQ+AqE+BwKHKycyg84HWaXUszKnPCKJ8zO5eFqoANzWiPaGX7dX/XEUAO0jImhk6ro/YqiL4hsPn4VLxHK5hSnE8vsHebKzR28GjyA=="

comtradr::ct_get_remaining_hourly_queries()
comtradr::ct_register_token('noactualtoken')
comtradr::ct_get_remaining_hourly_queries()

rjson::fromJSON(
  file = paste0("https://comtrade.un.org/api/getUserInfo?token=", actualtoken)
)

library(dplyr)
comtradr::ct_register_token("sometoken")
comtradr::ct_search(reporters ="China",partners="All",
          trade_direction ="all",freq = "annual",
          start_date ="all",end_date = "all",commod_codes = "01") %>%
  as_tibble()

#
#
# library("rjson")
# get.Comtrade <- function(url="http://comtrade.un.org/api/get?"
#                          ,maxrec=50000
#                          ,type="C"
#                          ,freq="A"
#                          ,px="HS"
#                          ,ps="now"
#                          ,r
#                          ,p
#                          ,rg="all"
#                          ,cc="TOTAL"
#                          ,fmt="json"
#                          ,token='..token..'
# )
# {
#   string<- paste(url
#                  ,"max=",maxrec,"&" #maximum no. of records returned
#                  ,"type=",type,"&" #type of trade (c=commodities)
#                  ,"freq=",freq,"&" #frequency
#                  ,"px=",px,"&" #classification
#                  ,"ps=",ps,"&" #time period
#                  ,"r=",r,"&" #reporting area
#                  ,"p=",p,"&" #partner country
#                  ,"rg=",rg,"&" #trade flow
#                  ,"cc=",cc,"&" #classification code
#                  ,"fmt=",fmt,"&"        #Format
#
#                  ,"token=",token #token
#
#                  ,sep = ""
#   )
#
#   if(fmt == "csv") {
#     raw.data<- read.csv(string,header=TRUE)
#     return(list(validation=NULL, data=raw.data))
#   } else {
#     if(fmt == "json" ) {
#       raw.data<- fromJSON(file=string)
#       data<- raw.data$dataset
#       validation<- unlist(raw.data$validation, recursive=TRUE)
#       ndata<- NULL
#       if(length(data)> 0) {
#         var.names<- names(data[[1]])
#         data<- as.data.frame(t( sapply(data,rbind)))
#         ndata<- NULL
#         for(i in 1:ncol(data)){
#           data[sapply(data[,i],is.null),i]<- NA
#           ndata<- cbind(ndata, unlist(data[,i]))
#         }
#         ndata<- as.data.frame(ndata)
#         colnames(ndata)<- var.names
#       }
#       return(list(validation=validation,data =ndata))
#     }
#   }
# }
#
# s1 <- get.Comtrade(r="842", p="124,40", token = 'NULL')
# s1
#
# s1$validation
#





# ── GP comtradeRggregator ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#
# It is good practice to
#
# ✖ write short and simple functions. These functions have high cyclomatic complexity:download_Comtrade (57).
# ✖ not use "Depends" in DESCRIPTION, as it can cause name clashes, and poor interaction with other packages. Use "Imports" instead.
# ✖ avoid long code lines, it is bad for readability. Also, many people prefer editor windows that are about 80 characters wide. Try make your lines
# shorter than 80 characters
#
# R\build_Comtrade.R:66:1
# R\comtradeRggregator.R:14:1
# R\comtradeRggregator.R:24:1
# R\comtradeRggregator.R:25:1
# R\convert_Comtrade.R:10:1
# ... and 534 more lines
#
# ✖ not import packages as a whole, as this can cause name clashes between the imported packages. Instead, import only the specific functions you need.
# ✖ fix this R CMD check NOTE: Note: found 5311 marked UTF-8 strings
# ✖ fix this R CMD check WARNING: LaTeX errors when creating PDF version. This typically indicates Rd problems. LaTeX errors found:
#   ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
# Warning messages:
#   1: In file(con, "r") :
#   cannot open file 'C:/Users/amann/AppData/Local/Temp/RtmpieRpYs/R_LIBS12546e1133f3/comtradeRggregator/R/comtradeRggregator': No such file or directory
# 2: In MYPREPS[[prep]](state, quiet = quiet) :
#   Prep step for test coverage failed.















## Please update to use your own when testing
mytoken <- "lhsmuyUVrMuKuxtet0TbbJdfVUChniTF2DqR8kUxb9PqNxf2aQ+AqE+BwKHKycyg84HWaXUszKnPCKJ8zO5eFqoANzWiPaGX7dX/XEUAO0jImhk6ro/YqiL4hsPn4VLxHK5hSnE8vsHebKzR28GjyA=="
mytempDirectory <- "C:/Users/juerg/Desktop/tmp"
# mytoken <- '...'

# Test 1: Basic country selection and storage of tmp files  -------------------------------
### Works for Austria to World (also WORLD, world)
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "World",
  tradecode = "HS2007",
  ag = "ag6",
  direction = "all",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL,
  sleep = 10
) -> AT_World

### Works for Austria to All countries (also ALL, all)
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "All",
  tradecode = "HS2007",
  ag = "ag6",
  direction = "all",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL,
  sleep = 10
) -> AT_All

### Works for Austria's exports to Germany
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = c("Germany"),
  tradecode = "HS2007",
  ag = "ag6",
  direction = "exports",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
) -> X_AT_DE
### Works for Austria's exports to multiple countries
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = c("Germany", "Australia", "France", "Japan", "Italy", "Spain"),
  tradecode = "HS2007",
  ag = "ag6",
  direction = "exports",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
) -> X_AT_some
X_AT_some %>% distinct(trade_flow)
X_AT_some %>% distinct(partner)

### Fails if country does not exist
try({
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = c("Germany", "Atlantis"),
  tradecode = "HS2007",
  ag = "ag6",
  direction = "exports",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
)
})
### Works for user-specified temporary directories
## Note: you have to create that folder yourself first and link to it with: `mytempDirectory`
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "World",
  tradecode = "HS2007",
  ag = "ag6",
  direction = "all",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = FALSE,
  location.temporaryFiles = mytempDirectory
)
### Doesn't work for countries that don't exist
try({
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Atlantis",
  tradecode = "HS2007",
  ag = "ag6",
  direction = "all",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
)
})

### fails because input arguments are not specified correctly (checks for reasonable values/default arguments
try({
download_Comtrade(
  year = "2218",
  frequency = "annual",
  month = NULL,
  countries = "Atlantis",
  tradecode = "HS2007",
  ag = "ag6",
  direction = "all",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
)
})

# Test 2: country selection cond. on data availability  -------------------------------
### Fails because there is no monthly trade data for Austria:
try({
download_Comtrade(
  year = c("2018", "2019"),
  frequency = "monthly",
  month = c("01", "02"),
  countries = c("Austria", "Australia"),
  partners = "World",
  tradecode = "HS2007",
  ag = "ag6",
  direction = "all",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
)
})
### Works for Australia
download_Comtrade(
  year = c("2018", "2019"),
  frequency = c("monthly"),
  month = c("01", "02"),
  countries = c("Australia"),
  partners = "World",
  tradecode = "HS2007",
  ag = c("ag6"),
  direction = "all",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
)


# Test 3: Trade classification  -------------------------------
## Fails as ag 5 not defined for HS3
try({
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "World",
  tradecode = "HS2007",
  ag = "ag5",
  direction = "all",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
)
})
## Fails as ag 5 not defined for SITCrev3
try({
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "World",
  tradecode = "SITCrev3",
  ag = "ag6",
  direction = "all",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
)
})
## Works
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "World",
  tradecode = "SITCrev3",
  ag = "ag5",
  direction = "all",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
)


# Test 4: Mirror data  -------------------------------
## Fails because partner does not exist
try({
download_Comtrade(
  year = c("2018"),
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = c("Atlantis", "Germany"), # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007",
  ag = c("ag6"),
  direction = "all",
  type = "commodities",
  select.stats = "all",
  rm.temporaryFiles = TRUE,
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = TRUE,
  location.temporaryFiles = NULL
)
})
## Doesn't work for monthly data (no monthly trade data for AUT)
try({
download_Comtrade(
  year = c("2018"),
  frequency = "monthly",
  month = "01",
  countries = "Austria",
  partners = "Germany", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007",
  ag = c("ag6"),
  direction = "all",
  select.stats = "all",
  type = "commodities",
  rm.temporaryFiles = TRUE,
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = TRUE,
  location.temporaryFiles = NULL
)
})



## Test 4.5: Test if mirror data adds up   -------------------------------

## Works for AUT-DEU mirror trade
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "Germany", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007",
  ag = "ag6",
  select.stats = "trade_value_usd",
  direction = "all",
  type = "commodities",
  rm.temporaryFiles = TRUE,
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = TRUE,
  location.temporaryFiles = NULL
) -> mirr_AT_DE
## Works for AUT-DEU mirror trade
download_Comtrade(
  year = c("2018"),
  frequency = "annual",
  month = NULL,
  countries = "Germany",
  partners = "Austria", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007",
  ag = c("ag6"),
  select.stats = "trade_value_usd",
  direction = "all",
  type = "commodities",
  rm.temporaryFiles = TRUE,
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = TRUE,
  location.temporaryFiles = NULL
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
  year = c("2018"),
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "Germany", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007",
  ag = c("ag6"),
  select.stats = "trade_value_usd",
  direction = "exports",
  type = "commodities",
  rm.temporaryFiles = TRUE,
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  location.temporaryFiles = NULL
) -> X_AT_DE

download_Comtrade(
  year = c("2018"),
  frequency = "annual",
  month = NULL,
  countries = "Germany",
  partners = "Austria", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007",
  ag = c("ag6"),
  select.stats = "trade_value_usd",
  direction = "imports",
  type = "commodities",
  rm.temporaryFiles = TRUE,
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  location.temporaryFiles = NULL
) -> IM_DE_AT
X_AT_DE %>%
  summarise(sum(trade_value_usd)) %>%
  pull() / IM_DE_AT %>%
    summarise(sum(trade_value_usd)) %>%
    pull()
# around 1.073449

download_Comtrade(
  year = c("2018"),
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "Germany", # either 'world' (all countries) or specific country name(s)
  tradecode = "HS2007",
  ag = c("ag6"),
  select.stats = "trade_value_usd",
  direction = "exports",
  type = "commodities",
  rm.temporaryFiles = TRUE,
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = TRUE,
  location.temporaryFiles = NULL
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
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  partners = "World",
  tradecode = "HS2007",
  ag = "ag6",
  direction = "all",
  type = "commodities",
  select.stats = "all",
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = TRUE,
  rm.temporaryFiles = TRUE,
  location.temporaryFiles = NULL
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

try({
  is.available_Comtrade(is.contained = c("Germany"), frequency = "monthly", month = c("01", "02"))
})


# Test 6: Only select particular trade   -------------------------------
### Works
download_Comtrade(
  year = "2018",
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  tradecode = "HS2012",
  ag = "ag6",
  direction = "exports",
  type = "commodities",
  select.stats = c("trade_value_usd", "qty"), # only select trade_value_usd and quantity
  rm.temporaryFiles = TRUE,
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  location.temporaryFiles = NULL
)
### Fails because of incorrect  stats names
try({
download_Comtrade(
  year = c("2018"),
  frequency = "annual",
  month = NULL,
  countries = "Austria",
  tradecode = "HS2007",
  ag = c("ag6"),
  direction = "all",
  type = "commodities",
  select.stats = c("lala", "qty"), # only select trade_value_usd and quantity
  rm.temporaryFiles = TRUE,
  token = mytoken,
  ext_cnt = 5,
  is.mirrorData = FALSE,
  location.temporaryFiles = NULL
)
})

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
      classification.from = "HS",
      commodity.code = "commodity_code",
      classification.to = c
    ) -> out
  message("\n-------------------\n HS combined to ", c, "\n-------------------\n")
  print(out)
}

# test for long names
codes <- c("BEC", "CCCN", "CPC", "GTAP", "H0", "H1", "HS2002", "HS2007", "HS2012", "ISICrev2", "ISICrev3", "SIC", "MTN", "SITCrev1", "SITCrev2", "SITCrev3", "SITCrev4")
for (c in codes) {
  AU_World_HS %>%
    convert_Comtrade(
      classification.from = "HS",
      commodity.code = "commodity_code",
      classification.to = c
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
      classification.from = "classification",
      commodity.code = "commodity_code",
      classification.to = c
    ) -> out
  message("\n-------------------\n HS0 to ", c, "\n-------------------\n")
  print(out)
}
AT_World_H0 %>%
  convert_Comtrade(
    classification.from = "H3",
    commodity.code = "commodity_code",
    classification.to = "I3"
  )

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
      classification.from = "classification",
      commodity.code = "commodity_code",
      classification.to = c
    ) -> out
  message("\n-------------------\n HS1 to ", c, "\n-------------------\n")
  print(out)
}
AT_World_H1 %>%
  convert_Comtrade(
    classification.from = "H1",
    commodity.code = "commodity_code",
    classification.to = "I3"
  )

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
      classification.from = "classification",
      commodity.code = "commodity_code",
      classification.to = c
    ) -> out
  message("\n-------------------\n HS2 to ", c, "\n-------------------\n")
  print(out)
}
AT_World_H2 %>%
  convert_Comtrade(
    classification.from = "H2",
    commodity.code = "commodity_code",
    classification.to = "I3"
  )
# Fails because no conversion available.
AT_World_H2 %>%
  convert_Comtrade(
    classification.from = "H2",
    commodity.code = "commodity_code",
    classification.to = "MTN"
  )

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
      classification.from = "classification",
      commodity.code = "commodity_code",
      classification.to = c
    ) -> out
  message("\n-------------------\n HS3 to ", c, "\n-------------------\n")
  print(out)
}
## Fails because conversion only at 6-digit level for HS
AT_World_H3 %>%
  convert_Comtrade(
    classification.from = "H3",
    commodity.code = "commodity_code",
    classification.to = "I3"
  )

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

codes <- c('BE', 'BE5', 'GTAP', 'CPC', "H0", "H1", "H2", "H3", 'I31','I4', "S1", "S2", "S3", "S4")
for (c in codes) {
  DE_World_H4 %>%
    convert_Comtrade(
      classification.from = "H4",
      commodity.code = "commodity_code",
      classification.to = c
    ) -> out
  message("\n-------------------\n HS4 to ", c, "\n-------------------\n")
  print(out)
}


AT_World_H3 %>%
  convert_Comtrade(
    classification.from = "H3",
    commodity.code = "commodity_code",
    classification.to = "I3"
  )
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
      classification.to = c
    ) -> out
  message("\n-------------------\n HS5 to ", c, "\n-------------------\n")
  print(out)
}

# Test 7.s1: Check all concordance tables for S1 -------------------------------
download_Comtrade(
  year = "2017",
  frequency = "annual",
  countries = "Germany",
  partners = "World",
  tradecode = "SITCrev1",
  ag = "AG5",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> DE_World_S1

codes <- c("BE")
for (c in codes) {
  DE_World_S1 %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      classification.to = c
    ) -> out
  message("\n-------------------\n SITC Rev.1 to ", c, "\n-------------------\n")
  print(out)
}

# Test 7.s2: Check all concordance tables for S2 -------------------------------
download_Comtrade(
  year = "2017",
  frequency = "annual",
  countries = "Germany",
  partners = "World",
  tradecode = "SITCrev2",
  ag = "AG5",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> DE_World_S2

codes <- c("BE", "I2", "S1")
for (c in codes) {
  DE_World_S2 %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      classification.to = c
    ) -> out
  message("\n-------------------\n SITC Rev.2 to ", c, "\n-------------------\n")
  print(out)
}

# Test 7.s3: Check all concordance tables for S3 -------------------------------
download_Comtrade(
  year = "2017",
  frequency = "annual",
  countries = "Germany",
  partners = "World",
  tradecode = "SITCrev3",
  ag = "AG5",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all",
  sleep = 5
) -> DE_World_S3

codes <- c("S1", "S2")
for (c in codes) {
  DE_World_S3 %>%
    convert_Comtrade(
      classification = "classification",
      commodity.code = "commodity_code",
      classification.to = c
    ) -> out
  message("\n-------------------\n SITC Rev.3 to ", c, "\n-------------------\n")
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
