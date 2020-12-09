# Function to create a formula for regressions and set this as a global variable
# Independent variable set is not flexible as we will only need this for final models / limited model set.
# KLPurves


model1b.lm.form <- function(outcome, explan_var) {
  
  # define the variable name of the dependent variable
  dependent.variable <- outcome
  # define the independent variables
  independent.variables <- c(explan_var,
                             "depression_and_anxiety",
                             "eating_disorders",
                             "obsessive_compulsive_disorders",
                             "bipolar_and_schizophrenia",
                             "mhd.posttraumatic_stress_disorder_ptsd",
                             "autism_spectrum_disorder",
                             "mhd.attention_deficit_hyperactivity_disorder",
                             "mhd.personality_disorder",
                             "Gender_collapsed",
                             "age_category_collapsed_reordered",
                             "Ethnicity_collapsed",
                             "key_worker",
                             "time_diff_coping_lockdown_march_23"
  )
  # create the formula
  glm.formula <- paste(dependent.variable, paste(independent.variables, collapse=" + "), sep=" ~ ")
  
  # assign it globally with the right variable name.
  assign(paste0(outcome,".", explan_var, ".glmformula"),
         glm.formula,
         envir = .GlobalEnv
         
  )
}