#************************************************************************
# Title: import_ALSDE_2018-2019_SIR.R
# Author: William Murrah
# Description: description
# Created: Sunday, 21 February 2021
# R version: R version 4.0.4 (2021-02-15)
# Project(working) directory: /Users/wmm0017/Projects/QMER/ALSDEsystem
#************************************************************************

library(readxl)
dirpath <- "~/qmer/source_data/ALSDE/"
filename <- "2018-2019 SIR Report (by System-School).xlsx"


# Get County/City level info
get_countyInfo <- function(dirpath, filename, sheetnum){
  countyInfo <- read_xlsx(paste0(dirpath, filename), 
                          sheet = sheetnum, 
                          skip = 5, 
                          col_names = TRUE,
                          n_max = 1)
  return(countyInfo)
}


get_countydf <- function(dirpath, filename, sheetmin, sheetmax){
  df <- data.frame()
  for(i in sheetmin:sheetmax){
    df[i, ] <- get_countyInfo(dirpath, filename, i)
  }
  return(df)
}

df1_5 <- get_countydf(dirpath, filename, sheetmin = 1, sheetmax = 5)



c1 <- get_countyInfo(dirpath = dirpath, filename = filename, 1)



sir1819List <- list()
for(i in 1:5){
  sir1819List[[i]] <- read_xlsx(path = paste0(dirpath, filename),
                              sheet = i, skip = 4)
}


L1 <- sir1819List[[1]]


l1 <- read_xlsx(path = paste0(dirpath, "2018-2019 SIR Report (by System-School).xlsx"),
                sheet = 1, skip = 4)
