## R Study Hall 
# Date: 2/3/2023
# Topic: Grouping your data by category, date, etc.
# Teacher: Nicole Turvey

# Let's bring in the dplyr package!
library(dplyr)
library(anytime)
library(tidyverse)
library(lubridate)

#Now, let's read in our dataset of priority pop addresses!
library(readr)
data <- read_csv("~/PriorityPopsList.csv")

#What if you want to count up the number of priority addresses in each county?
data_county <- data %>% dplyr::group_by(County) %>% dplyr::summarise(count = n())

#What about the number of skilled nursing facilities per county?
data_nursing <- data %>% dplyr::group_by(County,`Skilled Nursing`) %>% dplyr::summarise(count = n()) %>% filter(`Skilled Nursing` == "TRUE")


#what if I want to know the unique number of addresses in this dataset?
data_address <- data %>% group_by(`County`) %>% dplyr::summarise(`Full Address` = n_distinct(`Full Address`))

#How would data_address and data_county possibly differ in results?

#Bonus, let's write out each category of county into it's own CSV!
data %>%
  dplyr::group_by(County) %>%
  dplyr::group_walk(~ write_csv(.x, paste0(.y$County, ".csv")))

#Let's look at dates!
#Read in dates file
library(readxl)
dates <- read_excel("~/Dates.xlsx")

#Create a week start date
dates <- dates %>% mutate(hospital_admission_date = anydate(hospital_admission_date), week = floor_date(hospital_admission_date, unit = 'week'))

#Now group by that week
dates_week <- dates %>% group_by(week) %>% dplyr::summarise(count = n())

