#' Comtrade Data Availability
#'
#' Data availability varies by country and classification, and new trade data
#' is released/revised very frequently on [Comtrade](https://comtrade.un.org/).
#' `comtradeRggregator` uses trade information corresponding to
#' [official Comtrade data availability](https://comtrade.un.org/data/da) which it
#' updates once a day and stores locally on your machine:
#'
#'   `<your local package location>/data/Comtrade_DataAvailability-<date stamp>.csv.gz`
#'
#'   The locally stored Comtrade Data Availability file is used in every `download_Comtrade()`
#'   data query. In other words, if new data becomes available and is documented in
#'   the [official Comtrade data availability file](https://comtrade.un.org/data/da),
#'   `comtradeRggregator` will use this information no later than 24 hours after its publication.
#'   The Comtrade Data Availability file can be accessed locally (file name `Comtrade_DA`).
#'
#' @format A data frame with 65k rows and 10 variables:
#' \describe{
#'   \item{type}{Type of trade data to be extracted (either `services` or `commodities`).}
#'   \item{freq}{Frequency of data extract; either `annual` or `monthly`.}
#'   \item{px}{Abbreviation of target trade classification.}
#'   \item{r}{Country code.}
#'   \item{rDesc}{Country name description.}
#'   \item{ps}{Year.}
#'   \item{TotalRecords}{Number of records.}
#'   \item{isOriginal}{Is original data.}
#'   \item{publicationDate}{Publication date.}
#'   \item{isPartnerDetail}{Partner detail.}
#' }
#' @source \url{https://comtrade.un.org/data/da}
"Comtrade_DA"


#' HS to BEC Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `BEC`
#'
#' @format A data frame with 5,701 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{BEC Product Code}{...}
#'   \item{BEC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_BE"

#' HS to CCCN Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `CCCN`
#'
#' @format A data frame with 5,703 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{CCCN Product Code}{...}
#'   \item{CCCN Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_CC"

#' HS to CPC Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `CPC`
#'
#' @format A data frame with 5,703 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{CPC Product Code}{...}
#'   \item{CPC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_CP"

#' HS to GTAP Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `GTAP`
#'
#' @format A data frame with 5,638 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{GTAP Product Code}{...}
#'   \item{GTAP Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_GP"


#' HS to H0 Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `HS 1988/92` (`H0`)
#'
#' @format A data frame with 5,020 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_H0"


#' HS to H1 Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `HS 1996` (`H1`)
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_H1"


#' HS to H2 Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `HS 2002` (`H2`)
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_H2"

#' HS to H3 Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `HS 2007` (`H3`)
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_H3"

#' HS to H4 Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `HS 2012` (`H4`)
#'
#' @format A data frame with 5,205 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_H4"


#' HS to ISIC Rev. 2 Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `ISIC Rev. 2`
#'
#' @format A data frame with 5,703 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{ISIC Revision 2 Product Code}{...}
#'   \item{ISIC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_I2"


#' HS to ISIC Rev. 3 Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `ISIC Rev. 3`
#'
#' @format A data frame with 5,703 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{ISIC Revision 3 Product Code}{...}
#'   \item{ISIC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_I3"


#' HS to SIC Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `SIC`
#'
#' @format A data frame with 5,698 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{SIC Product Code}{...}
#'   \item{SIC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_IU"


#' HS to MTN Categories Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `MTN Categories`
#'
#' @format A data frame with 5,704 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{MTN Categories Product Code}{...}
#'   \item{MTN Categories Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_MT"


#' HS to SITC Rev. 1 Categories Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `SITC Rev. 1`
#'
#' @format A data frame with 5,698 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{SITC Revision 1 Product Code}{...}
#'   \item{SITC Revision 1 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_S1"


#' HS to SITC Rev. 2 Categories Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `SITC Rev. 2`
#'
#' @format A data frame with 5,693 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{SITC Revision 2 Product Code}{...}
#'   \item{SITC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_S2"


#' HS to SITC Rev. 3 Categories Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `SITC Rev. 3`
#'
#' @format A data frame with 5,705 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{SITC Revision 3 Product Code}{...}
#'   \item{SITC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_S3"


