## R Study Hall 
# Date: 1/13/2022
# Topic: Gsub and trimws
# Teacher: Nicole Turvey

#Gsub
#Kudos to statistic globe for making an easy example for us to learn from! (https://www.youtube.com/watch?v=bWLPOVlCnAY)

data <- "aaabbb"           # Example character string
data                       # Print example character string

sub("a", "c", data)           # Apply sub function in R

gsub("a", "c", data)          # Apply gsub function in R

#How is this different from sub?

#What does the "|" mean?
sub("a|b", "c", data)         # sub function with multiple pattern

gsub("a|b", "c", data)        # gsub function with multiple pattern

#how is this different from sub?

#Trim white spaces
#Another thanks to statistics globe! (https://www.youtube.com/watch?v=lUy82cF5baM)
data <- "     .  abcd e   f   "    # Create example character string
data                              # Print example data to RStudio console

trimws(data)                       # Apply trimws function in R

#What spaces did it get rid of?

#What if I want to get rid of all white space?
gsub(" ", "", data)

#What if I want to get rid of special characters?
data <- "a1~!@#$%^&*(){}_+:\"<>?,./;'[]-=" 
gsub("[[:punct:]]", "", data)
