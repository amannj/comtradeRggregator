

# test_that("download_bulk_Comtrade returns a data frame", {
#   AT_World <- download_bulk_Comtrade(
#     year = "2018",
#     frequency = "annual",
#     countries = "Austria",
#     partners = "World",
#     nomenclature = "HS2007",
#     commodity = "ag6",
#     direction = "all",
#     type = "commodities",
#     select.stats = "all",
#     token = Sys.getenv("COMTRADE_TOKEN"),
#     ext_cnt = 5,
#     is.mirrorData = FALSE,
#     rm.temporaryFiles = TRUE,
#     location.temporaryFiles = NULL,
#     sleep = 5
#   )
#
#   expect_s3_class(AT_World, "data.frame")
# })
# library(comtradeRggregator)
# downloadBulk_Comtrade(
#   type = "commodities", # commodities or services
#   frequency = "annual", # annual or monthly
#   year = "2020", # test multiple months
#   month = NULL,
#   countries = "all", # test multiple countries
#   nomenclature = "H3", # test multiple classifications
#   token = "lhsmuyUVrMuKuxtet0TbbJdfVUChniTF2DqR8kUxb9PqNxf2aQ+AqE+BwKHKycyg84HWaXUszKnPCKJ8zO5eFqoANzWiPaGX7dX/XEUAO0jImhk6ro/YqiL4hsPn4VLxHK5hSnE8vsHebKzR28GjyA==",
#   location.temporaryFiles = "P:/Papers/GVC - Africa/Analysis/data/raw/COMTRADE"
# )


# todo:
# - filter for multiple countries
# - clean up (no head)
# - ask for file name, save as rds
# - error handling
# - tests....
# Questions:
# - download multiple countries (not all) with one bulk api?
# - download multiple years with one bulk api call?
# - download multiple months with one bulk api call?