#' HS to SITC Rev. 4 Categories Concordance Table
#'
#' Concordance table between `HS Combined` (`HS`) and `SITC Rev. 4`
#'
#' @format A data frame with 5,956 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{...}
#'   \item{HS Combined Product Description}{...}
#'   \item{SITC Revision 4 Product Code}{...}
#'   \item{SITC Revision 4 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"HS_S4"





































#' H0 to BEC Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `BEC`
#'
#' @format A data frame with 5,016 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{BEC Product Code}{...}
#'   \item{BEC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_BE"


#' H0 to CCCN Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `CCCN`
#'
#' @format A data frame with 5,017 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{CCCN Product Code}{...}
#'   \item{CCCN Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_CC"


#' H0 to CPC Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `CPC`
#'
#' @format A data frame with 5,018 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{CPC Product Code}{...}
#'   \item{CPC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_CP"


#' H0 to GTAP Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `GTAP`
#'
#' @format A data frame with 4,933 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{GTAP Product Code}{...}
#'   \item{GTAP Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_GP"


#' H0 to ISIC Rev. 2 Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `ISIC Rev. 2`
#'
#' @format A data frame with 5,018 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{ISIC Revision 2 Product Code}{...}
#'   \item{ISIC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_I2"


#' H0 to ISIC Rev. 3 Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `ISIC Rev. 3`
#'
#' @format A data frame with 5,018 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{ISIC Revision 3 Product Code}{...}
#'   \item{ISIC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_I3"


#' H0 to SIC Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `SIC`
#'
#' @format A data frame with 5,013 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{SIC Product Code}{...}
#'   \item{SIC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_IU"


#' H0 to MTN Categories Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `MTN Categories`
#'
#' @format A data frame with 5,020 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{MTN Categories Product Code}{...}
#'   \item{MTN Categories Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_MT"


#' H0 to SITC Rev. 1 Categories Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `SITC Rev. 1`
#'
#' @format A data frame with 5,012 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{SITC Revision 1 Product Code}{...}
#'   \item{SITC Revision 1 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_S1"


#' H0 to SITC Rev. 2 Categories Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `SITC Rev. 2`
#'
#' @format A data frame with 5,017 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{SITC Revision 2 Product Code}{...}
#'   \item{SITC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_S2"


#' H0 to SITC Rev. 3 Categories Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `SITC Rev. 3`
#'
#' @format A data frame with 5,017 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{SITC Revision 3 Product Code}{...}
#'   \item{SITC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_S3"


#' H0 to SITC Rev. 4 Categories Concordance Table
#'
#' Concordance table between `HS 1988/92` (`H0`) and `SITC Rev. 4`
#'
#' @format A data frame with 5,018 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#'   \item{SITC Revision 4 Product Code}{...}
#'   \item{SITC Revision 4 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H0_S4"




#' H2 to BEC Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `BEC`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{BEC Product Code}{...}
#'   \item{BEC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_BE"


#' H2 to CCCN Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `CCCN`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{CCCN Product Code}{...}
#'   \item{CCCN Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_CC"


#' H2 to CPC Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `CPC`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{CPC Product Code}{...}
#'   \item{CPC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_CP"


#' H2 to GTAP Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `GTAP`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{GTAP Product Code}{...}
#'   \item{GTAP Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_GP"

#' H2 to H0 Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `HS 1988/92` (`H0`)
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_H0"

#' H2 to H1 Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `HS 1996` (`H1`)
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_H1"

#' H2 to ISIC Rev. 2 Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `ISIC Rev. 2`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{ISIC Revision 2 Product Code}{...}
#'   \item{ISIC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_I2"


#' H2 to ISIC Rev. 3 Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `ISIC Rev. 3`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{ISIC Revision 3 Product Code}{...}
#'   \item{ISIC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_I3"


#' H2 to SIC Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SIC`
#'
#' @format A data frame with 5,108 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SIC Product Code}{...}
#'   \item{SIC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_IU"


#' H2 to MTN Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `MTN Categories`
#'
#' @format A data frame with 3,771 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{MTN Categories Product Code}{...}
#'   \item{MTN Categories Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_MT"


#' H2 to SITC Rev. 1 Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SITC Rev. 1`
#'
#' @format A data frame with 5,106 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SITC Revision 1 Product Code}{...}
#'   \item{SITC Revision 1 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_S1"


#' H2 to SITC Rev. 2 Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SITC Rev. 2`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SITC Revision 2 Product Code}{...}
#'   \item{SITC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_S2"


