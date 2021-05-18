# Our file is called "test-download_ComtradeDA.R"
library(testthat) # load testthat package
local_edition(3)
library(comtradeRggregator) # load package

mytoken <- "lhsmuyUVrMuKuxtet0TbbJdfVUChniTF2DqR8kUxb9PqNxf2aQ+AqE+BwKHKycyg84HWaXUszKnPCKJ8zO5eFqoANzWiPaGX7dX/XEUAO0jImhk6ro/YqiL4hsPn4VLxHK5hSnE8vsHebKzR28GjyA=="
mytempDirectory <- "C:/Users/juerg/Desktop/tmp"


test_that("download_Comtrade returns a data frame", {

  AT_World <- download_Comtrade(
    year = "2018",
    frequency = "annual",
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
  )


  expect_s3_class(AT_World, "data.frame")
})
