#' @title Check and return availability of comtrade
#'
#' @description Checks data availability of Comtrade data.
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
#' @examples
#' \dontrun{
#' update_ComtradeDA()
#' }
#' @source \url{https://comtrade.un.org/data/da}
#' @usage data(Comtrade_DA)
"Comtrade_DA"


#' @title Concordance Table: HS to BEC
#'
#' @description Concordance table from `HS Combined` (`HS`) to `BEC`
#'
#' @format A data frame with 5,701 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{BEC Product Code}{Broad Economic Category `BEC` Product code.}
#'   \item{BEC Product Description}{Broad Economic Category `BEC` Description code.}
#' }
#' @examples
#' HS_BE
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_BE"


#' @title Concordance Table: HS to CCCN
#'
#' @description Concordance table from `HS Combined` (`HS`) to `CCCN` (`CN`)
#'
#' @format A data frame with 5,205 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{CCCN Product Code}{Customs Co-operation Council Nomenclature `CCCN` Product code.}
#'   \item{CCCN Product Description}{Customs Co-operation Council Nomenclature `CCCN` Product description.}
#' }
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_CC"


#' @title Concordance Table: HS to CPC
#'
#' @description Concordance table from `HS Combined` (`HS`) to `CPC`
#'
#' @format A data frame with 5,703 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{CPC Product Code}{Central Product Classification `CPC` Product code.}
#'   \item{CPC Product Description}{Central Product Classification `CPC` Product description.}
#' }
#' @examples
#' HS_CP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_CP"


#' @title Concordance Table: HS to GTAP
#'
#' @description Concordance table from `HS Combined` (`HS`) to `GTAP`
#'
#' @format A data frame with 5,638 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{GTAP Product Code}{Global Trade Analysis Project `GTAP` Product code.}
#'   \item{GTAP Product Description}{Global Trade Analysis Project `GTAP` Product description.}
#' }
#' @examples
#' HS_GP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_GP"


#' @title Concordance Table: HS to H0
#'
#' @description Concordance table from `HS Combined` (`HS`) to `HS 1988/92` (`H0`)
#'
#' @format A data frame with 5,020 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#' }
#' @examples
#' HS_H0
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_H0"


#' @title Concordance Table: HS to H1
#'
#' @description Concordance table from `HS Combined` (`HS`) to `HS 1996` (`H1`)
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#' }
#' @examples
#' HS_H1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_H1"


#' @title Concordance Table: HS to H2
#'
#' @description Concordance table from `HS Combined` (`HS`) to `HS 2002` (`H2`)
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#' }
#' @examples
#' HS_H2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_H2"


#' @title Concordance Table: HS to H3
#'
#' @description Concordance table from `HS Combined` (`HS`) to `HS 2007` (`H3`)
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#' }
#' @examples
#' HS_H3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_H3"


#' @title Concordance Table: HS to H4
#'
#' @description Concordance table from `HS Combined` (`HS`) to `HS 2012` (`H4`)
#'
#' @format A data frame with 5,205 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#' }
#' @examples
#' HS_H4
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_H4"


#' @title Concordance Table: HS to ISIC Rev. 2
#'
#' @description Concordance table from `HS Combined` (`HS`) to `ISIC Rev. 2`
#'
#' @format A data frame with 5,703 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{ISIC Revision 2 Product Code}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#'   \item{ISIC Revision 2 Product Description}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#' }
#' @examples
#' HS_I2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_I2"


#' @title Concordance Table: HS to ISIC Rev. 3
#'
#' @description Concordance table from `HS Combined` (`HS`) to `ISIC Rev. 3`
#'
#' @format A data frame with 5,703 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{ISIC Revision 3 Product Code}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#'   \item{ISIC Revision 3 Product Description}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#' }
#' @examples
#' HS_I3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_I3"


#' @title Concordance Table: HS to SIC
#'
#' @description Concordance table from `HS Combined` (`HS`) to `SIC`
#'
#' @format A data frame with 5,698 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{SIC Product Code}{Standard Industrial Classification `SIC` Product code.}
#'   \item{SIC Product Description}{Standard Industrial Classification `SIC` Product description.}
#' }
#' @examples
#' HS_IU
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_IU"


#' @title Concordance Table: HS to MTN
#'
#' @description Concordance table from `HS Combined` (`HS`) to `MTN Categories`
#'
#' @format A data frame with 5,704 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{MTN Categories Product Code}{Multilateral Trade Negotiations `MTN` Product code.}
#'   \item{MTN Categories Product Description}{Multilateral Trade Negotiations `MTN` Product description.}
#' }
#' @examples
#' HS_MT
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_MT"


#' @title Concordance Table: HS to SITC Rev. 1
#'
#' @description Concordance table from `HS Combined` (`HS`) to `SITC Rev. 1`
#'
#' @format A data frame with 5,698 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC` Revision 1 Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC` Revision 1 Product description.}
#' }
#' @examples
#' HS_S1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_S1"


#' @title Concordance Table: HS to SITC Rev. 2
#'
#' @description Concordance table from `HS Combined` (`HS`) to `SITC Rev. 2`
#'
#' @format A data frame with 5,693 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC` Revision 2 Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC` Revision 2 Product description.}
#' }
#' @examples
#' HS_S2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_S2"


#' @title Concordance Table: HS to SITC Rev. 3
#'
#' @description Concordance table from `HS Combined` (`HS`) to `SITC Rev. 3`
#'
#' @format A data frame with 5,705 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{SITC Revision 3 Product Code}{Standard International Trade Classification `SITC` Revision 3 Product code.}
#'   \item{SITC Revision 3 Product Description}{Standard International Trade Classification `SITC` Revision 3 Product description.}
#' }
#' @examples
#' HS_S3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_S3"


#' @title Concordance Table: HS to SITC Rev. 4
#'
#' @description Concordance table from `HS Combined` (`HS`) to `SITC Rev. 4`
#'
#' @format A data frame with 5,956 rows and 4 variables:
#' \describe{
#'   \item{HS Combined Product Code}{Harmonised System Combined Product code.}
#'   \item{HS Combined Product Description}{Harmonised System Combined Product description.}
#'   \item{SITC Revision 4 Product Code}{Standard International Trade Classification `SITC` Revision 4 Product code.}
#'   \item{SITC Revision 4 Product Description}{Standard International Trade Classification `SITC` Revision 4 Product description.}
#' }
#' @examples
#' HS_S4
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"HS_S4"


