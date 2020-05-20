# https://stackoverflow.com/questions/61895277/how-to-detect-all-binary-character-columns-each-column-has-different-set-of-cha

library(tidyverse)

# Create a dataset with two binary variables (x2 and x4)
sample_data <- tibble(x1 = rnorm(1000),
       x2 = rbinom(1000, 1, 0.5),
       x3 = rpois(1000, 5),
       x4 = sample(c("yes", "no"), 1000, replace = TRUE))

# Determine which variables have two levels and save them
binary_vars <- sample_data %>%  
  # This line calculates how many different values are present within each variable
  map_df(~ unique(.) %>% length()) %>% 
  # These lines just clean up the results
  gather() %>% 
  arrange(value) %>% 
  filter(value == 2) %>% 
  # This line pulls the variable names
  pull(key)

# Define a function to convert all binary variables to 1s and 0s
make_binary <- function(vct) {
  vct %>% 
    as_factor %>% 
    as.numeric() %>% 
    `-`(1)
}

# Mutate the relevant variables
sample_data %>%
  mutate_at(binary_vars,
            make_binary)
            

