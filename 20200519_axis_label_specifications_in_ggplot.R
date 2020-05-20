# https://stackoverflow.com/questions/61898701/axis-label-specifications-in-ggplot

library(tidyverse)

sample_data <- tibble(x = rnorm(1000),
       y = x^2)

sample_data %>%
  ggplot(aes(x, y)) +
  geom_point() +
  labs(
    x = "X",
    y = expression(atop("Variable", Y^2))
  )

       