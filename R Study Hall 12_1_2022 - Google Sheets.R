## R Study Hall 
# Date: 12/2/2022
# Topic: Using Google Sheets and R
# Teacher: Nicole Turvey

#Install your packages!
install.packages(c("googlesheets4","googledrive", "dplyr"))
library(googlesheets4)
library(googledrive)
library(dplyr)

#Let R read your google sheets
drive_auth()

#Read in the URL & Data of our testing google sheet
url <- "https://docs.google.com/spreadsheets/d/1M7ODvNdqNqe33duS2pRhL_aWCakhWbVkbpYfUqaXAIk/edit?usp=sharing"
worldcup <- read_sheet(url,sheet = "WorldCupForecasts")

#What if we want to shave down the number of columns we look at?
worldcup <- worldcup %>% dplyr::select(team,spi)

#Now export this back to the google sheet into a new tab called "WorldCupPSI"
sheet_write(worldcup, ss = url, sheet = "Nicole")

#There are many ways to use this package and most are outlined at the following URL:
#https://googlesheets4.tidyverse.org/articles/write-sheets.html