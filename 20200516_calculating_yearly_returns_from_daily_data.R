#https://stackoverflow.com/questions/61844676/calculating-yearly-return-from-daily-return-data/61845373#61845373

library(tidyquant)

tq_get("ADSK") %>%
  tq_transmute(select = close,
            mutate_fun = periodReturn,
            period = "yearly")
