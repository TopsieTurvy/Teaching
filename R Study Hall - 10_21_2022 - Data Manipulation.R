## R Study Hall 
# Date: 10/21/2022
# Topic: Basic Data Manipulation
# Teacher: Nicole Turvey

# Today's lesson will be on data manipulation -- but don't be spooked!
# This lesson will be a treat, as such, we will learn about candy!
# To learn more about this dataset (a data dictionary if you will)
# Go here: https://fivethirtyeight-r.netlify.app/reference/candy_rankings.html
# To download the data, go here: https://drive.google.com/file/d/1tIwFTcQ9drnXu6-IAYpeJY7GiMON4ZmL/view?usp=sharing


# First, let's load some packages
install.packages("tidyverse")
library(tidyverse)


# Now, we pull in our candy data
candy <- read_csv("~/candy-data.csv")
View(candy)

# Oh no! Our data is messy! What shall we do?

#__Cleaning Names_______________________________________________________________
# Let's start by cleaning up competitor name
## Hersey's First
### Does anyone know why it shows up this way upon import?

# The Fix
candy$competitorname[candy$competitorname=="HersheyÕs Kisses"] <- "Hersheys Kisses"
candy$competitorname[candy$competitorname=="HersheyÕs Krackel"] <- "Hersheys Krackel"

# Now your turn :)
## Hershey?s Milk Chocolate & Hershey?s Special Dark

# What does pluribus even mean? Would you want to convert this for future folks?
## Of course you would -- let's try it!
names(candy)[10] <- 'Is it one of many candies in a bag or box?'

# Your turn! :)
## Let's turn 'crispricewafer' to 'Does it contain crisped rice, wafers, or a cookie component?'

#__Ordering Data________________________________________________________________
# What a fright! Your friend wants to know the highest % sugar candy bar STAT!
## How do we do this using code? A quick order function!
candy <- candy[order(-candy$sugarpercent),]

# What's the answer?

# Your friend really wants to know the *lowest* priced candy bar. Any ideas?

#__Filtering Data_______________________________________________________________
# You're really only interested in the chocolate candy -- how do you find it?
## Time to filter using the tidyverse package (%>%)
chocolate <- candy %>% filter(chocolate == 1)

## Your neighborhood kids want candy bars only, how do you find those?

# GASP. Your friend insists on caramel. How can you both get what you like?
sharingiscaring <- candy %>% filter(chocolate == 1, caramel == 1)

## Your third friend wants nougat too! How do we find a candy to agree on?

# Oh no! One of the neighborhood kids can't have peanuts!
allergies <- candy %>% filter(peanutyalmondy != 1)

## What if you want no peanuts, but caramel flavor?

#__Selecting Data_______________________________________________________________
## Hmm, do we really need all of these columns?
chocolatebars <- candy %>% dplyr::select(competitorname, chocolate, bar, sugarpercent)

# Make your own dataset!