#' H2 to SITC Rev. 3 Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SITC Rev. 3`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SITC Revision 3 Product Code}{...}
#'   \item{SITC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_S3"


#' H2 to SITC Rev. 4 Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SITC Rev. 4`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SITC Revision 4 Product Code}{...}
#'   \item{SITC Revision 4 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_S4"



#' H1 to BEC Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `BEC`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{BEC Product Code}{...}
#'   \item{BEC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_BE"


#' H1 to CCCN Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `CCCN`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{CCCN Product Code}{...}
#'   \item{CCCN Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_CC"


#' H1 to CPC Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `CPC`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{CPC Product Code}{...}
#'   \item{CPC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_CP"


#' H1 to GTAP Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `GTAP`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{GTAP Product Code}{...}
#'   \item{GTAP Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_GP"

#' H1 to H0 Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `HS 1988/92` (`H0`)
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_H0"


#' H1 to ISIC Rev. 2 Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `ISIC Rev. 2`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{ISIC Revision 2 Product Code}{...}
#'   \item{ISIC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_I2"


#' H1 to ISIC Rev. 3 Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `ISIC Rev. 3`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{ISIC Revision 3 Product Code}{...}
#'   \item{ISIC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_I3"


#' H1 to SIC Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `SIC`
#'
#' @format A data frame with 5,108 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{SIC Product Code}{...}
#'   \item{SIC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_IU"


#' H1 to MTN Categories Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `MTN Categories`
#'
#' @format A data frame with 3,771 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{MTN Categories Product Code}{...}
#'   \item{MTN Categories Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_MT"


#' H1 to SITC Rev. 1 Categories Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `SITC Rev. 1`
#'
#' @format A data frame with 5,106 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{SITC Revision 1 Product Code}{...}
#'   \item{SITC Revision 1 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_S1"


#' H1 to SITC Rev. 2 Categories Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `SITC Rev. 2`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{SITC Revision 2 Product Code}{...}
#'   \item{SITC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_S2"


#' H1 to SITC Rev. 3 Categories Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `SITC Rev. 3`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{SITC Revision 3 Product Code}{...}
#'   \item{SITC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_S3"


#' H1 to SITC Rev. 4 Categories Concordance Table
#'
#' Concordance table between `HS 1996` (`H1`) and `SITC Rev. 4`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#'   \item{SITC Revision 4 Product Code}{...}
#'   \item{SITC Revision 4 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H1_S4"







#' H2 to BEC Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `BEC`
#'
#' @format A data frame with 5,222 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{BEC Product Code}{...}
#'   \item{BEC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_BE"


#' H2 to CCCN Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `CCCN`
#'
#' @format A data frame with 5,222 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{CCCN Product Code}{...}
#'   \item{CCCN Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_CC"


#' H2 to CPC Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `CPC`
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{CPC Product Code}{...}
#'   \item{CPC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_CP"


#' H2 to GTAP Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `GTAP`
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{GTAP Product Code}{...}
#'   \item{GTAP Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_GP"

#' H2 to H0 Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `HS 1988/92` (`H0`)
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_H0"

#' H2 to H1 Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `HS 1996` (`H1`)
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_H1"

#' H2 to ISIC Rev. 2 Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `ISIC Rev. 2`
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{ISIC Revision 2 Product Code}{...}
#'   \item{ISIC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_I2"


#' H2 to ISIC Rev. 3 Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `ISIC Rev. 3`
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{ISIC Revision 3 Product Code}{...}
#'   \item{ISIC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_I3"


#' H2 to SIC Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SIC`
#'
#' @format A data frame with 5,219 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SIC Product Code}{...}
#'   \item{SIC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_IU"


#' H2 to MTN Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `MTN Categories`
#'
#' @format A data frame with 5,223 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{MTN Categories Product Code}{...}
#'   \item{MTN Categories Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_MT"


#' H2 to SITC Rev. 1 Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SITC Rev. 1`
#'
#' @format A data frame with 5,217 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SITC Revision 1 Product Code}{...}
#'   \item{SITC Revision 1 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_S1"


#' H2 to SITC Rev. 2 Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SITC Rev. 2`
#'
#' @format A data frame with 5,222 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SITC Revision 2 Product Code}{...}
#'   \item{SITC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_S2"


