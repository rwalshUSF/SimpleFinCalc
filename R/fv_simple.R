# Simple Future Value Function
fv_simple <- function(principal, rate, years) {
  # Ensure rate is in decimal form
  if (rate > 1) {
    rate <- rate / 100
  }

  # Calculate future value using the formula: FV = PV * (1 + r)^n
  future_value <- principal * (1 + rate)^years

  return(future_value)
}
