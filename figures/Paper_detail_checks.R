## paper detail checks for PANCHANGE
## KL Purves
## 15 Dec 2020


# Read in data
library(tidyverse)
library(data.table)
library(lubridate)

# get file info
source("/Users/kirstin/Dropbox/SGDP/RAMP/Projects/PANCHANGE/PANCHANGE_raw_path.R")


# check the date of the last COPING baseline data point.

# read in the 4 cohort data

alldat <-  readRDS(file = paste0(data_path, "/four_cohorts.rds"))
rampdat <-  readRDS(file = paste0(data_path, "/ramp.rds"))

## Subset samples

GLAD <- alldat %>%
  filter(Sample == "GLAD" | 
           Sample == "EDGI")

NBR <- alldat %>%
  filter(Sample == "NBR")

RAMP <- alldat %>%
  filter(Sample == "RAMP")

## Get the most recent baseline sign up per sample

max(RAMP$startDate.coping)
max(GLAD$startDate.coping)
max(NBR$startDate.coping)

