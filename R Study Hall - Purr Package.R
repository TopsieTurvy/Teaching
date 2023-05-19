# R Study Hall - The Purr Package
# 5-19-2023
# Teacher: Nicole Turvey

# Step 1: Installing and Loading the purrr Package
install.packages("purrr")  # Install purrr package
library(purrr)  # Load purrr library

# Step 2: Exploring Base R Datasets
# Let's use the 'mtcars' dataset for this example
mtcars <- mtcars

# Step 3: Using purrr Functions with Base R Datasets

# a. Map Functions
# Example 1: Square each element of the 'mpg' column
# The tilde (~) notation indicates the use of an anonymous function or formula.
# In many programming languages, including R, the tilde (~) notation is often used to define an anonymous function. 
# The tilde is followed by the function body or expression. 
# Within the function body, special placeholders or symbols, such as .x 
# ~ .x^2 specifies that each element (x) from the mtcars$mpg vector should be squared (^2). 
# The map function then applies this anonymous function to each element of the mtcars$mpg vector 
mapped_mpg <- map(mtcars$mpg, ~ .x^2)
print(mapped_mpg)

# Example 2: Check if each element of the 'cyl' column is even
mapped_cyl <- map_lgl(mtcars$cyl, ~ .x %% 2 == 0)
print(mapped_cyl)

# b. Walk Functions
# Example 3: Print each element of the 'gear' column
walk(mtcars$gear, print)

# Example 4: Calculate the product of two corresponding elements from 'mpg' and 'wt' columns
walk2(mtcars$mpg, mtcars$wt, ~ print(.x * .y))

# c. Reduce Functions
# Example 5: Calculate the sum of elements in the 'disp' column
mtcars$reduce <- reduce(mtcars$disp, `+`)
print(sum_disp)

# Example 6: Calculate the cumulative sum of elements in the 'hp' column
mtcars$cumaltivehp <- accumulate(mtcars$hp, `+`)
print(cumulative_hp)

# d. Modify Functions
# Example 7: Increase each element of the 'carb' column by 1
mtcars$carbmodify <- modify(mtcars$carb, ~ .x + 1)
print(modified_carb)


# Step 5: Applying purrr to Base R Datasets
# Example 8: Calculate the average horsepower for each number of cylinders in 'cyl' column
average_hp_by_cyl <- mtcars %>%
  split(.$cyl) %>%
  map_dbl(~ mean(.x$hp))
print(average_hp_by_cyl)

