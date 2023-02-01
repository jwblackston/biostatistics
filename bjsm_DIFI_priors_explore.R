# BJSM Exploratory Project
# by Walker Blackston
# 1/27/23

library(MASS)
library(BayesCTDesign)
library(bayesplot)
library(ggplot2)
library(tidybayes)
library(tidyverse)

set.seed(9)

samp_bern_data <- simple_sim(trial_reps =  100,
                             outcome_type = "bernoulli",
                             subj_per_arm = c(40, 60, 80, 100, 120, 140, 160, 180, 200, 220), 
                             effect_vals = c(0.6, 0.7, 0.8, 0.9, 1.0),
                             control_parms = c(0.537), 
                             alpha = 0.05, get_bias = TRUE,
                             get_mse = TRUE, seedval = 9, quietly = FALSE)
print(samp_bern_data)
BasicPlot <- plot(samp_bern_data, measure = "power", 
                  tab_type = "WX|YZ", smooth = TRUE)
BasicPlot <- BasicPlot + geom_hline(yintercept = 0.80) + geom_vline(xintercept = 130)
ggtitle("Two Arm Study, No Historical Data, Bernoulli Outcome") + xlab("Sample Size per Arm") + 
  ylab("Estimated Power")
BasicPlot
