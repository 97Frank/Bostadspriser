list.of.packages <- c("tidyverse", "haven", "readxl", "officer", "ggrepel",
                 "systemfonts", "rvest", "lubridate", "hrbrthemes")


new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]


if(length(new.packages)) {
  install.packages(new.packages)
}


lapply(list.of.packages, require, character.only = TRUE)



rm(list.of.packages)
rm(new.packages)