#' @title Concordance Table: H0 to BEC 4
#'
#' @description Concordance table fromm `HS 1988/92` (`H0`) to `BEC4`
#'
#' @format A data frame with 5,016 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{BEC Product Code}{Broad Economic Category `BEC` Product code.}
#'   \item{BEC Product Description}{Broad Economic Category `BEC` Description code.}
#' }
#' @examples
#' H0_BE
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_BE"


#' @title Concordance Table: H0 to CCCN
#'
#' @description Concordance table fromm `HS 1988/92` (`H0`) to `CCCN`
#'
#' @format A data frame with 5,017 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{CCCN Product Code}{Customs Co-operation Council Nomenclature `CCCN` Product code.}
#'   \item{CCCN Product Description}{Customs Co-operation Council Nomenclature `CCCN` Product description}
#' }
#' @examples
#' H0_CC
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_CC"


#' @title Concordance Table: H0 to CPC
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `CPC`
#'
#' @format A data frame with 5,018 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{CPC Product Code}{Central Product Classification `CPC` Product code.}
#'   \item{CPC Product Description}{Central Product Classification `CPC` Product description.}
#' }
#' @examples
#' H0_CP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_CP"


#' @title Concordance Table: H0 to GTAPe
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `GTAP`
#'
#' @format A data frame with 4,933 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{GTAP Product Code}{Global Trade Analysis Project `GTAP` Product code.}
#'   \item{GTAP Product Description}{Global Trade Analysis Project `GTAP` Product description.}
#' }
#' @examples
#' H0_GP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' \url{https://www.gtap.agecon.purdue.edu/}
#' @keywords Concordance table
"H0_GP"


#' @title Concordance Table: H0 to ISIC Rev. 2
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `ISIC Rev. 2`
#'
#' @format A data frame with 5,018 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{ISIC Revision 2 Product Code}{International Standard Industrial Classification `ISIC` Revision 2 Product code.}
#'   \item{ISIC Revision 2 Product Description}{International Standard Industrial Classification `ISIC` Revision 2 Product description.}
#' }
#' @examples
#' H0_I2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_I2"


#' @title Concordance Table: H0 to ISIC Rev. 3
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `ISIC Rev. 3`
#'
#' @format A data frame with 5,018 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{ISIC Revision 3 Product Code}{International Standard Industrial Classification `ISIC` Revision 3 Product code.}
#'   \item{ISIC Revision 3 Product Description}{International Standard Industrial Classification `ISIC` Revision 3 Product description.}
#' }
#' @examples
#' H0_I3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_I3"


#' @title Concordance Table: H0 to SIC
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `SIC`
#'
#' @format A data frame with 5,013 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{SIC Product Code}{Standard Industrial Classification `SIC` Product code.}
#'   \item{SIC Product Description}{Standard Industrial Classification `SIC` Product description.}
#' }
#' @examples
#' H0_IU
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_IU"


#' @title Concordance Table: H0 to MTN
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `MTN Categories`
#'
#' @format A data frame with 5,020 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{MTN Categories Product Code}{Multilateral Trade Negotiations `MTN` Product code.}
#'   \item{MTN Categories Product Description}{Multilateral Trade Negotiations `MTN` Product description.}
#' }
#' @examples
#' H0_MT
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_MT"


#' @title Concordance Table: H0 to SITC Rev. 1
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `SITC Rev. 1`
#'
#' @format A data frame with 5,012 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC` Revision 1 Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC` Revision 1 Product description.}
#' }
#' @examples
#' H0_S1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_S1"


#' @title Concordance Table: H0 to SITC Rev. 2
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `SITC Rev. 2`
#'
#' @format A data frame with 5,017 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC` Revision 2 Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC` Revision 2 Product description.}
#' }
#' @examples
#' H0_S2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_S2"


#' @title Concordance Table: H0 to SITC Rev. 3
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `SITC Rev. 3`
#'
#' @format A data frame with 5,017 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{SITC Revision 3 Product Code}{Standard International Trade Classification `SITC` Revision 3 Product code.}
#'   \item{SITC Revision 3 Product Description}{Standard International Trade Classification `SITC` Revision 3 Product description.}
#' }
#' @examples
#' H0_S3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_S3"


#' @title Concordance Table: H0 to SITC Rev. 4
#'
#' @description Concordance table from `HS 1988/92` (`H0`) to `SITC Rev. 4`
#'
#' @format A data frame with 5,018 rows and 4 variables:
#' \describe{
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#'   \item{SITC Revision 4 Product Code}{Standard International Trade Classification `SITC` Revision 4 Product code.}
#'   \item{SITC Revision 4 Product Description}{Standard International Trade Classification `SITC` Revision 4 Product description.}
#' }
#' @examples
#' H0_S4
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H0_S4"


#' @title Concordance Table: H1 to BEC
#'
#' @description Concordance table from `HS 1996` (`H1`) to `BEC`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{BEC Product Code}{Broad Economic Category `BEC` Product code.}
#'   \item{BEC Product Description}{Broad Economic Category `BEC` Description code.}
#' }
#' @examples
#' H1_BE
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_BE"


#' @title Concordance Table: H1 to CCCN
#'
#' @description Concordance table from `HS 1996` (`H1`) to `CCCN`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{CCCN Product Code}{Customs Co-operation Council Nomenclature `CCCN` Product code.}
#'   \item{CCCN Product Description}{Customs Co-operation Council Nomenclature `CCCN` Product description}
#' }
#' @examples
#' H1_CC
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_CC"


#' @title Concordance Table: H1 to CPC
#'
#' @description Concordance table from `HS 1996` (`H1`) to `CPC`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{CPC Product Code}{Central Product Classification `CPC` Product code.}
#'   \item{CPC Product Description}{Central Product Classification `CPC` Product description.}
#' }
#' @examples
#' H1_CP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_CP"


#' @title Concordance Table: H1 to GTAP
#'
#' @description Concordance table from `HS 1996` (`H1`) to `GTAP`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{GTAP Product Code}{Global Trade Analysis Project `GTAP` Product code.}
#'   \item{GTAP Product Description}{Global Trade Analysis Project `GTAP` Product description.}
#' }
#' @examples
#' H1_GP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_GP"


