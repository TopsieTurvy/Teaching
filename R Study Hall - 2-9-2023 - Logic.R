## R Study Hall 
# Date: 2/9/2023
# Topic: Creating Systems to Validate Data
# Teacher: Nicole Turvey

#First, let's read in some packages
list.of.packages <- c("DBI","googlesheets4","tidyverse","magrittr","reshape2","tidyr","janitor","ggplot2","dplyr","anytime","lubridate","epiDisplay","eeptools","covidr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

purrr::walk(list.of.packages, ~library(package = .x, character.only = TRUE,
                                       logical.return = TRUE,
                                       warn.conflicts = FALSE))
rm(list = ls()[grepl("packages", ls())])

#Pull in dates
result <- read.csv(file = "C:/Users/naturvey/Downloads/cophs.csv")

#Now, let's make a variable for today's date -- that will be important later!
today <- Sys.Date()

#Let's start cleaning our file! But first, let's talk through logic

#Pull out improper dates 

##Hospital Admission
result <- result %>% mutate(hospital_admission_date_issue = case_when(hospital_admission_date <= '2020-01-01' ~ TRUE,
                                                                      hospital_admission_date > today ~ TRUE,
                                                                      hospital_admission_date = NA ~ TRUE))

##discharge_transfer_death_date
result <- result %>% mutate(discharge_transfer_death_date_issue = case_when(discharge_transfer_death_date <= '2020-01-01' ~ TRUE,
                                                                            discharge_transfer_death_date > today ~ TRUE,
                                                                            discharge_transfer_death_date < hospital_admission_date ~ TRUE))

##discharge_transfer_death_date
result <- result %>% mutate(dob_issue = case_when(dob >= today ~ TRUE, 
                                                  dob > hospital_admission_date ~ TRUE,
                                                  dob < '1900-01-01' ~ TRUE))

