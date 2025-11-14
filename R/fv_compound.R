#' Compound Future Value
#'
#' This function performs a calculation with robust input validation.
#'
#' @param principal The initial principal amount (numeric, positive).
#' @param rate The annual interest rate (numeric, positive, as a decimal).
#' @param years The number of years (numeric, positive integer or decimal).
#' @param n_comp The number of compounding periods per year (numeric, positive integer).
#'
#' @returns The calculated future value (numeric). The future value.
#' @export
#'
#' @examples
#'
#' # Using user variables:
#'
#' testP<-1000
#' testR<-5
#' testY<-10
#' testN<-4
#' fv_compound(testP,testR,testY,testN)
#'
fv_compound <- function(principal, rate, years, n_comp) {

  # Input Validation

  # Check that all inputs are numeric
  if (!is.numeric(principal) || !is.numeric(rate) || !is.numeric(years) || !is.numeric(n_comp)) {
    stop("All inputs (principal, rate, years, n_comp) must be numeric.")
  }

  # Check that inputs are single values
  if (length(principal) != 1 || length(rate) != 1 || length(years) != 1 || length(n_comp) != 1) {
    stop("All inputs must be single values (vectors of length 1).")
  }

  # Check that inputs are non-negative
  if (principal < 0 || rate < 0 || years < 0 || n_comp < 0) {
    stop("Principal, rate, years, and n_comp cannot be negative.")
  }

  # Check that n_comp is a valid compounding frequency (integer > 0)
  if (n_comp < 1 || !is.numeric(n_comp)) {
    warning("n_comp should be an integer (e.g., 1 for annually, 4 for quarterly, 12 for monthly).")
  }

  # Calculation

  # Ensure rate is in decimal form
  if (rate > 1) {
    rate <- rate / 100
  }

  # The future value formula: FV = P * (1 + r/n)^(n*t)
  future_value <- principal * (1 + rate / n_comp)^(n_comp * years)

  return(future_value)
}