#' @title Concordance Table: H1 to H0
#'
#' @description Concordance table from `HS 1996` (`H1`) to `HS 1988/92` (`H0`)
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#' }
#' @examples
#' H1_H0
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_H0"


#' @title Concordance Table: H1 to ISIC Rev. 2
#'
#' @description Concordance table from `HS 1996` (`H1`) to `ISIC Rev. 2`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{ISIC Revision 2 Product Code}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#'   \item{ISIC Revision 2 Product Description}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#' }
#' @examples
#' H1_I2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_I2"


#' @title Concordance Table: H1 to ISIC Rev. 3
#'
#' @description Concordance table from `HS 1996` (`H1`) to `ISIC Rev. 3`
#'
#' @format A data frame with 5,113 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{ISIC Revision 3 Product Code}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#'   \item{ISIC Revision 3 Product Description}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#' }
#' @examples
#' H1_I3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_I3"


#' @title Concordance Table: H1 to SIC
#'
#' @description Concordance table from `HS 1996` (`H1`) to `SIC`
#'
#' @format A data frame with 5,108 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{SIC Product Code}{Standard Industrial Classification `SIC` Product code.}
#'   \item{SIC Product Description}{Standard Industrial Classification `SIC` Product description.}
#' }
#' @examples
#' H1_IU
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_IU"


#' @title Concordance Table: H1 to MTN
#'
#' @description Concordance table from `HS 1996` (`H1`) to `MTN Categories`
#'
#' @format A data frame with 3,771 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{MTN Categories Product Code}{Multilateral Trade Negotiations `MTN` Product code.}
#'   \item{MTN Categories Product Description}{Multilateral Trade Negotiations `MTN` Product description.}
#' }
#' @examples
#' H1_MT
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_MT"


#' @title Concordance Table: H1 to SITC Rev. 1
#'
#' @description Concordance table from `HS 1996` (`H1`) to `SITC Rev. 1`
#'
#' @format A data frame with 5,106 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC` Revision 1 Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC` Revision 1 Product description.}
#' }
#' @examples
#' H1_S1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_S1"


#' @title Concordance Table: H1 to SITC Rev. 2
#'
#' @description Concordance table from `HS 1996` (`H1`) to `SITC Rev. 2`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC` Revision 2 Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC` Revision 2 Product description.}
#' }
#' @examples
#' H1_S2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_S2"


#' @title Concordance Table: H1 to SITC Rev. 3
#'
#' @description Concordance table from `HS 1996` (`H1`) to `SITC Rev. 3`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{SITC Revision 3 Product Code}{Standard International Trade Classification `SITC` Revision 3 Product code.}
#'   \item{SITC Revision 3 Product Description}{Standard International Trade Classification `SITC` Revision 3 Product description.}
#' }
#' @examples
#' H1_S3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_S3"


#' @title Concordance Table: H1 to SITC Rev. 4
#'
#' @description Concordance table from `HS 1996` (`H1`) to `SITC Rev. 4`
#'
#' @format A data frame with 5,111 rows and 4 variables:
#' \describe{
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#'   \item{SITC Revision 4 Product Code}{Standard International Trade Classification `SITC` Revision 4 Product code.}
#'   \item{SITC Revision 4 Product Description}{Standard International Trade Classification `SITC` Revision 4 Product description.}
#' }
#' @examples
#' H1_S4
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H1_S4"


#' @title Concordance Table: H2 to BEC
#'
#' @description Concordance table from `HS 2002` (`H2`) to `BEC`
#'
#' @format A data frame with 5,222 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{BEC Product Code}{Broad Economic Category `BEC` Product code.}
#'   \item{BEC Product Description}{Broad Economic Category `BEC` Description code.}
#' }
#' @examples
#' H2_BE
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_BE"


#' @title Concordance Table: H2 to CCCN
#'
#' @description Concordance table from `HS 2002` (`H2`) to `CCCN`
#'
#' @format A data frame with 5,222 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{CCCN Product Code}{Customs Co-operation Council Nomenclature `CCCN` Product code.}
#'   \item{CCCN Product Description}{Customs Co-operation Council Nomenclature `CCCN` Product description}
#' }
#' @examples
#' H2_CC
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_CC"


#' @title Concordance Table: H2 to CPC
#'
#' @description Concordance table from `HS 2002` (`H2`) to `CPC`
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{CPC Product Code}{Central Product Classification `CPC` Product code.}
#'   \item{CPC Product Description}{Central Product Classification `CPC` Product description.}
#' }
#' @examples
#' H2_CP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_CP"


#' @title Concordance Table: H2 to GTAP
#'
#' @description Concordance table from `HS 2002` (`H2`) to `GTAP`
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{GTAP Product Code}{Global Trade Analysis Project `GTAP` Product code.}
#'   \item{GTAP Product Description}{Global Trade Analysis Project `GTAP` Product description.}
#' }
#' @examples
#' H2_GP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_GP"


#' @title Concordance Table: H2 to H0
#'
#' @description Concordance table from `HS 2002` (`H2`) to `HS 1988/92` (`H0`)
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#' }
#' @examples
#' H2_H0
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_H0"


#' @title Concordance Table: H2 to H1
#'
#' @description Concordance table from `HS 2002` (`H2`) to `HS 1996` (`H1`)
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#' }
#' @examples
#' H2_H1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_H1"


#' @title Concordance Table: H2 to ISIC Rev. 2
#'
#' @description Concordance table from `HS 2002` (`H2`) to `ISIC Rev. 2`
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{ISIC Revision 2 Product Code}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#'   \item{ISIC Revision 2 Product Description}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#' }
#' @examples
#' H2_I2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_I2"


#' @title Concordance Table: H2 to ISIC Rev. 3
#'
#' @description Concordance table from `HS 2002` (`H2`) to `ISIC Rev. 3`
#'
#' @format A data frame with 5,224 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{ISIC Revision 3 Product Code}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#'   \item{ISIC Revision 3 Product Description}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#' }
#' @examples
#' H2_I3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_I3"


#' @title Concordance Table: H2 to SIC
#'
#' @description Concordance table from `HS 2002` (`H2`) to `SIC`
#'
#' @format A data frame with 5,219 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{SIC Product Code}{Standard Industrial Classification `SIC` Product code.}
#'   \item{SIC Product Description}{Standard Industrial Classification `SIC` Product description.}
#' }
#' @examples
#' H2_IU
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_IU"


