library(comtradeRggregator)
# H0 ------------

## H0 to BE -----------------

H0_BE <- readr::read_csv("data-raw/JobID-1_Concordance_H0_to_BE.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_BE)
H0_BE %>%
  mutate(lgth = nchar(`BEC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_BE <- H0_BE %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "BEC Product Code", variable.length = 3)

usethis::use_data(H0_BE, overwrite = TRUE)


## H0 to BE -----------------

H0_CC <- readr::read_csv("data-raw/JobID-2_Concordance_H0_to_CC.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_CC)
H0_CC %>%
  mutate(lgth = nchar(`CCCN Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_CC <- H0_CC %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "CCCN Product Code", variable.length = 6)

usethis::use_data(H0_CC, overwrite = TRUE)


## H0 to CP -----------------

H0_CP <- readr::read_csv("data-raw/JobID-3_Concordance_H0_to_CP.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_CP)
H0_CP %>%
  mutate(lgth = nchar(`CPC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_CP <- H0_CP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "CPC Product Code", variable.length = 5)

usethis::use_data(H0_CP, overwrite = TRUE)


## H0 to GP -----------------

H0_GP <- readr::read_csv("data-raw/JobID-4_Concordance_H0_to_GP.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_GP)
H0_GP %>%
  mutate(lgth = nchar(`GTAP Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_GP <- H0_GP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "GTAP Product Code", variable.length = 2)

usethis::use_data(H0_GP, overwrite = TRUE)




## H0 to I2 -----------------

H0_I2 <- readr::read_csv("data-raw/JobID-5_Concordance_H0_to_I2.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_I2)
H0_I2 %>%
  mutate(lgth = nchar(`ISIC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_I2 <- H0_I2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 2 Product Code", variable.length = 4)

usethis::use_data(H0_I2, overwrite = TRUE)


## H0 to I3 -----------------

H0_I3 <- readr::read_csv("data-raw/JobID-6_Concordance_H0_to_I3.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_I3)
H0_I3 %>%
  mutate(lgth = nchar(`ISIC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_I3 <- H0_I3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4)

usethis::use_data(H0_I3, overwrite = TRUE)


## H0 to IU -----------------

H0_IU <- readr::read_csv("data-raw/JobID-7_Concordance_H0_to_IU.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_IU)
H0_IU %>%
  mutate(lgth = nchar(`SIC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_IU <- H0_IU %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SIC Product Code", variable.length = 4)

usethis::use_data(H0_IU, overwrite = TRUE)


## H0 to MT -----------------

H0_MT <- readr::read_csv("data-raw/JobID-8_Concordance_H0_to_MT.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_MT)
H0_MT %>%
  mutate(lgth = nchar(`MTN Categories Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_MT <- H0_MT %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "MTN Categories Product Code", variable.length = 4)

usethis::use_data(H0_MT, overwrite = TRUE)


## H0 to S1 -----------------

H0_S1 <- readr::read_csv("data-raw/JobID-9_Concordance_H0_to_S1.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_S1)
H0_S1 %>%
  mutate(lgth = nchar(`SITC Revision 1 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_S1 <- H0_S1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SITC Revision 1 Product Code", variable.length = 5)

usethis::use_data(H0_S1, overwrite = TRUE)


## H0 to S2 -----------------

H0_S2 <- readr::read_csv("data-raw/JobID-10_Concordance_H0_to_S2.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_S2)
H0_S2 %>%
  mutate(lgth = nchar(`SITC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_S2 <- H0_S2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SITC Revision 2 Product Code", variable.length = 5)

usethis::use_data(H0_S2, overwrite = TRUE)


## H0 to S3 -----------------

H0_S3 <- readr::read_csv("data-raw/JobID-11_Concordance_H0_to_S3.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_S3)
H0_S3 %>%
  mutate(lgth = nchar(`SITC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_S3 <- H0_S3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SITC Revision 3 Product Code", variable.length = 5)

usethis::use_data(H0_S3, overwrite = TRUE)


## H0 to S4 -----------------

H0_S4 <- readr::read_csv("data-raw/JobID-12_Concordance_H0_to_S4.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H0_S4)
H0_S4 %>%
  mutate(lgth = nchar(`SITC Revision 4 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H0_S4 <- H0_S4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SITC Revision 4 Product Code", variable.length = 5)

usethis::use_data(H0_S4, overwrite = TRUE)





# H1 ------------




# H2 ------------




# H3 ------------

## H3 to BE -----------------

H3_BE <- readr::read_csv("data-raw/JobID-40_Concordance_H3_to_BE.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_BE)
H3_BE %>%
  mutate(lgth = nchar(`BEC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_BE <- H3_BE %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "BEC Product Code", variable.length = 3)

usethis::use_data(H3_BE, overwrite = TRUE)


## H3 to BE -----------------

H3_CC <- readr::read_csv("data-raw/JobID-41_Concordance_H3_to_CC.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_CC)
H3_CC %>%
  mutate(lgth = nchar(`CCCN Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_CC <- H3_CC %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "CCCN Product Code", variable.length = 6)

usethis::use_data(H3_CC, overwrite = TRUE)


## H3 to CP -----------------

H3_CP <- readr::read_csv("data-raw/JobID-42_Concordance_H3_to_CP.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_CP)
H3_CP %>%
  mutate(lgth = nchar(`CPC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_CP <- H3_CP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "CPC Product Code", variable.length = 5)

usethis::use_data(H3_CP, overwrite = TRUE)


## H3 to GP -----------------

H3_GP <- readr::read_csv("data-raw/JobID-43_Concordance_H3_to_GP.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_GP)
H3_GP %>%
  mutate(lgth = nchar(`GTAP Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_GP <- H3_GP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "GTAP Product Code", variable.length = 2)

usethis::use_data(H3_GP, overwrite = TRUE)


## H3 to H0 -----------------

H3_H0 <- readr::read_csv("data-raw/JobID-44_Concordance_H3_to_H0.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_H0)
H3_H0 %>%
  mutate(lgth = nchar(`HS 1988/92 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_H0 <- H3_H0 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

usethis::use_data(H3_H0, overwrite = TRUE)


## H3 to H1 -----------------

H3_H1 <- readr::read_csv("data-raw/JobID-45_Concordance_H3_to_H1.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_H1)
H3_H1 %>%
  mutate(lgth = nchar(`HS 1996 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_H1 <- H3_H1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6)

usethis::use_data(H3_H1, overwrite = TRUE)


## H3 to H2 -----------------

H3_H2 <- readr::read_csv("data-raw/JobID-46_Concordance_H3_to_H2.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_H2)
H3_H2 %>%
  mutate(lgth = nchar(`HS 2002 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_H2 <- H3_H2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6)

usethis::use_data(H3_H2, overwrite = TRUE)


## H3 to I2 -----------------

H3_I2 <- readr::read_csv("data-raw/JobID-47_Concordance_H3_to_I2.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_I2)
H3_I2 %>%
  mutate(lgth = nchar(`ISIC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_I2 <- H3_I2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 2 Product Code", variable.length = 4)

usethis::use_data(H3_I2, overwrite = TRUE)


## H3 to I3 -----------------

H3_I3 <- readr::read_csv("data-raw/JobID-48_Concordance_H3_to_I3.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_I3)
H3_I3 %>%
  mutate(lgth = nchar(`ISIC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_I3 <- H3_I3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4)

usethis::use_data(H3_I3, overwrite = TRUE)


## H3 to IU -----------------

H3_IU <- readr::read_csv("data-raw/JobID-49_Concordance_H3_to_IU.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_IU)
H3_IU %>%
  mutate(lgth = nchar(`SIC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_IU <- H3_IU %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SIC Product Code", variable.length = 4)

usethis::use_data(H3_IU, overwrite = TRUE)


## H3 to MT -----------------

H3_MT <- readr::read_csv("data-raw/JobID-50_Concordance_H3_to_MT.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_MT)
H3_MT %>%
  mutate(lgth = nchar(`MTN Categories Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_MT <- H3_MT %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "MTN Categories Product Code", variable.length = 4)

usethis::use_data(H3_MT, overwrite = TRUE)


## H3 to S1 -----------------

H3_S1 <- readr::read_csv("data-raw/JobID-51_Concordance_H3_to_S1.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_S1)
H3_S1 %>%
  mutate(lgth = nchar(`SITC Revision 1 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_S1 <- H3_S1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SITC Revision 1 Product Code", variable.length = 5)

usethis::use_data(H3_S1, overwrite = TRUE)


## H3 to S2 -----------------

H3_S2 <- readr::read_csv("data-raw/JobID-52_Concordance_H3_to_S2.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_S2)
H3_S2 %>%
  mutate(lgth = nchar(`SITC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_S2 <- H3_S2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SITC Revision 2 Product Code", variable.length = 5)

usethis::use_data(H3_S2, overwrite = TRUE)


## H3 to S3 -----------------

H3_S3 <- readr::read_csv("data-raw/JobID-53_Concordance_H3_to_S3.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_S3)
H3_S3 %>%
  mutate(lgth = nchar(`SITC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_S3 <- H3_S3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SITC Revision 3 Product Code", variable.length = 5)

usethis::use_data(H3_S3, overwrite = TRUE)


## H3 to S4 -----------------

H3_S4 <- readr::read_csv("data-raw/JobID-54_Concordance_H3_to_S4.CSV",
                         col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H3_S4)
H3_S4 %>%
  mutate(lgth = nchar(`SITC Revision 4 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H3_S4 <- H3_S4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SITC Revision 4 Product Code", variable.length = 5)

usethis::use_data(H3_S4, overwrite = TRUE)
