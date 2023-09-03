# chatGPT promts used to Make the app ----

library(tidyverse)
library(tidyquant)
library(timetk)
library(modeltime)

FANG %>%
    slice(0) %>%
    glimpse()

# Prompt 1

library(rsample)
library(timetk)
library(tidymodels)
library(modeltime)

# Load the FANG dataset
data(FANG)

# Convert the date column to a proper date format
FANG$date <- as.Date(FANG$date)

# Split the data into training and testing sets
set.seed(123)
FANG_split <- initial_time_split(FANG, prop = 0.8, strata = "symbol")
FANG_train <- training(FANG_split)
FANG_test <- testing(FANG_split)

# Create a recipe for the forecasting model
FANG_rec <- recipe(close ~ ., data = FANG_train) %>%
    step_rm(symbol) %>%
    step_rm(volume) %>%
    # step_rm_adjusted(all_numeric()) %>%
    step_log(all_numeric()) %>%
    step_normalize(all_numeric()) %>%
    prep()

# Create the forecasting model
FANG_model <- linear_reg() %>%
    set_engine("lm") %>%
    set_mode("regression")

# Fit the model to the training data
FANG_fit <- FANG_model %>%
    fit(FANG_rec, data = FANG_train)

# Generate forecasts for the next week
FANG_fcst <- FANG_fit %>%
    forecast(new_data = FANG_test, h = 7)

# Plot the forecasts
autoplot(FANG_fcst, data = FANG_test)
