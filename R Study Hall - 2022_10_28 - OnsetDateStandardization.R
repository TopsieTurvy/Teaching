## R Study Hall 
# Date: 10/28/2022
# Topic: Making an Onset Date
# Teacher: Nicole Turvey

# First, let's load some packages (thanks, Julia for your nifty package load)
list.of.packages <- c("DBI", "svDialogs","odbc","readxl","tidyverse","janitor","tidyselect","dplyr","lubridate", "magrittr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
rm(list = ls()[grepl("packages", ls())])

pkgs <- c("DBI",
          "svDialogs",
          "odbc",
          "readxl",
          "tidyverse",
          "janitor",
          "tidyselect",
          "dplyr",
          "lubridate",
          "magrittr")
purrr::walk(pkgs, ~library(package = .x, character.only = TRUE,
                           logical.return = TRUE,
                           warn.conflicts = FALSE))
rm(pkgs)

# Pull in Fake Data
result <- read_excel("R Study Hall 10_28_2022- Onset Date Standardization/OnsetData_2022-10-28.xlsx")

# mutate types and filter
result <- result %>% mutate(ReportedDate=as.Date(ReportedDate, format = "%Y-%m-%d"))
result <- result %>% mutate(CollectionDate=as.Date(CollectionDate, format = "%Y-%m-%d"))

# Select Collection Date
# Why do we use 90 days?
result %<>% mutate(datediff = difftime(ReportedDate, CollectionDate, units ='days'))
result <- result %>%
  filter(datediff >= 0 | is.na(datediff), datediff < 90)

# Associate only one test per Event ID
# What does Slice_Min do? (Thanks, Shelby!)
# Why do we look for the minimum collection?
result <- result %>%
  group_by(EventID) %>%
  slice_min(CollectionDate)

# Mutate from POSICCt to as.date
result <- result %>% mutate(ReportedDate=as.Date(ReportedDate, format = "%Y-%m-%d"))
result <- result %>% mutate(OnsetDate=as.Date(OnsetDate, format = "%Y-%m-%d"))
result <- result %>% mutate(CollectionDate=as.Date(CollectionDate, format = "%Y-%m-%d"))

# If symptom onset date is NA, then select specimen collection date

result <- result %>% mutate(onset = if_else(is.na(OnsetDate), CollectionDate, OnsetDate))

# If specimen collection date is null, then select server entry date

result <- result %>% mutate(onset = if_else(is.na(onset), ReportedDate, onset))

# Dedupe by Event ID
# When would we not want to do this? 
# What could we do instead?
result <- result %>% distinct(EventID, .keep_all = TRUE)