#' H2 to SITC Rev. 3 Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SITC Rev. 3`
#'
#' @format A data frame with 5,222 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SITC Revision 3 Product Code}{...}
#'   \item{SITC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_S3"


#' H2 to SITC Rev. 4 Categories Concordance Table
#'
#' Concordance table between `HS 2002` (`H2`) and `SITC Rev. 4`
#'
#' @format A data frame with 5,220 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#'   \item{SITC Revision 4 Product Code}{...}
#'   \item{SITC Revision 4 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H2_S4"



































#' H3 to BEC Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `BEC`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{BEC Product Code}{...}
#'   \item{BEC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_BE"

#' H3 to CCCN Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `CCCN`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{CCCN Product Code}{...}
#'   \item{CCCN Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_CC"

#' H3 to CPC Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `CPC`
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{CPC Product Code}{...}
#'   \item{CPC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_CP"

#' H3 to GTAP Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `GTAP`
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{GTAP Product Code}{...}
#'   \item{GTAP Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_GP"


#' H3 to H0 Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `HS 1988/92` (`H0`)
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_H0"


#' H3 to H1 Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `HS 1996` (`H1`)
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_H1"


#' H3 to H2 Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `HS 2002` (`H2`)
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_H2"


#' H3 to ISIC Rev. 2 Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `ISIC Rev. 2`
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{ISIC Revision 2 Product Code}{...}
#'   \item{ISIC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_I2"


#' H3 to ISIC Rev. 3 Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `ISIC Rev. 3`
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{ISIC Revision 3 Product Code}{...}
#'   \item{ISIC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_I3"


#' H3 to SIC Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `SIC`
#'
#' @format A data frame with 5,047 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{SIC Product Code}{...}
#'   \item{SIC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_IU"


#' H3 to MTN Categories Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `MTN Categories`
#'
#' @format A data frame with 5,051 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{MTN Categories Product Code}{...}
#'   \item{MTN Categories Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_MT"


#' H3 to SITC Rev. 1 Categories Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `SITC Rev. 1`
#'
#' @format A data frame with 5,045 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{SITC Revision 1 Product Code}{...}
#'   \item{SITC Revision 1 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_S1"


#' H3 to SITC Rev. 2 Categories Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `SITC Rev. 2`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{SITC Revision 2 Product Code}{...}
#'   \item{SITC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_S2"


#' H3 to SITC Rev. 3 Categories Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `SITC Rev. 3`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{SITC Revision 3 Product Code}{...}
#'   \item{SITC Revision 3 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_S3"


#' H3 to SITC Rev. 4 Categories Concordance Table
#'
#' Concordance table between `HS 2007` (`H3`) and `SITC Rev. 4`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#'   \item{SITC Revision 4 Product Code}{...}
#'   \item{SITC Revision 4 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"H3_S4"


#' H4 to H0 Categories Concordance Table
#'
#' Concordance table between `HS 2012` (`H4`) and `BEC Rev. 4` (`BEC`).
#'
#' @format A data frame with 5,283 rows and 2 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{...}
#'   \item{BEC 4 Product Code}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/classifications/Econ#Correspondences}
"H4_BE"


#' H4 to H0 Categories Concordance Table
#'
#' Concordance table between `HS 2012` (`H4`) and `HS 1988/92` (`H0`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 6,739 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H4_H0"


#' H4 to H1 Categories Concordance Table
#'
#' Concordance table between `HS 2012` (`H4`) and `HS 1996` (`H1`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 6,420 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H4_H1"


#' H4 to H2 Categories Concordance Table
#'
#' Concordance table between `HS 2012` (`H4`) and `HS 2002` (`H2`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 6,025 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H4_H2"


#' H4 to H3 Categories Concordance Table
#'
#' Concordance table between `HS 2012` (`H4`) and `HS 2007` (`H3`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 5,205 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H4_H3"


#' H4 to S1 Categories Concordance Table
#'
#' Concordance table between `HS 2012` (`H4`) and `SITC Rev.1` (`S1`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 10,220 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#'   \item{SITC Revision 1 Product Code}{...}
#'   \item{SITC Revision 1 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H4_S1"

#' H4 to S2 Categories Concordance Table
#'
#' Concordance table between `HS 2012` (`H4`) and `SITC Rev.2` (`S2`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 11,588 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#'   \item{SITC Revision 2 Product Description}{...}
#'   \item{SITC Revision 2 Product Code}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H4_S2"

