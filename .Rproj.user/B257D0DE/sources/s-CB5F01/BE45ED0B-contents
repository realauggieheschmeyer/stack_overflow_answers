# https://stackoverflow.com/questions/61899353/selecting-observations-within-a-data-frame-and-reversing-their-order/61899665#61899665

library(tidyverse)

dat <- tibble(ID = rep(letters[1:10], each = 10),
                  time = rep(c(1:10), times = 10),
                  var1 = rnorm(100))

flip_vars <- c("b", "e", "g")

dat %>% 
  pivot_wider(names_from = ID, values_from = var1) %>% 
  mutate_at(
    flip_vars,
    rev
  ) %>% 
  pivot_longer(cols = a:j, names_to = "ID", values_to = "var1")
         