#' @title Concordance Table: H2 to MTN
#'
#' @description Concordance table from `HS 2002` (`H2`) to `MTN Categories`
#'
#' @format A data frame with 5,223 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{MTN Categories Product Code}{Multilateral Trade Negotiations `MTN` Product code.}
#'   \item{MTN Categories Product Description}{Multilateral Trade Negotiations `MTN` Product description.}
#' }
#' @examples
#' H2_MT
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_MT"


#' @title Concordance Table: H2 to SITC Rev. 1
#'
#' @description Concordance table from `HS 2002` (`H2`) to `SITC Rev. 1`
#'
#' @format A data frame with 5,217 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC` Revision 1 Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC` Revision 1 Product description.}
#' }
#' @examples
#' H2_S1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_S1"


#' @title Concordance Table: H2 to SITC Rev. 2
#'
#' @description Concordance table from `HS 2002` (`H2`) to `SITC Rev. 2`
#'
#' @format A data frame with 5,222 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC` Revision 2 Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC` Revision 2 Product description.}
#' }
#' @examples
#' H2_S2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_S2"


#' @title Concordance Table: H2 to SITC Rev. 3
#'
#' @description Concordance table from `HS 2002` (`H2`) to `SITC Rev. 3`
#'
#' @format A data frame with 5,222 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{SITC Revision 3 Product Code}{Standard International Trade Classification `SITC` Revision 3 Product code.}
#'   \item{SITC Revision 3 Product Description}{Standard International Trade Classification `SITC` Revision 3 Product description.}
#' }
#' @examples
#' H2_S3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_S3"


#' @title Concordance Table: H2 to SITC Rev. 4
#'
#' @description Concordance table from `HS 2002` (`H2`) to `SITC Rev. 4`
#'
#' @format A data frame with 5,220 rows and 4 variables:
#' \describe{
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#'   \item{SITC Revision 4 Product Code}{Standard International Trade Classification `SITC` Revision 4 Product code.}
#'   \item{SITC Revision 4 Product Description}{Standard International Trade Classification `SITC` Revision 4 Product description.}
#' }
#' @examples
#' H2_S4
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H2_S4"


#' @title Concordance Table: H3 to BEC
#'
#' @description Concordance table from `HS 2007` (`H3`) to `BEC`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{BEC Product Code}{Broad Economic Category `BEC` Product code.}
#'   \item{BEC Product Description}{Broad Economic Category `BEC` Description code.}
#' }
#' @examples
#' H3_BE
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_BE"


#' @title Concordance Table: H3 to CCCN
#'
#' @description Concordance table from `HS 2007` (`H3`) to `CCCN`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{CCCN Product Code}{Customs Co-operation Council Nomenclature `CCCN` Product code.}
#'   \item{CCCN Product Description}{Customs Co-operation Council Nomenclature `CCCN` Product description}
#' }
#' @examples
#' H3_CC
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_CC"


#' @title Concordance Table: H3 to CPC
#'
#' @description Concordance table from `HS 2007` (`H3`) to `CPC`
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{CPC Product Code}{Central Product Classification `CPC` Product code.}
#'   \item{CPC Product Description}{Central Product Classification `CPC` Product description.}
#' }
#' @examples
#' H3_CP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_CP"


#' @title Concordance Table: H3 to GTAP
#'
#' @description Concordance table from `HS 2007` (`H3`) to `GTAP`
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{GTAP Product Code}{Global Trade Analysis Project `GTAP` Product code.}
#'   \item{GTAP Product Description}{Global Trade Analysis Project `GTAP` Product description.}
#' }
#' @examples
#' H3_GP
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_GP"


#' @title Concordance Table: H3 to H0
#'
#' @description Concordance table from `HS 2007` (`H3`) to `HS 1988/92` (`H0`)
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#' }
#' @examples
#' H3_H0
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_H0"


#' @title Concordance Table: H3 to H1
#'
#' @description Concordance table from `HS 2007` (`H3`) to `HS 1996` (`H1`)
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#' }
#' @examples
#' H3_H1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_H1"


#' @title Concordance Table: H3 to H2
#'
#' @description Concordance table from `HS 2007` (`H3`) to `HS 2002` (`H2`)
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#' }
#' @examples
#' H3_H2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_H2"


#' @title Concordance Table: H3 to ISIC Rev. 2
#'
#' @description Concordance table from `HS 2007` (`H3`) to `ISIC Rev. 2`
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{ISIC Revision 2 Product Code}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#'   \item{ISIC Revision 2 Product Description}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#' }
#' @examples
#' H3_I2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_I2"


#' @title Concordance Table: H3 to ISIC Rev. 3
#'
#' @description Concordance table from `HS 2007` (`H3`) to `ISIC Rev. 3`
#'
#' @format A data frame with 5,052 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{ISIC Revision 3 Product Code}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#'   \item{ISIC Revision 3 Product Description}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#' }
#' @examples
#' H3_I3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_I3"


#' @title Concordance Table: H3 to SIC
#'
#' @description Concordance table from `HS 2007` (`H3`) to `SIC`
#'
#' @format A data frame with 5,047 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{SIC Product Code}{Standard Industrial Classification `SIC` Product code.}
#'   \item{SIC Product Description}{Standard Industrial Classification `SIC` Product description.}
#' }
#' @examples
#' H3_IU
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_IU"


#' @title Concordance Table: H3 to MTN
#'
#' @description Concordance table from `HS 2007` (`H3`) to `MTN Categories`
#'
#' @format A data frame with 5,051 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{MTN Categories Product Code}{Multilateral Trade Negotiations `MTN` Product code.}
#'   \item{MTN Categories Product Description}{Multilateral Trade Negotiations `MTN` Product description.}
#' }
#' @examples
#' H3_MT
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_MT"


#' @title Concordance Table: H3 to SITC Rev. 1
#'
#' @description Concordance table from `HS 2007` (`H3`) to `SITC Rev. 1`
#'
#' @format A data frame with 5,045 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC` Revision 1 Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC` Revision 1 Product description.}
#' }
#' @examples
#' H3_S1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_S1"


#' @title Concordance Table: H3 to SITC Rev. 2
#'
#' @description Concordance table from `HS 2007` (`H3`) to `SITC Rev. 2`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC` Revision 2 Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC` Revision 2 Product description.}
#' }
#' @examples
#' H3_S2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_S2"


