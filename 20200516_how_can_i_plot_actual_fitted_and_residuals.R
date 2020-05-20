# https://stackoverflow.com/questions/61845062/how-can-i-plot-actual-fitted-and-residuals/61845751#61845751

library(tidyverse)

data <- tibble(y = rnorm(1000),
       x1 = y + rnorm(1000, 1, 10),
       x2 = y + rnorm(1000, 10, 1))

model <- lm(y ~ ., data)

model %>% 
  predict() %>% 
  as_tibble() %>% 
  rename(.pred = value) %>% 
  bind_cols(data %>% 
              select(y)) %>% 
  mutate(.resid = y - .pred) %>% 
  ggplot(aes(x = y, y = .pred, color = .resid)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0) +
  labs(x = "Actual",
       y = "Fitted",
       color = "Residuals")

