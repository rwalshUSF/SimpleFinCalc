## code to prepare `profiles1` dataset goes here!

# Load necessary libraries (optional, used here for consistency)
# if(!require(tidyverse)) install.packages("tidyverse")
# library(tidyverse)

# Set a seed for reproducibility to get the same 100 random numbers each time
set.seed(42)

# Generate 100 records for financial calculations inputs

# 1. Variables related to Principal, Start Values, and Prices
# Principal/Start Values (e.g., loan amounts, initial investments)
principal_start_value <- runif(100, min = 1000, max = 500000)

# 2. Variables related to Future/End Values
# Generate values for the 'future value' input in the PV calculation,
# and 'end value' input for CAGR/Simple Return calculations.
# Values are generated to be generally higher than the corresponding start values
future_end_value <- principal_start_value * runif(100, min = 1.05, max = 3.0)

# 3. Variables related to Rate and Time
# Annual interest rates (realistic range, e.g., 2% to 15%)
rate_decimal <- runif(100, min = 0.02, max = 0.15)

# Years (loan/investment terms)
years_duration <- sample(1:30, 100, replace = TRUE)

# Number of compounding periods per year (e.g., 1=annually, 4=quarterly, 12=monthly)
n_compounding <- sample(c(1, 4, 12), 100, replace = TRUE)


# Create the data frame with relevant variables
profiles1 <- data.frame(
  # Inputs for TVM, Loans, Annuity functions
  Principal = principal_start_value,
  Rate = rate_decimal,
  Years = years_duration,
  N_Compounding = n_compounding,

  # Input for the PV function
  Future_Value_Input = future_end_value,

  # Inputs for CAGR function (uses Principal/Future values as start/end)
  Start_Value = principal_start_value,
  End_Value = future_end_value,

  # Inputs for Simple Return function (uses Principal/Future values as start/end prices)
  Start_Price = principal_start_value,
  End_Price = future_end_value
)

usethis::use_data(profiles1, overwrite = TRUE)