#' @title Concordance Table: H3 to SITC Rev. 3
#'
#' @description Concordance table from `HS 2007` (`H3`) to `SITC Rev. 3`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{SITC Revision 3 Product Code}{Standard International Trade Classification `SITC` Revision 3 Product code.}
#'   \item{SITC Revision 3 Product Description}{Standard International Trade Classification `SITC` Revision 3 Product description.}
#' }
#' @examples
#' H3_S3
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_S3"


#' @title Concordance Table: H3 to SITC Rev. 4
#'
#' @description Concordance table from `HS 2007` (`H3`) to `SITC Rev. 4`
#'
#' @format A data frame with 5,050 rows and 4 variables:
#' \describe{
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#'   \item{SITC Revision 4 Product Code}{Standard International Trade Classification `SITC` Revision 4 Product code.}
#'   \item{SITC Revision 4 Product Description}{Standard International Trade Classification `SITC` Revision 4 Product description.}
#' }
#' @examples
#' H3_S4
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"H3_S4"


#' @title Concordance Table: H4 to BEC 4
#'
#' @description Concordance table from `HS 2012` (`H4`) to `BEC Rev. 4` (`BEC`).
#'
#' @format A data frame with 5,283 rows and 2 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{BEC 4 Product Code}{Broad Economic Category `BEC` 4 Product code.}
#' }
#' @examples
#' H4_BE
#' @source \url{https://unstats.un.org/unsd/classifications/Econ#Correspondences}
#' @keywords Concordance table
"H4_BE"


#' @title Concordance Table: H4 to BEC 5
#'
#' @description Concordance table from `HS 2012` (`H4`) to `BEC Rev. 5` (`BEC5`).
#'
#' @format A data frame with 5,205 rows and 8 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{BEC 5 Product Category}{Broad Economic Category `BEC` 5 category.}
#'   \item{BEC 5 Code}{Broad Economic Category `BEC` 4 Product code.}
#'   \item{BEC 5 End-user Dimension}{Broad Economic Category `BEC` 5 end-user dimension.}
#'   \item{BEC 5 Processing Dimension}{Broad Economic Category `BEC` 5 processing dimension.}
#'   \item{BEC 5 Specification Dimension}{Broad Economic Category `BEC` 5 specification dimension.}
#'   \item{BEC 5 Durability Dimension}{Broad Economic Category `BEC` 5 durability dimension.}
#' }
#' @examples
#' H4_BE5
#' @source \url{https://unstats.un.org/unsd/trade/classifications/bec.asp}
#' @keywords Concordance table
"H4_BE5"



#' @title Concordance Table: H4 to CPC
#'
#' @description Concordance table from `HS 2012` (`H4`)to `CPC`
#'
#' @format A data frame with 5,205 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{CPC Product Code}{Central Product Classification `CPC` Product code.}
#'   \item{CPC Product Description}{Central Product Classification `CPC` Product description.}
#' }
#' @examples
#' H4_CP
#' @source \url{https://unstats.un.org/unsd/trade/classifications/bec.asp}
#' @keywords Concordance table
"H4_CP"


#' @title Concordance Table: H4 to GTAP
#'
#' @description Concordance table from `HS 2012` (`H4`) to `GTAP`
#'
#' @format A data frame with 5,205 rows and 5 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{GTAP Product Code}{Global Trade Analysis Project `GTAP` Product code.}
#'   \item{GTAP Product}{Global Trade Analysis Project `GTAP` Product group.}
#'   \item{GTAP Product Description}{Global Trade Analysis Project `GTAP` Product description.}
#' }
#' @examples
#' H4_GP
#' @source \url{https://unstats.un.org/unsd/trade/classifications/bec.asp}
#' @keywords Concordance table
"H4_GP"


#' @title Concordance Table: H4 to H0
#'
#' @description Concordance table from `HS 2012` (`H4`) to `HS 1988/92` (`H0`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 6,739 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#' }
#' @examples
#' H4_H0
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H4_H0"


#' @title Concordance Table: H4 to H1
#'
#' @description Concordance table from `HS 2012` (`H4`) to `HS 1996` (`H1`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 6,420 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#' }
#' @examples
#' H4_H1
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H4_H1"


#' @title Concordance Table: H4 to H2
#'
#' @description Concordance table from `HS 2012` (`H4`) to `HS 2002` (`H2`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 6,025 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#' }
#' @examples
#' H4_H2
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H4_H2"


#' @title Concordance Table: H4 to H3
#'
#' @description Concordance table from `HS 2012` (`H4`) to `HS 2007` (`H3`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 5,205 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#' }
#' @examples
#' H4_H3
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H4_H3"




