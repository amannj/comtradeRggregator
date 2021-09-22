#' @title Check Comtrade token
#'
#' @description Checks validity of supplied Comtrade token as described
#' in Comtrade's
#' [API documentation](https://comtrade.un.org/data/doc/api/#APIKey).
#'
#' The validity of the token can be checked using the official
#' [Access Rights Information](https://comtrade.un.org/ws/CheckRights.aspx)
#' mask, or directly via the official API service
#' ([link](https://comtrade.un.org/api/swagger/ui/index#!/Auth/Auth_Authorize)).
#'
#' In order to add a valid token to your `comtradeRggregator` query:
#'
#' 1. Follow the instruction on Comtrade's API page to
#' [Comtrade's API help page](https://comtrade.un.org/data/doc/api/)
#' to get access to an authentication code (token).
#'
#' 2. You can check the validity of your token
#' [here](https://comtrade.un.org/ws/CheckRights.aspx).
#'
#' 3. Use the token as input parameter `token` in function
#' `download_Comtrade()` to get unlimited (authenticated) usage of
#' 10,000 requests per hour. You can check the validity of the token obtained
#' in steps (1) to (2) without running a `comtradeRggreagator` query by using
#' the function `check_token(token = "<your token>"`.
#'
#' @param token Comtrade token; default is NULL.
#' @keywords api token Comtrade
#' @export
#' @import rjson
#' @examples
#' check_token() # by default, no token provided.
#' \dontrun{
#' check_token(token = "your token") # add your access token
#' }
#'
check_token <- function(token = NULL) {
  if (!is.null(token)) {
    info_token <- NULL
    try(
      {
        suppressWarnings({
          info_token <- rjson::fromJSON(
            file = paste0("https://comtrade.un.org/api/getUserInfo?token=", token)
          )
        })
      },
      silent = TRUE
    )
    if (is.list(info_token)) {
      exist_token <- TRUE
      message(
        "Comtrade token added; download limit set to 10,000 queries per hour.\n"
      )
    } else if (is.null(info_token)) {
      exist_token <- FALSE
      message(
        "Comtrade token incorrect; download restricted to 100 queries per hour.\n"
      )
    }
    return(exist_token)
  } else {
    message(
      "No Comtrade token specified; download restricted to 100 queries per hour.\n"
    )
  }
}
