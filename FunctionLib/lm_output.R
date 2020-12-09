# Function to format lm model for forest plot and set as global object with specified name
# Independent variable set is not flexible as we will only need this for final models / limited model set.
# KLPurves

lmoutput_format <- function(lmobject, explan_var, group, dfname){
  
  ## Row labels
  independent.variables <- c("intercept",
                             explan_var,
                             "comorbid depression and anxiety compared to control",
                             "depressive disorder compared to control",
                             "anxiety disorder compared to control",
                             "eating disorders compared to control",
                             "obsessive compulsive disorders compared to control",
                             "comorbid psychotic and bipolar disorder compared to control",
                             "psychotic disorder compared to control",
                             "bipolar disorder compared to control",
                             "mhd.posttraumatic_stress_disorder_ptsd compared to control",
                             "autism_spectrum_disorder compared to control",
                             "mhd.attention_deficit_hyperactivity_disorder compared to control",
                             "mhd.personality_disorder compared to control",
                             "Female compared to male",
                             "Non-binary/Self-defined compared to male",
                             "16-18 compared to 26-35",
                             "19-25 compared to 26-35",
                             "36-45 compared to 26-35",
                             "46-55 compared to 26-35",
                             "56-65 compared to 26-35",
                             "66-70 compared to 26-35",
                             "71-75 compared to 26-35",
                             "76+ compared to 26-35",
                             "Mixed or multiple ethnicities compared to White",
                             "Asian compared to White",
                             "Black compared to White",
                             "Other compared to White",
                             "key_worker compared to non-keyworker",
                             "time_diff_coping_lockdown_march_23")
  ## categories to facet on  
  categories <- c("Intercept",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Pre-existing mental health",
                  "Gender",
                  "Gender",
                  "Age",
                  "Age",
                  "Age",
                  "Age",
                  "Age",
                  "Age",
                  "Age",
                  "Age",
                  "Ethnicity",
                  "Ethnicity",
                  "Ethnicity",
                  "Ethnicity",
                  "Other",
                  "Other")
  
  ## Disoprder dimension  
  groups <- c(group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group,
              group)
  
  # create data frame
  df <- as.data.frame(coef(summary(lmobject)),row.names=F)
  
  # add row labels
  df$RowLabels <- independent.variables
  
  # Add category labels
  df$Categories <- categories
  
  # Add group labels
  df$Group <- groups
  
  # calculate upper and lower confidence intervals
  df <- df %>%
    mutate(LowerBound = Estimate - (1.96*`Std. Error`),
           UpperBound = Estimate + (1.96*`Std. Error`))
  
  # drop intercept row
  df <- df[(df$RowLabels != 'intercept'),]
  
  # order factors
  df$RowLabels <- factor(df$RowLabels, levels = rev(independent.variables))   ## individual rows
  df$Categories <- factor(df$Categories, levels = unique(categories))   ## categories
  
  
  # assign dataframe to global environment
  assign(dfname, df, envir = .GlobalEnv)
  
}