#' @title Concordance Table: H4 to I3.1
#'
#' @description Concordance table from `HS 2012` (`H4`) to `ISIC Rev. 3.1` (`I3.1`).
#' Please note that the H4_I31 does not provide ISIC Rev. 3.1 4-digit
#' level for the following commodities for which concordance is only available
#' at the 2-digit and 3-digit level, respectively:
#'
#' | `HS 2012 Product Code` | `HS 2012 Product Description`                                                                                                                 |  `ISIC Revision 3.1 Product Code` | `ISIC Revision 3.1 Product Description`                                  |
#' | -----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|--------------------------------------------------------------------------|
#' | 030111                 | live ornamental freshwater fish                                                                                                               |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030119                 | live ornamental fish, other than freshwater                                                                                                   |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030194                 | atlantic and pacific bluefin tunas (thunnus thynnus, thunnus  orientalis).                                                                    |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030195                 | Fish; live, southern bluefin tunas (Thunnus maccoyii)                                                                                         |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030213                 | pacific salmon, fresh or chilled, excluding fillets, other meat portions, livers and roes                                                     |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030214                 | atlantic and danube salmon, fresh or chilled, excluding fillets, other meat portions, livers and roes                                         |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030224                 | turbots                                                                                                                                       |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030241                 | herrings, fresh or chilled, excluding fillets, other meat portions, livers and roes                                                           |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030242                 | anchovies, excl. fillets, livers & roes, fresh or chilled, scaled, in immediate containers weighing with their contents <6.8 kg               |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030243                 | sardines, sardinella, brisling or sprats, fresh or chilled, excluding fillets, other meat portions, livers and roes                           |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030244                 | mackerel, excl. fillets, livers & roes, fresh or chilled                                                                                      |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030245                 | jack & horse mackerel, excl. fillets, livers & roes, fresh or chilled, scaled                                                                 |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030246                 | cobia, excl. fillets, livers and roes, fresh or chilled, scaled                                                                               |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030247                 | swordfish, fresh or chilled, excluding livers and roes                                                                                        |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030251                 | cod, fresh or chilled, excluding fillets, other meat portions, livers and roes                                                                |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030252                 | haddock, fresh or chilled, excluding fillets, other meat portions, livers and roes                                                            |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030253                 | coalfish, fresh or chilled, excluding fillets, other meat portions, livers and roes                                                           |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030254                 | hake, excl. fillets, livers and roes, fresh or chilled, scaled                                                                                |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030255                 | alaska pollack, excl. fillets, livers,roes, fresh or chilled, scaled                                                                          |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030256                 | blue whitings, excl. fillets, livers & roes, fresh or chilled, scaled                                                                         |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030259                 | bregmacerotidae et al fish, nesi, excl. fillets, livers and roes, fresh or chilled, scaled                                                    |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030271                 | tilapias, excl. fillets, livers and roes, fresh or chilled, scaled                                                                            |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030272                 | catfish, excl. fillets, livers and roes, fresh or chilled, scaled                                                                             |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030273                 | carp, excl. fillets, livers and roes, fresh or chilled, scaled                                                                                |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030274                 | eels, fresh or chilled, excluding fillets, other meat portions, livers and roes                                                               |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030279                 | fish beginning  0302.7, nesi, excl. fillets, livers and roes, fresh or chilled, scaled                                                        |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030281                 | dogfish and other sharks, fresh or chilled, excluding fillets, livers, roes and fish meat of 0304                                             |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030282                 | rays & skates, excl. fillets, livers & roes, fresh or chilled, not scaled, or scaled in immediate containers over 6.8 kg                      |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030283                 | toothfish excl. fillets, livers & roes, fresh or chilled, not scaled, or scaled in immediate containers over 6.8 kg                           |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030284                 | seabass, excl. fillets, livers and roes, fresh or chilled, scaled                                                                             |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030285                 | seabream, excl. fillets, livers and roes, fresh or chilled, scaled                                                                            |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 030289                 | fish, nesi, excl. fillets, livers and roes, fresh or chilled, scaled                                                                          |  050                              | Fishing, aquaculture and service activities incidental to fishing        |
#' | 470710                 | waste and scrap of unbleached kraft paper or paperboard or of corrugated paper or paperboard                                                  |  210                              | Manufacture of paper and paper products                                  |
#' | 470720                 | recovered (waste and scrap) paper or paperboard, made mainly of bleached chemical pulp, not colored in the mass                               |  210                              | Manufacture of paper and paper products                                  |
#' | 470730                 | recovered (waste and scrap) paper or paperboard, made mainly of mechanical pulp (for example, newspapers, journals and similar printed matter |  210                              | Manufacture of paper and paper products                                  |
#' | 470790                 | waste and scrap of paper or paperboard, nesoi, including unsorted waste and scrap                                                             |  210                              | Manufacture of paper and paper products                                  |
#' | 852910                 | antennas and antenna reflectors and parts thereof                                                                                             |  32                               | Manufacture of radio, television and communication equipment and appara~ |
#' | 852990                 | parts (except antennas and reflectors) for use with radio transmission, radar, radio navigational aid, reception and television apparatus, n~ |  32                               | Manufacture of radio, television and communication equipment and appara~ |
#'
#' Please see the official UNSD documentation for further information.
#'
#' @format A data frame with 5,205 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{ISIC Revision 3.1 Product Code}{International Standard Industrial Classification `ISIC Rev. 3.1` (`I31`) Product code.}
#'   \item{ISIC Revision 3.1 Product Description}{International Standard Industrial Classification `ISIC Rev. 3.1` (`I31`) Product code.}
#' }
#' @examples
#' H4_I31
#' @source \url{https://unstats.un.org/unsd/trade/classifications/bec.asp}
#' @keywords Concordance table
"H4_I31"

#' @title Concordance Table: H4 to I4
#'
#' @description Concordance table from `HS 2012` (`H4`) to `ISIC Rev. 4` (`I4`).
#'
#' @format A data frame with 5,205 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{ISIC Revision 4 Product Code}{International Standard Industrial Classification `ISIC Rev. 4` (`I4`) Product code.}
#'   \item{ISIC Revision 4 Product Description}{International Standard Industrial Classification `ISIC Rev. 4` (`I4`) Product code.}
#' }
#' @examples
#' H4_I4
#' @source \url{https://unstats.un.org/unsd/trade/classifications/bec.asp}
#' @keywords Concordance table
"H4_I4"


#' @title Concordance Table: H4 to S1
#'
#' @description Concordance table from `HS 2012` (`H4`) to `SITC Rev.1` (`S1`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 10,220 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC` Revision 1 Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC` Revision 1 Product description.}
#' }
#' @examples
#' H4_S1
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H4_S1"


#' @title Concordance Table: H4 to S2
#'
#' @description Concordance table from `HS 2012` (`H4`) to `SITC Rev.2` (`S2`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 11,588 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC` Revision 2 Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC` Revision 2 Product description.}
#' }
#' @examples
#' H4_S2
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H4_S2"


#' @title Concordance Table: H4 to S3
#'
#' @description Concordance table from `HS 2012` (`H4`) to `SITC Rev.3` (`S3`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 6,605 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{SITC Revision 3 Product Code}{Standard International Trade Classification `SITC` Revision 3 Product code.}
#'   \item{SITC Revision 3 Product Description}{Standard International Trade Classification `SITC` Revision 3 Product description.}
#' }
#' @examples
#' H4_S3
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H4_S3"


#' @title Concordance Table: H4 to S4
#'
#' @description Concordance table from `HS 2012` (`H4`) to `SITC Rev.4` (`S4`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#' @format A data frame with 5,299 rows and 4 variables:
#' \describe{
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#'   \item{SITC Revision 4 Product Code}{Standard International Trade Classification `SITC` Revision 4 Product code.}
#'   \item{SITC Revision 4 Product Description}{Standard International Trade Classification `SITC` Revision 4 Product description.}
#' }
#' @examples
#' H4_S4
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H4_S4"