#' H4 to S3 Categories Concordance Table
#'
#' Concordance table between `HS 2012` (`H4`) and `SITC Rev.3` (`S3`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 6,605 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#'   \item{SITC Revision 3 Product Description}{...}
#'   \item{SITC Revision 3 Product Code}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H4_S3"


#' H4 to S4 Categories Concordance Table
#'
#' Concordance table between `HS 2012` (`H4`) and `SITC Rev.4` (`S4`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 5,299 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#'   \item{SITC Revision 4 Product Description}{...}
#'   \item{SITC Revision 4 Product Code}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H4_S4"

#' H5 to H0 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `BEC Rev. 4` (`BEC`).
#'
#' @format A data frame with 5,386 rows and 2 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{BEC 4 Product Code}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/classifications/Econ#Correspondences}
"H5_BE"


#' H5 to H0 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `HS 1988/92` (`H0`).
#'
#' @format A data frame with 5,388 rows and 4 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{HS 1988/92 Product Code}{...}
#'   \item{HS 1988/92 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H5_H0"


#' H5 to H1 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `HS 1996` (`H1`).
#'
#' @format A data frame with 5,388 rows and 4 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{HS 1996 Product Code}{...}
#'   \item{HS 1996 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H5_H1"


#' H5 to H2 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `HS 2002` (`H2`).
#'
#' @format A data frame with 5,388  rows and 4 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{HS 2002 Product Code}{...}
#'   \item{HS 2002 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H5_H2"


#' H5 to H3 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `HS 2007` (`H3`).
#'
#' @format A data frame with 5,388 rows and 4 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{HS 2007 Product Code}{...}
#'   \item{HS 2007 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H5_H3"

#' H5 to H4 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `HS 2012` (`H4`).
#'
#' @format A data frame with 5,388 rows and 4 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{HS 2012 Product Code}{...}
#'   \item{HS 2012 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H5_H4"


#' H5 to S1 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `SITC Rev.1` (`S1`).
#'
#' @format A data frame with 5,380 rows and 4 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{SITC Revision 1 Product Code}{...}
#'   \item{SITC Revision 1 Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H5_S1"

#' H5 to S2 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `SITC Rev.2` (`S2`).
#' @format A data frame with 5,386 rows and 4 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{SITC Revision 2 Product Description}{...}
#'   \item{SITC Revision 2 Product Code}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H5_S2"

#' H5 to S3 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `SITC Rev.3` (`S3`).
#'
#' @format A data frame with 5,386 rows and 4 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{SITC Revision 3 Product Description}{...}
#'   \item{SITC Revision 3 Product Code}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H5_S3"


#' H5 to S4 Categories Concordance Table
#'
#' Concordance table between `HS 2017` (`H5`) and `SITC Rev.4` (`S4`).
#'
#' @format A data frame with 5,386 rows and 4 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{...}
#'   \item{SITC Revision 4 Product Description}{...}
#'   \item{SITC Revision 4 Product Code}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"H5_S4"


#' S1 to BE Categories Concordance Table
#'
#' Concordance table between `SITC Rev.1` (`S1`) and `BEC`.
#'
#' @format A data frame with 1,312 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 1 Combined Product Code}{...}
#'   \item{SITC Revision 1 Combined Product Description}{...}
#'   \item{BEC Product Code}{...}
#'   \item{BEC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"S1_BE"


#' S2 to BE Categories Concordance Table
#'
#' Concordance table between `SITC Rev.2` (`S2`) and `BEC`.
#'
#' @format A data frame with 1,312 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 2 Combined Product Code}{...}
#'   \item{SITC Revision 2 Combined Product Description}{...}
#'   \item{BEC Product Code}{...}
#'   \item{BEC Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"S2_BE"

#' S2 to I2 Categories Concordance Table
#'
#' Concordance table between `SITC Rev.2` (`S2`) and `ISIC Rev. 2` (`I2`).
#'
#' @format A data frame with 1,312 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 2 Combined Product Code}{...}
#'   \item{SITC Revision 2 Combined Product Description}{...}
#'   \item{ISIC Revision 2 Product Code}{...}
#'   \item{ISIC Revision 2 Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"S2_I2"


