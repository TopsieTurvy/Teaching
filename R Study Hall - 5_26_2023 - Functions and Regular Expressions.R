# R Study Hall - Regular Expressions & Functions
# 5-26-2023
# Teacher: Nicole Turvey

# Regular expressions are a powerful tool for pattern matching and manipulation of text data.
# In R, regular expressions are supported through the base R package.
# Regular expressions are enclosed within forward slashes ("/") in R.
# Common Metacharacters in Regular Expressions

# Metacharacters are special characters with a predefined meaning in regular expressions.
# Common metacharacters:
#   "." (dot): Matches any single character except a newline.
# "^" (caret): Matches the start of a line.
# "$" (dollar): Matches the end of a line.
# "*" (asterisk): Matches zero or more occurrences of the preceding character.
# "+" (plus): Matches one or more occurrences of the preceding character.
# "?" (question mark): Matches zero or one occurrence of the preceding character.
# "[]" (brackets): Matches any single character within the brackets.
# "[^]" (caret within brackets): Matches any single character not within the brackets.
# "|" (pipe): Matches either the expression before or after the pipe.
# "\b" (word boundary): Matches a word boundary.

# Examples of Regular Expression Patterns
# Matching and extracting specific patterns from text data.
# Examples:
# Extracting email addresses from a text.
# Extracting dates in a specific format.
# Extracting URLs from a text.
# Removing special characters from a string.
# Using Regular Expressions with Base R Datasets
# 
# Let's work with the "mtcars" dataset, which contains information about various car models.
# 
# Example 1: Extracting car names starting with the letter "M".
# Load the mtcars dataset
data(mtcars)

# Extract car names starting with "M"
car_names <- mtcars$car[grepl("^M", mtcars$car)]
car_names

# Example 2: Extracting car names with a specific pattern.
# Extract car names with "C" followed by a vowel
car_names <- mtcars$car[grepl("C[aeiou]", mtcars$car)]
car_names

# Writing Custom Functions

# Functions allow you to encapsulate a series of actions into a reusable block of code.
# Syntax: function_name <- function(arguments) { code }.
# Example: Writing a function to calculate the average of a numeric vector.


# Function to calculate average mpg
calculate_mpg_average <- function() {
  avg_mpg <- mean(mtcars$mpg)
  return(avg_mpg)
}

# Usage
average_mpg <- calculate_mpg_average()