#' @title Concordance Table: H5 to H0
#'
#' @description Concordance table from `HS 2017` (`H5`) to `BEC Rev. 4` (`BEC`).
#'
#' @format A data frame with 5,386 rows and 2 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{BEC 4 Product Code}{Broad Economic Category `BEC` 4 Product code.}
#' }
#' @examples
#' H5_BE
#' @source \url{https://unstats.un.org/unsd/classifications/Econ#Correspondences}
#' @keywords Concordance table
"H5_BE"


#' @title Concordance Table: H5 to H0
#'
#' @description Concordance table from `HS 2017` (`H5`) to `HS 1988/92` (`H0`).
#'
#' @format A data frame with 5,388 rows and 3 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{HS 1988/92 Product Code}{Harmonised System `HS 1988/92` (`H0`) Product code.}
#'   \item{HS 1988/92 Product Description}{Harmonised System `HS 1988/92` (`H0`) Product description.}
#' }
#' @examples
#' H5_H0
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H5_H0"


#' @title Concordance Table: H5 to H1
#'
#' @description Concordance table from `HS 2017` (`H5`) to `HS 1996` (`H1`).
#'
#' @format A data frame with 5,388 rows and 3 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{HS 1996 Product Code}{Harmonised System `HS 1996` (`H1`) Product code.}
#'   \item{HS 1996 Product Description}{Harmonised System `HS 1996` (`H1`) Product description.}
#' }
#' @examples
#' H5_H1
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H5_H1"


#' @title Concordance Table: H5 to H2
#'
#' @description Concordance table from `HS 2017` (`H5`) to `HS 2002` (`H2`).
#'
#' @format A data frame with 5,388  rows and 3 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{HS 2002 Product Code}{Harmonised System `HS 2002` (`H2`) Product code.}
#'   \item{HS 2002 Product Description}{Harmonised System `HS 2002` (`H2`) Product description.}
#' }
#' @examples
#' H5_H2
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H5_H2"


#' @title Concordance Table: H5 to H3
#'
#' @description Concordance table from `HS 2017` (`H5`) to `HS 2007` (`H3`).
#'
#' @format A data frame with 5,388 rows and 3 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{HS 2007 Product Code}{Harmonised System `HS 2007` (`H3`) Product code.}
#'   \item{HS 2007 Product Description}{Harmonised System `HS 2007` (`H3`) Product description.}
#' }
#' @examples
#' H5_H3
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H5_H3"


#' @title Concordance Table: H5 to H4
#'
#' @description Concordance table from `HS 2017` (`H5`) to `HS 2012` (`H4`).
#'
#' @format A data frame with 5,388 rows and 3 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{HS 2012 Product Code}{Harmonised System `HS 2012` (`H4`) Product code.}
#'   \item{HS 2012 Product Description}{Harmonised System `HS 2012` (`H4`) Product description.}
#' }
#' @examples
#' H5_H4
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H5_H4"


#' @title Concordance Table: H5 to S1
#'
#' @description Concordance table from `HS 2017` (`H5`) to `SITC Rev.1` (`S1`).
#'
#' @format A data frame with 5,380 rows and 3 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC Rev.1` (`S1`) Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC Rev.1` (`S1`) Product description.}
#' }
#' @examples
#' H5_S1
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H5_S1"


#' @title Concordance Table: H5 to S2
#'
#' @description Concordance table from `HS 2017` (`H5`) to `SITC Rev.2` (`S2`).
#' @format A data frame with 5,386 rows and 3 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC Rev.2` (`S2`) Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC Rev.1` (`S2`) Product description.}
#' }
#' @examples
#' H5_S2
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H5_S2"


#' @title Concordance Table: H5 to S3
#'
#' @description Concordance table from `HS 2017` (`H5`) to `SITC Rev.3` (`S3`).
#'
#' @format A data frame with 5,386 rows and 3 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{SITC Revision 3 Product Code}{Standard International Trade Classification `SITC` Revision 3 Product code.}
#'   \item{SITC Revision 3 Product Description}{Standard International Trade Classification `SITC` Revision 3 Product description.}
#' }
#' @examples
#' H5_S3
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H5_S3"


#' @title Concordance Table: H5 to S4
#'
#' @description Concordance table from `HS 2017` (`H5`) to `SITC Rev.4` (`S4`).
#'
#' @format A data frame with 5,386 rows and 3 variables:
#' \describe{
#'   \item{HS 2017 Product Code}{Harmonised System `HS 2017` (`H5`) Product code.}
#'   \item{SITC Revision 4 Product Code}{Standard International Trade Classification `SITC Rev.4` (`S4`) Product code.}
#'   \item{SITC Revision 4 Product Description}{Standard International Trade Classification `SITC Rev.4` (`S4`) Product description.}
#' }
#' @examples
#' H5_S4
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"H5_S4"


#' @title Concordance Table: S1 to BE
#'
#' @description Concordance table from `SITC Rev.1` (`S1`) to `BEC`.
#'
#' @format A data frame with 1,312 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC Rev.1` (`S1`) Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC Rev.1` (`S1`) Product description.}
#'   \item{BEC Product Code}{Broad Economic Category `BEC` Product code.}
#'   \item{BEC Product Description}{Broad Economic Category `BEC` Product description.}
#' }
#' @examples
#' S1_BE
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"S1_BE"


#' @title Concordance Table: S2 to BE
#'
#' @description Concordance table from `SITC Rev.2` (`S2`) to `BEC`.
#'
#' @format A data frame with 1,312 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC Rev.2` (`S2`) Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC Rev.2` (`S2`) Product description.}
#'   \item{BEC Product Code}{Broad Economic Category `BEC` Product code.}
#'   \item{BEC Product Description}{Broad Economic Category `BEC` Product description.}
#' }
#' @examples
#' S2_BE
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"S2_BE"


#' @title Concordance Table: S2 to I2
#'
#' @description Concordance table from `SITC Rev.2` (`S2`) to `ISIC Rev. 2` (`I2`).
#'
#' @format A data frame with 1,312 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC Rev.2` (`S2`) Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC Rev.2` (`S2`) Product description.}
#'   \item{ISIC Revision 2 Product Code}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#'   \item{ISIC Revision 2 Product Description}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#' }
#' @examples
#' S2_I2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"S2_I2"


