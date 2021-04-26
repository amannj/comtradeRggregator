## H3 to I3 -----------------

H3_I3 <- readr::read_csv("data-raw/raw/JobID-48_Concordance_H3_to_I3.CSV",
                         col_types = readr::cols(.default = "c")
)  %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4)

usethis::use_data(H3_I3, overwrite = TRUE)