#' S2 to S1 Categories Concordance Table
#'
#' Concordance table between `SITC Rev.2` (`S2`) and  `SITC Rev.1` (`S1`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#'
#' @format A data frame with 2,016 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 2 Combined Product Code}{...}
#'   \item{SITC Revision 2 Combined Product Description}{...}
#'   \item{SITC Revision 1 Combined Product Code}{...}
#'   \item{SITC Revision 1 Combined Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"S2_S1"


#' S3 to S1 Categories Concordance Table
#'
#' Concordance table between `SITC Rev.3` (`S3`) and  `SITC Rev.1` (`S1`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#'
#' @format A data frame with 2,016 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 3 Combined Product Code}{...}
#'   \item{SITC Revision 3 Combined Product Description}{...}
#'   \item{SITC Revision 1 Combined Product Code}{...}
#'   \item{SITC Revision 1 Combined Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"S3_S1"

#' S3 to S1 Categories Concordance Table
#'
#' Concordance table between `SITC Rev.3` (`S3`) and  `SITC Rev.2` (`S2`). Product descriptions taken
#' from WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#'
#' @format A data frame with 3,121 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 3 Combined Product Code}{...}
#'   \item{SITC Revision 3 Combined Product Description}{...}
#'   \item{SITC Revision 2 Combined Product Code}{...}
#'   \item{SITC Revision 2 Combined Product Description}{...}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
"S3_S2"


#' I2 to I3 Categories Concordance Table
#'
#' Concordance table between `ISIC Rev.2` (`I2`) and  `ISIC Rev.3` (`I3`).
#'
#'
#' @format A data frame with 586  rows and 4 variables:
#' \describe{
#'   \item{ISIC Revision 2 Combined Product Code}{...}
#'   \item{ISIC Revision 3 Combined Product Code}{...}
#'   \item{ISIC Revision 3 Combined Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"I2_I3"

#' I2 to I31 Categories Concordance Table
#'
#' Concordance table between `ISIC Rev.2` (`I2`) and  `ISIC Rev.3.1` (`I3.1`).
#'
#'
#' @format A data frame with 562   rows and 4 variables:
#' \describe{
#'   \item{ISIC Revision 2 Combined Product Code}{...}
#'   \item{ISIC Revision 3.1 Combined Product Code}{...}
#'   \item{ISIC Revision 3.1 Combined Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"I2_I31"

#' I3 to I2 Categories Concordance Table
#'
#' Concordance table between `ISIC Rev.3` (`I3`) and  `ISIC Rev.2` (`I2`).
#'
#'
#' @format A data frame with 586  rows and 4 variables:
#' \describe{
#'   \item{ISIC Revision 3 Combined Product Code}{...}
#'   \item{ISIC Revision 2 Combined Product Code}{...}
#'   \item{ISIC Revision 2 Combined Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"I3_I2"

#' I3 to I31 Categories Concordance Table
#'
#' Concordance table between `ISIC Rev.3` (`I3`) and  `ISIC Rev.3.1` (`I3.1`).
#'
#'
#' @format A data frame with 562   rows and 4 variables:
#' \describe{
#'   \item{ISIC Revision 3 Combined Product Code}{...}
#'   \item{ISIC Revision 3.1 Combined Product Code}{...}
#'   \item{ISIC Revision 3.1 Combined Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"I3_I31"

#' I3 to 42 Categories Concordance Table
#'
#' Concordance table between `ISIC Rev.3.1` (`I3.1`) and  `ISIC Rev.4` (`I4`).
#'
#'
#' @format A data frame with 586  rows and 4 variables:
#' \describe{
#'   \item{ISIC Revision 3 Combined Product Code}{...}
#'   \item{ISIC Revision 4 Combined Product Code}{...}
#'   \item{ISIC Revision 4 Combined Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"I31_I4"

#' I31 to Categories Concordance Table
#'
#' Concordance table between  `ISIC Rev.3.1` (`I3.1`) and `ISIC Rev.3` (`I3`).
#'
#'
#' @format A data frame with 562   rows and 4 variables:
#' \describe{
#'   \item{ISIC Revision 3.2 Combined Product Code}{...}
#'   \item{ISIC Revision 3 Combined Product Code}{...}
#'   \item{ISIC Revision 3 Combined Product Description}{...}
#' }
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
"I3_I31"