#' @title Concordance Table: S2 to S1
#'
#' @description Concordance table from `SITC Rev.2` (`S2`) and  `SITC Rev.1` (`S1`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#'
#' @format A data frame with 2,016 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC Rev.2` (`S2`) Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC Rev.2` (`S2`) Product description.}
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC Rev.1` (`S1`) Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC Rev.1` (`S1`) Product description.}
#' }
#' @examples
#' S2_S1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"S2_S1"


#' @title Concordance Table: S3 to S1
#'
#' @description Concordance table from `SITC Rev.3` (`S3`) and  `SITC Rev.1` (`S1`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#'
#' @format A data frame with 2,016 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 3 Product Code}{Standard International Trade Classification `SITC Rev.3` (`S3`) Product code.}
#'   \item{SITC Revision 3 Product Description}{Standard International Trade Classification `SITC Rev.3` (`S3`) Product description.}
#'   \item{SITC Revision 1 Product Code}{Standard International Trade Classification `SITC Rev.1` (`S1`) Product code.}
#'   \item{SITC Revision 1 Product Description}{Standard International Trade Classification `SITC Rev.1` (`S1`) Product description.}
#' }
#' @examples
#' S3_S1
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"S3_S1"


#' @title Concordance Table: S3 to S2
#'
#' @description Concordance table from `SITC Rev.3` (`S3`) and  `SITC Rev.2` (`S2`). Product descriptions taken
#' fromm WITS' `HS combined` concordance tables (\url{https://wits.worldbank.org/product_concordance.html}).
#'
#'
#' @format A data frame with 3,121 rows and 4 variables:
#' \describe{
#'   \item{SITC Revision 3 Product Code}{Standard International Trade Classification `SITC Rev.3` (`S3`) Product code.}
#'   \item{SITC Revision 3 Product Description}{Standard International Trade Classification `SITC Rev.3` (`S3`) Product description.}
#'   \item{SITC Revision 2 Product Code}{Standard International Trade Classification `SITC Rev.2` (`S2`) Product code.}
#'   \item{SITC Revision 2 Product Description}{Standard International Trade Classification `SITC Rev.2` (`S2`) Product description.}
#' }
#' @examples
#' S3_S2
#' @source \url{https://wits.worldbank.org/product_concordance.html}
#' @keywords Concordance table
"S3_S2"


#' @title Concordance Table: I2 to I3
#'
#' @description Concordance table from `ISIC Rev.2` (`I2`) and  `ISIC Rev.3` (`I3`).
#'
#'
#' @format A data frame with 586  rows and 3 variables:
#' \describe{
#'   \item{ISIC Revision 2 Product Code}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#'   \item{ISIC Revision 3 Product Code}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#'   \item{ISIC Revision 3 Product Description}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#' }
#' @examples
#' I2_I3
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"I2_I3"


#' @title Concordance Table: I2 to I31
#'
#' @description Concordance table from `ISIC Rev.2` (`I2`) and  `ISIC Rev.3.1` (`I3.1`).
#'
#'
#' @format A data frame with 562   rows and 4 variables:
#' \describe{
#'   \item{ISIC Revision 2 Product Code}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#'   \item{ISIC Revision 3.1 Product Code}{International Standard Industrial Classification `ISIC Rev. 3.1` (`I31`) Product code.}
#'   \item{ISIC Revision 3.1 Product Description}{International Standard Industrial Classification `ISIC Rev. 3.1` (`I31`) Product code.}
#' }
#' @examples
#' I2_I31
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"I2_I31"


#' @title Concordance Table: I3 to I2
#'
#' @description Concordance table from `ISIC Rev.3` (`I3`) and  `ISIC Rev.2` (`I2`).
#'
#'
#' @format A data frame with 586  rows and 3 variables:
#' \describe{
#'   \item{ISIC Revision 3 Product Code}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#'   \item{ISIC Revision 2 Product Code}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#'   \item{ISIC Revision 2 Product Description}{International Standard Industrial Classification `ISIC Rev. 2` (`I2`) Product code.}
#' }
#' @examples
#' I3_I2
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"I3_I2"


#' @title Concordance Table: I3 to I31
#'
#' @description Concordance table from `ISIC Rev.3` (`I3`) and  `ISIC Rev. 3.1` (`I31`).
#'
#'
#' @format A data frame with 562   rows and 3 variables:
#' \describe{
#'   \item{ISIC Revision 3 Product Code}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#'   \item{ISIC Revision 3.1 Product Code}{International Standard Industrial Classification `ISIC Rev. 3.1` (`I31`) Product code.}
#'   \item{ISIC Revision 3.1 Product Description}{International Standard Industrial Classification `ISIC Rev. 3.1` (`I31`) Product code.}
#' }
#' @examples
#' I3_I31
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"I3_I31"

#' @title Concordance Table: I31 to I3
#'
#' @description Concordance table from `ISIC Rev. 3.1` (`I31`) and  `ISIC Rev.3` (`I3`).
#'
#'
#' @format A data frame with 316  rows and 3 variables:
#' \describe{
#'   \item{ISIC Revision 3.1 Product Code}{International Standard Industrial Classification `ISIC Rev. 3.1` (`I31`) Product code.}
#'   \item{ISIC Revision 3 Product Code}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#'   \item{ISIC Revision 3 Product Description}{International Standard Industrial Classification `ISIC Rev. 3` (`I3`) Product code.}
#' }
#' @examples
#' I31_I3
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"I31_I3"


#' @title Concordance Table: I31 to I4
#'
#' @description Concordance table from `ISIC Rev. 3.1` (`I31`) and  `ISIC Rev.4` (`I4`).
#'
#'
#' @format A data frame with 586  rows and 3 variables:
#' \describe{
#'   \item{ISIC Revision 3.1 Product Code}{International Standard Industrial Classification `ISIC Rev. 3.1` (`I31`) Product code.}
#'   \item{ISIC Revision 4 Product Code}{International Standard Industrial Classification `ISIC Rev. 4` (`I4`) Product code.}
#'   \item{ISIC Revision 4 Product Description}{International Standard Industrial Classification `ISIC Rev. 4` (`I4`) Product code.}
#' }
#' @examples
#' I31_I4
#' @source \url{https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp}
#' @keywords Concordance table
"I31_I4"
