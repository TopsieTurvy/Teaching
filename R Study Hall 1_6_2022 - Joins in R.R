### R Study Hall 
# Date: 1/6/2022
# Topic: Joins in R

#First, let's grab some packages
library(readxl)

#Now, read in your datasets
Gavin <- read_excel("R Study Hall 1_6_2022 - Joins in R/GavinsNYR.xlsx")
Nicole <- read_excel("R Study Hall 1_6_2022 - Joins in R/NicolesNYR.xlsx")

#First, I want to join these tables

#Inner joins

#Using merge() function:  merge() function takes Gavin and Nicole as an arugement and 
#returns only the rows in which the left (Gavin) table have matching keys in the right (Nicole) table.
innerjoin <- merge(Gavin, Nicole, by = "ID")

#Why might this output be confusing? How could we make it easier to understand?

#Let's rename some columns
names(Gavin)[2] <- "Gavin's New Years Resolutions"
names(Nicole)[2] <- "Nicole's New Years Resolutions"

names(Gavin)[3] <- "Gavin's Outcome"
names(Nicole)[3] <- "Nicole's Outcome"

#Now, let's try this again!
innerjoin <- merge(Gavin, Nicole, by = "ID")

#What would happen if i switched them?
innerjoinswitch <- merge(Nicole, Gavin, by = "ID")
#Why did this happen?

#Outer Joins
#merge() function takes Gavin and Nicole as argument along with all=TRUE there by returns all rows from both tables, 
#join records from the left (Gavin) which have matching keys in the right (Nicole) table.

outerjoin <- merge(Gavin, Nicole, by = "ID", all=TRUE)

#What's the difference between this and innerjoin?

#Left Join
#merge() function takes Gavin and Nicole as argument along with all.x=TRUE
#there by returns all rows from the left (Gavin) table, 
#and any rows with matching keys from the right (Nicole) table.

leftjoin <- merge(Gavin, Nicole, by = "ID", all.x=TRUE)

#What happens if we switch it?
leftjoinswitch <- merge(Nicole, Gavin, by = "ID", all.x=TRUE)

#What's the difference between outer and left join?

#Anti Join
#This join is like Gavin-Nicole, as it selects all rows from Gavin's dataset 
#that are not present in Nicole's dataset
library(dplyr)
antijoin <- Gavin %>% anti_join(Nicole, by="ID")
