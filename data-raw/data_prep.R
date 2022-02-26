library(comtradeRggregator)


# HS ------------

## HS to BE -----------------

HS_BE <- readr::read_csv("data-raw/JobID-55_Concordance_HS_to_BE.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_BE)
HS_BE %>%
  mutate(lgth = nchar(`BEC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_BE <- HS_BE %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "BEC Product Code", variable.length = 3)

usethis::use_data(HS_BE, overwrite = TRUE)


## HS to BE -----------------

HS_CC <- readr::read_csv("data-raw/JobID-56_Concordance_HS_to_CC.CSV",
  col_types = readr::cols(.default = "c")
)%>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_CC)
HS_CC %>%
  mutate(lgth = nchar(`CCCN Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_CC <- HS_CC %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "CCCN Product Code", variable.length = 6)

usethis::use_data(HS_CC, overwrite = TRUE)


## HS to CP -----------------

HS_CP <- readr::read_csv("data-raw/JobID-57_Concordance_HS_to_CP.CSV",
  col_types = readr::cols(.default = "c")
)%>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_CP)
HS_CP %>%
  mutate(lgth = nchar(`CPC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_CP <- HS_CP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "CPC Product Code", variable.length = 5)

usethis::use_data(HS_CP, overwrite = TRUE)


## HS to GP -----------------

HS_GP <- readr::read_csv("data-raw/JobID-58_Concordance_HS_to_GP.CSV",
  col_types = readr::cols(.default = "c")
)%>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_GP)
HS_GP %>%
  mutate(lgth = nchar(`GTAP Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_GP <- HS_GP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "GTAP Product Code", variable.length = 2)

usethis::use_data(HS_GP, overwrite = TRUE)


## HS to H0 -----------------

HS_H0 <- readr::read_csv("data-raw/JobID-59_Concordance_HS_to_H0.CSV",
  col_types = readr::cols(.default = "c")
)%>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_H0)
HS_H0 %>%
  mutate(lgth = nchar(`HS 1988/92 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_H0 <- HS_H0 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

usethis::use_data(HS_H0, overwrite = TRUE)


## HS to H1 -----------------

HS_H1 <- readr::read_csv("data-raw/JobID-60_Concordance_HS_to_H1.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_H1)
HS_H1 %>%
  mutate(lgth = nchar(`HS 1996 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_H1 <- HS_H1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6)

usethis::use_data(HS_H1, overwrite = TRUE)


## HS to H2 -----------------

HS_H2 <- readr::read_csv("data-raw/JobID-61_Concordance_HS_to_H2.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_H2)
HS_H2 %>%
  mutate(lgth = nchar(`HS 2002 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_H2 <- HS_H2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6)

usethis::use_data(HS_H2, overwrite = TRUE)


## HS to H3 -----------------

HS_H3 <- readr::read_csv("data-raw/JobID-62_Concordance_HS_to_H3.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_H3)
HS_H3 %>%
  mutate(lgth = nchar(`HS 2007 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_H3 <- HS_H3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6)

usethis::use_data(HS_H3, overwrite = TRUE)


## HS to H4 -----------------

HS_H4 <- readxl::read_excel("data-raw/HS combined to HS 2012.xlsx")
colnames(HS_H4)[c(1, 2)] <- c("HS Combined Product Code", "HS Combined Product Description")

## Check var length
colnames(HS_H4)
HS_H4 %>%
  mutate(lgth = nchar(`HS 2012 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_H4 <- HS_H4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6)

usethis::use_data(HS_H4, overwrite = TRUE)


## HS to I2 -----------------

HS_I2 <- readr::read_csv("data-raw/JobID-63_Concordance_HS_to_I2.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_I2)
HS_I2 %>%
  mutate(lgth = nchar(`ISIC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_I2 <- HS_I2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 2 Product Code", variable.length = 4)

usethis::use_data(HS_I2, overwrite = TRUE)


## HS to I3 -----------------

HS_I3 <- readr::read_csv("data-raw/JobID-64_Concordance_HS_to_I3.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_I3)
HS_I3 %>%
  mutate(lgth = nchar(`ISIC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_I3 <- HS_I3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4)

usethis::use_data(HS_I3, overwrite = TRUE)


## HS to IU -----------------

HS_IU <- readr::read_csv("data-raw/JobID-65_Concordance_HS_to_IU.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_IU)
HS_IU %>%
  mutate(lgth = nchar(`SIC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_IU <- HS_IU %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "SIC Product Code", variable.length = 4)

usethis::use_data(HS_IU, overwrite = TRUE)


## HS to MT -----------------

HS_MT <- readr::read_csv("data-raw/JobID-66_Concordance_HS_to_MT.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_MT)
HS_MT %>%
  mutate(lgth = nchar(`MTN Categories Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_MT <- HS_MT %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6) %>%
  add_lzs(variable = "MTN Categories Product Code", variable.length = 4)

usethis::use_data(HS_MT, overwrite = TRUE)


## HS to S1 -----------------

HS_S1 <- readr::read_csv("data-raw/JobID-67_Concordance_HS_to_S1.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_S1)
HS_S1 %>%
  mutate(lgth = nchar(`SITC Revision 1 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_S1 <- HS_S1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6)

usethis::use_data(HS_S1, overwrite = TRUE)


## HS to S2 -----------------

HS_S2 <- readr::read_csv("data-raw/JobID-68_Concordance_HS_to_S2.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_S2)
HS_S2 %>%
  mutate(lgth = nchar(`SITC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_S2 <- HS_S2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6)

usethis::use_data(HS_S2, overwrite = TRUE)


## HS to S3 -----------------

HS_S3 <- readr::read_csv("data-raw/JobID-69_Concordance_HS_to_S3.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_S3)
HS_S3 %>%
  mutate(lgth = nchar(`SITC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_S3 <- HS_S3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6)

usethis::use_data(HS_S3, overwrite = TRUE)


## HS to S4 -----------------

HS_S4 <- readr::read_csv("data-raw/JobID-70_Concordance_HS_to_S4.CSV",
  col_types = readr::cols(.default = "c")
) %>%
  rename(`HS Combined Product Code` = `HS - Combined  Product Code`) %>%
  rename(`HS Combined Product Description` = `HS - Combined  Product Description`)
## Check var length
colnames(HS_S4)
HS_S4 %>%
  mutate(lgth = nchar(`SITC Revision 4 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

HS_S4 <- HS_S4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS Combined Product Code", variable.length = 6)

usethis::use_data(HS_S4, overwrite = TRUE)













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
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

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
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

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
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

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
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

usethis::use_data(H0_S4, overwrite = TRUE)





# H1 ------------


## H1 to BE -----------------

H1_BE <- readr::read_csv("data-raw/JobID-13_Concordance_H1_to_BE.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_BE)
H1_BE %>%
  mutate(lgth = nchar(`BEC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_BE <- H1_BE %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6) %>%
  add_lzs(variable = "BEC Product Code", variable.length = 3)

usethis::use_data(H1_BE, overwrite = TRUE)


## H1 to BE -----------------

H1_CC <- readr::read_csv("data-raw/JobID-14_Concordance_H1_to_CC.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_CC)
H1_CC %>%
  mutate(lgth = nchar(`CCCN Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_CC <- H1_CC %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6) %>%
  add_lzs(variable = "CCCN Product Code", variable.length = 6)

usethis::use_data(H1_CC, overwrite = TRUE)


## H1 to CP -----------------

H1_CP <- readr::read_csv("data-raw/JobID-15_Concordance_H1_to_CP.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_CP)
H1_CP %>%
  mutate(lgth = nchar(`CPC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_CP <- H1_CP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6) %>%
  add_lzs(variable = "CPC Product Code", variable.length = 5)

usethis::use_data(H1_CP, overwrite = TRUE)


## H1 to GP -----------------

H1_GP <- readr::read_csv("data-raw/JobID-16_Concordance_H1_to_GP.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_GP)
H1_GP %>%
  mutate(lgth = nchar(`GTAP Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_GP <- H1_GP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6) %>%
  add_lzs(variable = "GTAP Product Code", variable.length = 2)

usethis::use_data(H1_GP, overwrite = TRUE)


## H1 to H0 -----------------

H1_H0 <- readr::read_csv("data-raw/JobID-17_Concordance_H1_to_H0.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_H0)
H1_H0 %>%
  mutate(lgth = nchar(`HS 1988/92 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_H0 <- H1_H0 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

usethis::use_data(H1_H0, overwrite = TRUE)


## H1 to I2 -----------------

H1_I2 <- readr::read_csv("data-raw/JobID-18_Concordance_H1_to_I2.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_I2)
H1_I2 %>%
  mutate(lgth = nchar(`ISIC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_I2 <- H1_I2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 2 Product Code", variable.length = 4)

usethis::use_data(H1_I2, overwrite = TRUE)


## H1 to I3 -----------------

H1_I3 <- readr::read_csv("data-raw/JobID-19_Concordance_H1_to_I3.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_I3)
H1_I3 %>%
  mutate(lgth = nchar(`ISIC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_I3 <- H1_I3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4)

usethis::use_data(H1_I3, overwrite = TRUE)


## H1 to IU -----------------

H1_IU <- readr::read_csv("data-raw/JobID-20_Concordance_H1_to_IU.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_IU)
H1_IU %>%
  mutate(lgth = nchar(`SIC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_IU <- H1_IU %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SIC Product Code", variable.length = 4)

usethis::use_data(H1_IU, overwrite = TRUE)


## H1 to MT -----------------

H1_MT <- readr::read_csv("data-raw/JobID-21_Concordance_H1_to_MT.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_MT)
H1_MT %>%
  mutate(lgth = nchar(`MTN Categories Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_MT <- H1_MT %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6) %>%
  add_lzs(variable = "MTN Categories Product Code", variable.length = 4)

usethis::use_data(H1_MT, overwrite = TRUE)


## H1 to S1 -----------------

H1_S1 <- readr::read_csv("data-raw/JobID-22_Concordance_H1_to_S1.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_S1)
H1_S1 %>%
  mutate(lgth = nchar(`SITC Revision 1 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_S1 <- H1_S1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6)

usethis::use_data(H1_S1, overwrite = TRUE)


## H1 to S2 -----------------

H1_S2 <- readr::read_csv("data-raw/JobID-23_Concordance_H1_to_S2.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_S2)
H1_S2 %>%
  mutate(lgth = nchar(`SITC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_S2 <- H1_S2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6)

usethis::use_data(H1_S2, overwrite = TRUE)


## H1 to S3 -----------------

H1_S3 <- readr::read_csv("data-raw/JobID-24_Concordance_H1_to_S3.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_S3)
H1_S3 %>%
  mutate(lgth = nchar(`SITC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_S3 <- H1_S3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6)

usethis::use_data(H1_S3, overwrite = TRUE)


## H1 to S4 -----------------

H1_S4 <- readr::read_csv("data-raw/JobID-25_Concordance_H1_to_S4.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H1_S4)
H1_S4 %>%
  mutate(lgth = nchar(`SITC Revision 4 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H1_S4 <- H1_S4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6)

usethis::use_data(H1_S4, overwrite = TRUE)



# H2 ------------


## H2 to BE -----------------

H2_BE <- readr::read_csv("data-raw/JobID-26_Concordance_H2_to_BE.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_BE)
H2_BE %>%
  mutate(lgth = nchar(`BEC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_BE <- H2_BE %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "BEC Product Code", variable.length = 3)

usethis::use_data(H2_BE, overwrite = TRUE)


## H2 to BE -----------------

H2_CC <- readr::read_csv("data-raw/JobID-27_Concordance_H2_to_CC.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_CC)
H2_CC %>%
  mutate(lgth = nchar(`CCCN Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_CC <- H2_CC %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "CCCN Product Code", variable.length = 6)

usethis::use_data(H2_CC, overwrite = TRUE)


## H2 to CP -----------------

H2_CP <- readr::read_csv("data-raw/JobID-28_Concordance_H2_to_CP.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_CP)
H2_CP %>%
  mutate(lgth = nchar(`CPC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_CP <- H2_CP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "CPC Product Code", variable.length = 5)

usethis::use_data(H2_CP, overwrite = TRUE)


## H2 to GP -----------------

H2_GP <- readr::read_csv("data-raw/JobID-29_Concordance_H2_to_GP.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_GP)
H2_GP %>%
  mutate(lgth = nchar(`GTAP Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_GP <- H2_GP %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "GTAP Product Code", variable.length = 2)

usethis::use_data(H2_GP, overwrite = TRUE)


## H2 to H0 -----------------

H2_H0 <- readr::read_csv("data-raw/JobID-30_Concordance_H2_to_H0.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_H0)
H2_H0 %>%
  mutate(lgth = nchar(`HS 1988/92 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_H0 <- H2_H0 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

usethis::use_data(H2_H0, overwrite = TRUE)


## H2 to H1 -----------------

H2_H1 <- readr::read_csv("data-raw/JobID-31_Concordance_H2_to_H1.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_H1)
H2_H1 %>%
  mutate(lgth = nchar(`HS 1996 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_H1 <- H2_H1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6)

usethis::use_data(H2_H1, overwrite = TRUE)


## H2 to I2 -----------------

H2_I2 <- readr::read_csv("data-raw/JobID-32_Concordance_H2_to_I2.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_I2)
H2_I2 %>%
  mutate(lgth = nchar(`ISIC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_I2 <- H2_I2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 2 Product Code", variable.length = 4)

usethis::use_data(H2_I2, overwrite = TRUE)


## H2 to I3 -----------------

H2_I3 <- readr::read_csv("data-raw/JobID-33_Concordance_H2_to_I3.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_I3)
H2_I3 %>%
  mutate(lgth = nchar(`ISIC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_I3 <- H2_I3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4)

usethis::use_data(H2_I3, overwrite = TRUE)


## H2 to IU -----------------

H2_IU <- readr::read_csv("data-raw/JobID-34_Concordance_H2_to_IU.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_IU)
H2_IU %>%
  mutate(lgth = nchar(`SIC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_IU <- H2_IU %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "SIC Product Code", variable.length = 4)

usethis::use_data(H2_IU, overwrite = TRUE)


## H2 to MT -----------------

H2_MT <- readr::read_csv("data-raw/JobID-35_Concordance_H2_to_MT.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_MT)
H2_MT %>%
  mutate(lgth = nchar(`MTN Categories Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_MT <- H2_MT %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6) %>%
  add_lzs(variable = "MTN Categories Product Code", variable.length = 4)

usethis::use_data(H2_MT, overwrite = TRUE)


## H2 to S1 -----------------

H2_S1 <- readr::read_csv("data-raw/JobID-36_Concordance_H2_to_S1.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_S1)
H2_S1 %>%
  mutate(lgth = nchar(`SITC Revision 1 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_S1 <- H2_S1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6)

usethis::use_data(H2_S1, overwrite = TRUE)


## H2 to S2 -----------------

H2_S2 <- readr::read_csv("data-raw/JobID-37_Concordance_H2_to_S2.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_S2)
H2_S2 %>%
  mutate(lgth = nchar(`SITC Revision 2 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_S2 <- H2_S2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6)

usethis::use_data(H2_S2, overwrite = TRUE)


## H2 to S3 -----------------

H2_S3 <- readr::read_csv("data-raw/JobID-38_Concordance_H2_to_S3.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_S3)
H2_S3 %>%
  mutate(lgth = nchar(`SITC Revision 3 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_S3 <- H2_S3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6)

usethis::use_data(H2_S3, overwrite = TRUE)


## H2 to S4 -----------------

H2_S4 <- readr::read_csv("data-raw/JobID-39_Concordance_H2_to_S4.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(H2_S4)
H2_S4 %>%
  mutate(lgth = nchar(`SITC Revision 4 Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

H2_S4 <- H2_S4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6)

usethis::use_data(H2_S4, overwrite = TRUE)


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
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6)

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
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6)

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
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6)

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
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6)

usethis::use_data(H3_S4, overwrite = TRUE)



# H4 ------------

## H4 to BE4   -----------------

H4_BE <- readxl::read_excel("data-raw/HS 2012 to BEC Correlation and conversion tables.xls",
  skip = 5
) %>%
  select(
    `HS 2012 Product Code` = `HS 2012`,
    `BEC 4 Product Code` = `BEC`
  )

H4_BE <- H4_BE %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6) %>%
  add_lzs(variable = "BEC 4 Product Code", variable.length = 3)

usethis::use_data(H4_BE, overwrite = TRUE)


## H4 to BE5   -----------------

H4_BE5 <- readxl::read_excel("data-raw/HS2012-17-BEC5 -- 08 Nov 2018.xlsx") %>%
  select(
    `HS 2012 Product Code` = `HS6`,
    `HS 2012 Product Description` = `HS6Desc`,
    `BEC 5 Product Category` = `BEC5Category`,
    `BEC 5 Code` = `BEC5Code1`,
    `BEC 5 End-user Dimension` = `BEC5EndUse`,
    `BEC 5 Processing Dimension` = `BEC5Processing`,
    `BEC 5 Specification Dimension` = `BEC5Specification`,
    `BEC 5 Durability Dimension` = `BEC5Durability`
  ) %>%
  mutate(
    `BEC 5 End-user Dimension` = ifelse(`BEC 5 End-user Dimension` == "INT", "INTERMEDIATE CONSUMPTION", `BEC 5 End-user Dimension`),
    `BEC 5 End-user Dimension` = ifelse(`BEC 5 End-user Dimension` == "CAP", "GROSS FIXED CAPITAL FORMATION", `BEC 5 End-user Dimension`),
    `BEC 5 End-user Dimension` = ifelse(`BEC 5 End-user Dimension` == "CONS", "FINAL CONSUMPTION", `BEC 5 End-user Dimension`)
  )

usethis::use_data(H4_BE5, overwrite = TRUE)



## H4 to CP -----------------

H4_CP <- readxl::read_excel("data-raw/HS2012-17-BEC5 -- 08 Nov 2018.xlsx") %>%
  select(
    `HS 2012 Product Code` = `HS6`,
    `HS 2012 Product Description` = `HS6Desc`,
    `CPC Product Code` = `CPC1`,
    `CPC Product Description` = `CPCdesc`)

usethis::use_data(H4_CP, overwrite = TRUE)


## H4 to GP -----------------

H4_GP <- readxl::read_excel("data-raw/HS2012-17-BEC5 -- 08 Nov 2018.xlsx") %>%
  select(
    `HS 2012 Product Code` = `HS6`,
    `HS 2012 Product Description` = `HS6Desc`,
    `GTAP Product Code` = `GTAPcode`,
    `GTAP Product` = `GTAP`,
    `GTAP Product Description` = `GTAPdesc`)

usethis::use_data(H4_GP, overwrite = TRUE)



# H4 to H0 -----------------

H4_H0 <- readxl::read_excel("data-raw/HS 2012 to HS 1992 Correlation and conversion tables.xls",
  skip = 5
) %>%
  select(
    `HS 2012 Product Code` = `HS 2012`,
    `HS 1988/92 Product Code` = `HS 1992`
  )

H4_H0 <- H4_H0 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

## Add Product Description
H4_H0 <- H4_H0 %>%
  left_join(
    HS_H0 %>%
      distinct(`HS 1988/92 Product Code`, `HS 1988/92 Product Description`),
    by = "HS 1988/92 Product Code"
  ) %>%
  left_join(
    H4_CP %>%
      distinct(`HS 2012 Product Code`, `HS 2012 Product Description`),
    by = "HS 2012 Product Code"
  ) %>%
  select(starts_with("HS 20"), starts_with("HS 19"))

usethis::use_data(H4_H0, overwrite = TRUE)

## H4 to H1 -----------------

H4_H1 <- readxl::read_excel("data-raw/HS 2012 to HS 1996 Correlation and conversion tables.xls",
  skip = 5
) %>%
  select(
    `HS 2012 Product Code` = `HS 2012`,
    `HS 1996 Product Code` = `HS 1996`
  )

H4_H1 <- H4_H1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6)

## Add Product Description
H4_H1 <- H4_H1 %>%
  left_join(
    HS_H1 %>%
      distinct(`HS 1996 Product Code`, `HS 1996 Product Description`),
    by = "HS 1996 Product Code"
  ) %>%
  left_join(
    H4_CP %>%
      distinct(`HS 2012 Product Code`, `HS 2012 Product Description`),
    by = "HS 2012 Product Code"
  ) %>%
  select(starts_with("HS 20"), starts_with("HS 19"))

usethis::use_data(H4_H1, overwrite = TRUE)

## H4 to H2 -----------------

H4_H2 <- readxl::read_excel("data-raw/HS 2012 to HS 2002 Correlation and conversion tables.xls",
  skip = 5
) %>%
  select(
    `HS 2012 Product Code` = `HS 2012`,
    `HS 2002 Product Code` = `HS 2002`
  )

H4_H2 <- H4_H2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6)

## Add Product Description
H4_H2 <- H4_H2 %>%
  left_join(
    HS_H2 %>%
      distinct(`HS 2002 Product Code`, `HS 2002 Product Description`),
    by = "HS 2002 Product Code"
  ) %>%
  left_join(
    H4_CP %>%
      distinct(`HS 2012 Product Code`, `HS 2012 Product Description`),
    by = "HS 2012 Product Code"
  ) %>%
  select(starts_with("HS 2012"), starts_with("HS 2002"))

usethis::use_data(H4_H2, overwrite = TRUE)

## H4 to H3 -----------------

H4_H3 <- readxl::read_excel("data-raw/HS 2012 to HS 2007 Correlation and conversion tables.xls",
  sheet = "Conversion HS12-HS07", skip = 1
) %>%
  select(
    `HS 2012 Product Code` = `HS 2012`,
    `HS 2007 Product Code` = `HS 2007`
  )

H4_H3 <- H4_H3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6)

## Add Product Description
H4_H3 <- H4_H3 %>%
  left_join(
    HS_H3 %>%
      distinct(`HS 2007 Product Code`, `HS 2007 Product Description`),
    by = "HS 2007 Product Code"
  ) %>%
  left_join(
    H4_CP %>%
      distinct(`HS 2012 Product Code`, `HS 2012 Product Description`),
    by = "HS 2012 Product Code"
  ) %>%
  select(starts_with("HS 2012"), starts_with("HS 2007"))

usethis::use_data(H4_H3, overwrite = TRUE)


## H4 to I3.1   -----------------

H4_I31 <- readxl::read_excel("data-raw/HS2012-17-BEC5 -- 08 Nov 2018.xlsx") %>%
  select(
    `HS 2012 Product Code` = `HS6`,
    `HS 2012 Product Description` = `HS6Desc`,
    `ISIC Revision 3.1 Product Code` = `i3`,
    `ISIC Revision 3.1 Product Description` = `i31Desc`
  )

usethis::use_data(H4_I31, overwrite = TRUE)


## H4 to I4   -----------------

H4_I4 <- readxl::read_excel("data-raw/HS2012-17-BEC5 -- 08 Nov 2018.xlsx") %>%
  select(
    `HS 2012 Product Code` = `HS6`,
    `HS 2012 Product Description` = `HS6Desc`,
    `ISIC Revision 4 Product Code` = `i4`,
    `ISIC Revision 4 Product Description` = `i4Desc`
  )

usethis::use_data(H4_I4, overwrite = TRUE)



## H4 to S1 -----------------

H4_S1 <- readxl::read_excel("data-raw/HS 2012 to SITC1 Correlation and conversion tables.xls",
  skip = 5
) %>%
  select(
    `HS 2012 Product Code` = `HS 2012`,
    `SITC Revision 1 Product Code` = `SITC1`
  )

H4_S1 <- H4_S1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6)

## Add Product Description
H4_S1 <- H4_S1 %>%
  left_join(
    HS_S1 %>%
      distinct(`SITC Revision 1 Product Code`, `SITC Revision 1 Product Description`),
    by = "SITC Revision 1 Product Code"
  ) %>%
  left_join(
    H4_CP %>%
      distinct(`HS 2012 Product Code`, `HS 2012 Product Description`),
    by = "HS 2012 Product Code"
  ) %>%
  select(starts_with("HS 2012"), starts_with("SITC"))

usethis::use_data(H4_S1, overwrite = TRUE)

## H4 to S2 -----------------

H4_S2 <- readxl::read_excel("data-raw/HS 2012 to SITC2 Correlation and conversion tables.xls",
  skip = 5
) %>%
  select(
    `HS 2012 Product Code` = `HS 2012`,
    `SITC Revision 2 Product Code` = `SITC2`
  )

H4_S2 <- H4_S2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6)

## Add Product Description
H4_S2 <- H4_S2 %>%
  left_join(
    HS_S2 %>%
      distinct(`SITC Revision 2 Product Code`, `SITC Revision 2 Product Description`),
    by = "SITC Revision 2 Product Code"
  ) %>%
  left_join(
    H4_CP %>%
      distinct(`HS 2012 Product Code`, `HS 2012 Product Description`),
    by = "HS 2012 Product Code"
  ) %>%
  select(starts_with("HS 2012"), starts_with("SITC"))

usethis::use_data(H4_S2, overwrite = TRUE)


## H4 to S3 -----------------

H4_S3 <- readxl::read_excel("data-raw/HS 2012 to SITC3 Correlation and conversion tables.xls",
  skip = 5
) %>%
  select(
    `HS 2012 Product Code` = `HS 2012`,
    `SITC Revision 3 Product Code` = `SITC3`
  )

H4_S3 <- H4_S3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6)

## Add Product Description
H4_S3 <- H4_S3 %>%
  left_join(
    HS_S3 %>%
      distinct(`SITC Revision 3 Product Code`, `SITC Revision 3 Product Description`),
    by = "SITC Revision 3 Product Code"
  ) %>%
  left_join(
    H4_CP %>%
      distinct(`HS 2012 Product Code`, `HS 2012 Product Description`),
    by = "HS 2012 Product Code"
  ) %>%
  select(starts_with("HS 2012"), starts_with("SITC"))

usethis::use_data(H4_S3, overwrite = TRUE)

## H4 to S4 -----------------

H4_S4 <- readxl::read_excel("data-raw/HS 2012 to SITC Rev.4 Correlation and conversion tables.xls",
  skip = 1
) %>%
  select(
    `HS 2012 Product Code` = `HS 2012`,
    `SITC Revision 4 Product Code` = `SITC Rev. 4`
  ) %>%
  mutate(
    `HS 2012 Product Code` = stringr::str_remove(`HS 2012 Product Code`, pattern = "\\."),
    `SITC Revision 4 Product Code` = stringr::str_remove(`SITC Revision 4 Product Code`, pattern = "\\.")
  )

H4_S4 <- H4_S4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6)

## Add Product Description
H4_S4 <- H4_S4 %>%
  left_join(
    HS_S4 %>%
      distinct(`SITC Revision 4 Product Code`, `SITC Revision 4 Product Description`),
    by = "SITC Revision 4 Product Code"
  ) %>%
  left_join(
    H4_CP %>%
      distinct(`HS 2012 Product Code`, `HS 2012 Product Description`),
    by = "HS 2012 Product Code"
  ) %>%
  select(starts_with("HS 2012"), starts_with("SITC"))

usethis::use_data(H4_S4, overwrite = TRUE)


# H5 ------------

## H5 to BE -----------------

H5_BE <- readxl::read_excel("data-raw/HS2017toBECConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `BEC 4 Product Code` = `To BEC`
  )

H5_BE <- H5_BE %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6) %>%
  add_lzs(variable = "BEC 4 Product Code", variable.length = 3)

usethis::use_data(H5_BE, overwrite = TRUE)


## H5 to H0 -----------------

H5_H0 <- readxl::read_excel("data-raw/HS2017toHS1992ConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `HS 1988/92 Product Code` = `To HS 1992`
  )

H5_H0 <- H5_H0 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1988/92 Product Code", variable.length = 6)

## Add Product Description
H5_H0 <- H5_H0 %>%
  left_join(
    HS_H0 %>%
      distinct(`HS 1988/92 Product Code`, `HS 1988/92 Product Description`),
    by = "HS 1988/92 Product Code"
  ) %>%
  select(starts_with("HS 20"), starts_with("HS 19"))

usethis::use_data(H5_H0, overwrite = TRUE)

## H5 to H1 -----------------

H5_H1 <- readxl::read_excel("data-raw/HS2017toHS1996ConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `HS 1996 Product Code` = `To HS 1996`
  )

H5_H1 <- H5_H1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 1996 Product Code", variable.length = 6)

## Add Product Description
H5_H1 <- H5_H1 %>%
  left_join(
    HS_H1 %>%
      distinct(`HS 1996 Product Code`, `HS 1996 Product Description`),
    by = "HS 1996 Product Code"
  ) %>%
  select(starts_with("HS 20"), starts_with("HS 19"))

usethis::use_data(H5_H1, overwrite = TRUE)

## H5 to H2 -----------------

H5_H2 <- readxl::read_excel("data-raw/HS2017toHS2002ConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `HS 2002 Product Code` = `To HS 2002`
  )

H5_H2 <- H5_H2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 2002 Product Code", variable.length = 6)

## Add Product Description
H5_H2 <- H5_H2 %>%
  left_join(
    HS_H2 %>%
      distinct(`HS 2002 Product Code`, `HS 2002 Product Description`),
    by = "HS 2002 Product Code"
  ) %>%
  select(starts_with("HS 2017"), starts_with("HS 2002"))

usethis::use_data(H5_H2, overwrite = TRUE)

## H5 to H3 -----------------

H5_H3 <- readxl::read_excel("data-raw/HS2017toHS2007ConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `HS 2007 Product Code` = `To HS 2007`
  )

H5_H3 <- H5_H3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 2007 Product Code", variable.length = 6)

## Add Product Description
H5_H3 <- H5_H3 %>%
  left_join(
    HS_H3 %>%
      distinct(`HS 2007 Product Code`, `HS 2007 Product Description`),
    by = "HS 2007 Product Code"
  ) %>%
  select(starts_with("HS 2017"), starts_with("HS 2007"))

usethis::use_data(H5_H3, overwrite = TRUE)

## H5 to H4 -----------------

H5_H4 <- readxl::read_excel("data-raw/HS2017toHS2012ConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `HS 2012 Product Code` = `To HS 2012`
  )

H5_H4 <- H5_H4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6) %>%
  add_lzs(variable = "HS 2012 Product Code", variable.length = 6)

## Add Product Description
H5_H4 <- H5_H4 %>%
  left_join(
    H4_CP %>%
      distinct(`HS 2012 Product Code`, `HS 2012 Product Description`),
    by = "HS 2012 Product Code"
  ) %>%
  select(starts_with("HS 2017"), starts_with("HS 2012"))

usethis::use_data(H5_H4, overwrite = TRUE)

## H5 to S1 -----------------

H5_S1 <- readxl::read_excel("data-raw/HS2017toSITC1ConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `SITC Revision 1 Product Code` = `To SITC Rev. 1`
  )

H5_S1 <- H5_S1 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6)

## Add Product Description
H5_S1 <- H5_S1 %>%
  left_join(
    HS_S1 %>%
      distinct(`SITC Revision 1 Product Code`, `SITC Revision 1 Product Description`),
    by = "SITC Revision 1 Product Code"
  ) %>%
  select(starts_with("HS 2017"), starts_with("SITC"))

usethis::use_data(H5_S1, overwrite = TRUE)

## H5 to S2 -----------------

H5_S2 <- readxl::read_excel("data-raw/HS2017toSITC2ConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `SITC Revision 2 Product Code` = `To SITC Rev. 2`
  )

H5_S2 <- H5_S2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6)

## Add Product Description
H5_S2 <- H5_S2 %>%
  left_join(
    HS_S2 %>%
      distinct(`SITC Revision 2 Product Code`, `SITC Revision 2 Product Description`),
    by = "SITC Revision 2 Product Code"
  ) %>%
  select(starts_with("HS 2017"), starts_with("SITC"))

usethis::use_data(H5_S2, overwrite = TRUE)

## H5 to S3 -----------------

H5_S3 <- readxl::read_excel("data-raw/HS2017toSITC3ConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `SITC Revision 3 Product Code` = `To SITC Rev. 3`
  )

H5_S3 <- H5_S3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6)

## Add Product Description
H5_S3 <- H5_S3 %>%
  left_join(
    HS_S3 %>%
      distinct(`SITC Revision 3 Product Code`, `SITC Revision 3 Product Description`),
    by = "SITC Revision 3 Product Code"
  ) %>%
  select(starts_with("HS 2017"), starts_with("SITC"))

usethis::use_data(H5_S3, overwrite = TRUE)

## H5 to S4 -----------------

H5_S4 <- readxl::read_excel("data-raw/HS2017toSITC4ConversionAndCorrelationTables.xlsx") %>%
  select(
    `HS 2017 Product Code` = `From HS 2017`,
    `SITC Revision 4 Product Code` = `To SITC Rev. 4`
  )

H5_S4 <- H5_S4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "HS 2017 Product Code", variable.length = 6)

## Add Product Description
H5_S4 <- H5_S4 %>%
  left_join(
    HS_S4 %>%
      distinct(`SITC Revision 4 Product Code`, `SITC Revision 4 Product Description`),
    by = "SITC Revision 4 Product Code"
  ) %>%
  select(starts_with("HS 2017"), starts_with("SITC"))

usethis::use_data(H5_S4, overwrite = TRUE)


# S1 ------------

## S1 to BE -----------------

S1_BE <- readr::read_csv("data-raw/JobID-71_Concordance_S1_to_BE.CSV",
  col_types = readr::cols(.default = "c")
)
## Check var length
colnames(S1_BE)
S1_BE %>%
  mutate(lgth = nchar(`BEC Product Code`)) %>%
  distinct(lgth) %>%
  arrange(desc(lgth)) %>%
  slice(1) %>%
  pull()

S1_BE <- S1_BE %>%
  ## Add leading zeros to codes
  add_lzs(variable = "BEC Product Code", variable.length = 3)

usethis::use_data(S1_BE, overwrite = TRUE)


# S2 ------------

## S2 to BE -----------------

S2_BE <- readr::read_csv("data-raw/JobID-72_Concordance_S2_to_BE.CSV",
  col_types = readr::cols(.default = "c")
)

S2_BE <- S2_BE %>%
  ## Add leading zeros to codes
  add_lzs(variable = "BEC Product Code", variable.length = 3)

usethis::use_data(S2_BE, overwrite = TRUE)

## S2 to I2 -----------------

S2_I2 <- readr::read_csv("data-raw/JobID-73_Concordance_S2_to_I2.CSV",
  col_types = readr::cols(.default = "c")
)

S2_I2 <- S2_I2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "ISIC Revision 2 Product Code", variable.length = 4)

usethis::use_data(S2_I2, overwrite = TRUE)

## S2 to S1 -----------------

S2_S1 <- readxl::read_excel("data-raw/SITC2 to SITC1 Conversion and Correlation Tables.xls",
  sheet = "Correlation Table", skip = 4
) %>%
  select(
    `SITC Revision 2 Product Code` = `SITC, Rev. 2`,
    `SITC Revision 1 Product Code` = `SITC, Rev. 1`
  ) %>%
  slice(-1)

S2_S1 <- S2_S1 %>%
  left_join(
    HS_S1 %>%
      distinct(`SITC Revision 1 Product Code`, `SITC Revision 1 Product Description`),
    by = "SITC Revision 1 Product Code"
  ) %>%
  left_join(
    HS_S2 %>%
      distinct(`SITC Revision 2 Product Code`, `SITC Revision 2 Product Description`),
    by = "SITC Revision 2 Product Code"
  ) %>%
  select(starts_with("SITC Revision 2"), starts_with("SITC Revision 1"))

usethis::use_data(S2_S1, overwrite = TRUE)


# S3 ------------

## S3 to S1 -----------------

S3_S1 <- readxl::read_excel("data-raw/SITC3 to SITC1 Conversion and Correlation Tables.xls",
  skip = 4
) %>%
  select(
    `SITC Revision 3 Product Code` = `SITC, Rev. 3`,
    `SITC Revision 1 Product Code` = `SITC, Rev. 1`
  ) %>%
  slice(-1)

S3_S1 <- S3_S1 %>%
  left_join(
    HS_S1 %>%
      distinct(`SITC Revision 1 Product Code`, `SITC Revision 1 Product Description`),
    by = "SITC Revision 1 Product Code"
  ) %>%
  left_join(
    HS_S3 %>%
      distinct(`SITC Revision 3 Product Code`, `SITC Revision 3 Product Description`),
    by = "SITC Revision 3 Product Code"
  ) %>%
  select(starts_with("SITC Revision 3"), starts_with("SITC Revision 1"))

usethis::use_data(S3_S1, overwrite = TRUE)

## S3 to S2 -----------------

S3_S2 <- readxl::read_excel("data-raw/SITC3 to SITC2 Conversion and Correlation Tables.xls",
  skip = 4
) %>%
  select(
    `SITC Revision 3 Product Code` = `SITC, Rev. 3`,
    `SITC Revision 2 Product Code` = `SITC, Rev. 2`
  ) %>%
  slice(-1)

S3_S2 <- S3_S2 %>%
  left_join(
    HS_S2 %>%
      distinct(`SITC Revision 2 Product Code`, `SITC Revision 2 Product Description`),
    by = "SITC Revision 2 Product Code"
  ) %>%
  left_join(
    HS_S3 %>%
      distinct(`SITC Revision 3 Product Code`, `SITC Revision 3 Product Description`),
    by = "SITC Revision 3 Product Code"
  ) %>%
  select(starts_with("SITC Revision 3"), starts_with("SITC Revision 2"))

usethis::use_data(S3_S2, overwrite = TRUE)

# I2 ------------

## I2 to I3 -----------------

I2_I3 <- readr::read_csv("data-raw/ISIC2-ISIC3.txt",
  col_types = readr::cols(.default = "c")
) %>%
  select(
    `ISIC Revision 2 Product Code` = ISIC2,
    `ISIC Revision 3 Product Code` = ISIC3,
    `ISIC Revision 3 Product Description` = Detail
  )

I2_I3 <- I2_I3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "ISIC Revision 2 Product Code", variable.length = 4) %>%
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4)

usethis::use_data(I2_I3, overwrite = TRUE)

## I2 to I31 -----------------

I2_I31 <- readr::read_csv("data-raw/ISIC_Rev_2-ISIC_Rev_3_1_correspondence.txt",
  col_types = readr::cols(.default = "c")
) %>%
  select(
    `ISIC Revision 2 Product Code` = Rev2,
    `ISIC Revision 3.1 Product Code` = Rev31,
    `ISIC Revision 3.1 Product Description` = Activity
  )

I2_I31 <- I2_I31 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "ISIC Revision 2 Product Code", variable.length = 4) %>%
  add_lzs(variable = "ISIC Revision 3.1 Product Code", variable.length = 4)

usethis::use_data(I2_I31, overwrite = TRUE)

# I3 ------------

## I3 to I2 -----------------

I3_I2 <- readr::read_csv("data-raw/ISIC3-ISIC2.txt",
  col_types = readr::cols(.default = "c")
) %>%
  select(
    `ISIC Revision 3 Product Code` = ISIC3,
    `ISIC Revision 2 Product Code` = ISIC2,
    `ISIC Revision 2 Product Description` = Detail
  )

I3_I2 <- I3_I2 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "ISIC Revision 2 Product Code", variable.length = 4) %>%
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4)

usethis::use_data(I3_I2, overwrite = TRUE)

## I3 to I31 -----------------

I3_I31 <- readr::read_csv("data-raw/ISIC_Rev_3-ISIC_Rev_3_1_correspondence.txt",
  col_types = readr::cols(.default = "c")
) %>%
  select(
    `ISIC Revision 3 Product Code` = Rev3,
    `ISIC Revision 3.1 Product Code` = Rev31,
    `ISIC Revision 3.1 Product Description` = Activity
  )

I3_I31 <- I3_I31 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4) %>%
  add_lzs(variable = "ISIC Revision 3.1 Product Code", variable.length = 4)

usethis::use_data(I3_I31, overwrite = TRUE)

# I31 ------------

## I31 to I4 -----------------

I31_I4 <- readr::read_csv("data-raw/ISIC31_ISIC4.txt",
  col_types = readr::cols(.default = "c")
) %>%
  select(
    `ISIC Revision 3.1 Product Code` = ISIC31code,
    `ISIC Revision 4 Product Code` = ISIC4code,
    `ISIC Revision 4 Product Description` = Detail
  )

I31_I4 <- I31_I4 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "ISIC Revision 3.1 Product Code", variable.length = 4) %>%
  add_lzs(variable = "ISIC Revision 4 Product Code", variable.length = 4)

usethis::use_data(I31_I4, overwrite = TRUE)

## I31 to I3 -----------------

I31_I3 <- readr::read_csv("data-raw/ISIC_Rev_31-ISIC_Rev_3_correspondence.txt",
  col_types = readr::cols(.default = "c")
) %>%
  select(
    `ISIC Revision 3.1 Product Code` = Rev31,
    `ISIC Revision 3 Product Code` = Rev3,
    `ISIC Revision 3 Product Description` = Activity
  )

I31_I3 <- I31_I3 %>%
  ## Add leading zeros to codes
  add_lzs(variable = "ISIC Revision 3 Product Code", variable.length = 4) %>%
  add_lzs(variable = "ISIC Revision 3.1 Product Code", variable.length = 4)

usethis::use_data(I31_I3, overwrite = TRUE)
