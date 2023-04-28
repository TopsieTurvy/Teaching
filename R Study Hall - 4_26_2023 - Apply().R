# R Study Hall - The Apply() Functions Family
# 4-26-2023
# Teacher: Nicole Turvey

# Read in data
library(readr)
covid_data <- read_csv("Documents/Colorado_SARS-CoV-2_Variant_Sentinel_Surveillance.csv")
View(covid_data)

# apply(X, MARGIN, FUN)
# x: an array or matrix
# MARGIN=1`: the manipulation is performed on rows
# MARGIN=2`: the manipulation is performed on columns
# MARGIN=c(1,2)` the manipulation is performed on rows and columns
# FUN: tells which function to apply. Built functions like mean, median, sum, min, max and even user-defined functions can be applied>
# Use the apply function to find the mean of proportion
apply(covid_data[, "proportion"], 2, mean)

# What about using it to find the max proportion?
apply(covid_data[, "proportion"], 2, max)

# What about suming the proportion column?
apply(covid_data[, "proportion"], 2, sum)


# The sapply() function is a simplified version of apply() that returns 
# a vector or matrix as output, rather than an array. 
# This use gives us the number of unique variants of concern
sapply(covid_data[c("variant_of_concern")], function(x) length(unique(x)))


# The lapply() function applies a function to each element of a list, 
# and returns a list as output. 
variant_list <- split(covid_data, covid_data$variant_of_concern)
lapply(variant_list, function(x) sum(x$proportion))

# The tapply() function applies a function to subsets of a vector or data frame 
# defined by a factor variable.
tapply(covid_data$proportion, covid_data$variant_of_concern, mean)
