#' Comtrade Data Availability Table
#'
#' Data availability varies by country and classification, and new trade data is released/revised very frequently
#' on [Comtrade](https://comtrade.un.org/). `comtradeRggregator` uses trade information corresponding to
#' [official Comtrade data availability](https://comtrade.un.org/data/da) which it updates once a day and stores
#' locally on your machine:
#'   `<your local package location>/data/Comtrade_DataAvailability/Comtrade_DataAvailability-<date stamp>.csv.gz`
#'   The locally stored Comtrade Data Availability file is used in every `download_Comtrade()` data query. In other
#'   words, if new data becomes available and is documented in the
#'    [official Comtrade data availability file](https://comtrade.un.org/data/da), `comtradeRggregator` will
#'    use this information no later than 24 hours after its publication.
#'
#' @format A data frame with approx. 66k rows and 10 variables:
#' \describe{
#'   \item{type}{Corresponds to `type` argument in `download_Comtrade()`; either `commodities` or `services`.}
#'   \item{freq}{Corresponds to `frequency` argument in `download_Comtrade()`; either `annual` or `monthly`.}
#'   \item{px}{Corresponds to abbreviation of `tradecode` argument in `download_Comtrade()`.}
#'   \item{r}{Country code.}
#'   \item{rDesc}{Country description.}
#'   \item{ps}{Corresponds to `year` (or `year`- `month` for monthly data) argument in `download_Comtrade()`.}
#'   \item{TotalRecords}{Number of total recods.}
#'   \item{isOriginal}{Is original; dummy variable.}
#'   \item{publicationDate}{Date of publication}
#'   \item{isPartnerDetail}{Is original; dummy variable.}
#' }
#' @source \url{https://comtrade.un.org/data/da}
"Comrade_DA"




#' HS3 to ISIC Rev. 3 Concordance Table
#'
#' Concordance table between `HS3` and `ISIC Rev. 3`
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
