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

alldat <-  readRDS(file = paste0(data_path, "/four_cohorts_variables_exclusion.rds"))
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

## T-tests for average scores


t.test(alldat$gad.sum_score_base,alldat$gad.sum_score_prepan, paired = T)
t.test(alldat$phq.sum_score_base,alldat$phq.sum_score_prepan, paired = T)

t.test(alldat$gad.sum_score_base,alldat$gad.sum_score_retro, paired = T)
unlist(t.test(alldat$phq.sum_score_base,alldat$phq.sum_score_retro, paired = T)$estimate)


## T-tests for average scores by group (retrospective)

alldat %>%
  mutate(sample = case_when(Sample == "GLAD" | Sample == "EDGI" ~ "GLAD",
                            Sample == "RAMP" ~ "RAMP",
                            Sample == "NBR" ~ "NBR")) %>%
  select(gad.sum_score_base,gad.sum_score_retro, sample) %>%
  gather(key = variable, value = value, -sample) %>% 
  group_by(sample,variable) %>% 
  summarise(value = list(value)) %>%
  spread(variable,value) %>%
  group_by(sample) %>% 
  mutate(p_value = t.test(unlist(gad.sum_score_base), unlist(gad.sum_score_retro))$p.value,
         t_value = t.test(unlist(gad.sum_score_base), unlist(gad.sum_score_retro))$statistic,
         df = t.test(unlist(gad.sum_score_base), unlist(gad.sum_score_retro))$parameter)

## Means and standard deviations
## over all

vars <- alldat %>%
  select(gad.sum_score_base,gad.sum_score_retro,gad.sum_score_prepan,
         phq.sum_score_base,phq.sum_score_retro,phq.sum_score_prepan,
         pcl.sum_score_base)


apply(vars, 2, function(x) list(describe(x)))

## By sample
alldat %>%
  mutate(sample = case_when(Sample == "GLAD" | Sample == "EDGI" ~ "GLAD",
                            Sample == "RAMP" ~ "RAMP",
                            Sample == "NBR" ~ "NBR")) %>%
  group_by(sample) %>%
  summarize(m.gad.base = mean(gad.sum_score_base, na.rm = TRUE),
            sd.gad.base = sd(gad.sum_score_base, na.rm = TRUE),
            m.gad.prepan = mean(gad.sum_score_prepan, na.rm = TRUE),
            sd.gad.prepan = sd(gad.sum_score_prepan, na.rm = TRUE),
            m.gad.retro = mean(gad.sum_score_retro, na.rm = TRUE),
            sd.gad.retro = sd(gad.sum_score_retro, na.rm = TRUE),
            
            m.phq.base = mean(phq.sum_score_base, na.rm = TRUE),
            sd.phq.base = sd(phq.sum_score_base, na.rm = TRUE),
            m.phq.prepan = mean(phq.sum_score_prepan, na.rm = TRUE),
            sd.phq.prepan = sd(phq.sum_score_prepan, na.rm = TRUE),
            m.phq.retro = mean(phq.sum_score_retro, na.rm = TRUE),
            sd.phq.retro = sd(phq.sum_score_retro, na.rm = TRUE),
            
            m.pcl.base = mean(pcl.sum_score_base, na.rm = TRUE),
            sd.pcl.base = sd(pcl.sum_score_base, na.rm = TRUE),
            m.pcl.prepan = mean(pcl.sum_score_prepan, na.rm = TRUE),
            sd.pcl.prepan = sd(pcl.sum_score_prepan, na.rm = TRUE),
            )
