### R Study Hall 
# Date: 11/18/2022
# Topic: Web Scraping in R

#Start by reading in our new package rvest and reloading dplyr. 
#Remember, if you haven't downloaded either before, what do you do first?
library(rvest)
library(dplyr)

#Start by pasting the link and naming it "link"
link <- "https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=adventure&sort=user_rating,desc"
page <- read_html(link)

#We use selector gadget on google chrome to grab the html nodes for each of our four categories of data
name <- page %>% html_nodes(".lister-item-header a") %>% html_text()
year <- page %>% html_nodes(".text-muted.unbold") %>% html_text()
rating <- page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
synopsis <- page %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()

#Now we place those into a dataframe and just like that -- R Magic!
movies <- data.frame(name, year, rating, synopsis, stringsAsFactors = FALSE)
