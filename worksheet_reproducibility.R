# Reproducibility & Machine Learning - Solutions

# Setup Execution 
## This will use the function "source()" to run the separate R File "setup.R"
## The "setup.R" file includes information such as: which packages to install, 
## and to check the working directory is correctly set. 
source("setup.R", local = FALSE)

# Package Loading 
library(tidymodels)
library(tidyverse)
library(stats)
library(rpart)
library(rpart.plot)
library(devtools)

tidymodels_prefer()

# Option Definition 
options(scipen = 999)

### Note ###
# In today's session we will be using the car_prices dataset, from `modeldata` package, 
# Although this worksheet is designed around this dataset, please feel free to use any of the data in this package!

data <- car_prices

# Exercise 1: Applying Reproducibility, through Machine Learning Preparation

## Exercise 1a: Set the random seed to today's date (16062026)
  # And run the function `runif(n = 10)`, repeat this process do you get the same results? 

set.seed(??)

runif(??)

## Exercise 1b: Repeat this, but with yesterdays date (15062026)



## Exercise 1c: Resetting the seed to today's date, perform and initial split on the car_prices data
  ## For this, we want a 80/20 Training/Testing split 

data_split <- initial_split(??)

## Exercise 1d: Divide this Large Initial Split object into a training and testing data frame 

data_train <- training(??) 
data_test <- testing(??)

  # This will create two datasets where n=643 and n=161 respectively. 

# Exercise 2: Applying Machine Learning Models

## Exercise 2a: Explore the data. 
  # Before we conduct any machine learning examination, explore the data


  # In this case, we can probably use a regression based decision tree, to predict price based on various variables! 


## Exercise 2b: First build a simple Decision Tree Model
## Remember to set the engine to "rpart", and the mode to "regression".

dt_model <- 
  decision_tree() |>
  set_engine(??) |>
  set_mode(??)

## Exercise 2c: Next, create a model fit to: 
  # Predict the Price of a car, based on, Mileage, Doors, Cylinders and Cruise 

dt_model_fit_1 <- 
  dt_model |> 
  fit(data = data_train,
      ?? ~ ??)

## Exercise 2d: Check the outcomes of the model 

dt_model_res_1 <- 
  dt_model_fit_1 |>
  extract_fit_engine() |> 
  summary()

## Exercise 2e: Visualise these model outcomes
rpart.plot(??)

## Exercise 3: Predicting and Evaluating Tidy Models 
## Exercise 3a: Using the testing data, test the prediction of the model 
dt_model_pred_1 <- 
  predict(??,
          new_data = ??)

## Exercise 3b: Join (using rbind), the true variables with the predicted 
dt_model_pred_res <- 
  bind_cols(??, 
            data_test |> select(Price))

## Exercise 3c: Using your knowledge of ggplot2, plot the predicted value (.pred) against the truth (Price)
# In this case, plot the "truth" on the x-axis, and the predicted on the y-axis 

ggplot(data = ??) + 
  geom_point(mapping = aes(x = ??, y = ??))


## Exercise 3d: Add an additional diagonal line (x = y), using `geom_abline()` 
# to understand the line of best fit
# Hint, leave geom_abline() blank to get a x = y line. 


## Exercise 3e: Evaluate the created model with the evaluation metrics of RMSE, MAE and R-squared
model_metrics <- metric_set(??, ??, ??)

dt_model_metric <- model_metrics(??, 
                                 truth = ??, 
                                 estimate = ??)

print(dt_model_metric)

## Extension: If we make it this far, use the parsnip library online, and modeldata,
  # To explore the creation of other tidymodels! 

