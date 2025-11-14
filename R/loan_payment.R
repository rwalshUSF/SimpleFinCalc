#' Loan Payment
#'
#' This function performs a calculation with robust input validation.
#'
#' @param principal Single numeric value - The total loan amount.
#' @param rate Single numeric value - The annual interest rate (as a decimal).
#' @param years Single numeric value - The total number of years for the loan.
#'
#' @returns A numeric value representing the result of the calculation. The fixed monthly payment.
#' @export
#'
#' @examples
#'
#' # Using user variables:
#'
#' testP<-1000
#' testR<-5
#' testY<-10
#' loan_payment(testP,testR,testY)
#'
loan_payment <- function(principal, rate, years) {
  # Input validation
  if (!is.numeric(principal) || any(is.na(principal)) || length(principal) != 1 || any(principal <= 0)) {
    stop("Argument 'principal' must be a single numeric value without NA & positive.")
  }
  if (!is.numeric(rate) || any(is.na(rate)) || length(rate) != 1 || any(rate <= 0)) {
    stop("Argument 'rate' must be a single numeric value without NA & positive.")
  }
  if (!is.numeric(years) || any(is.na(years)) || length(years) != 1 || any(years <= 0)) {
    stop("Argument 'years' must be a single numeric value without NA & positive.")
  }
  # Ensure rate is in decimal form
  if (rate > 1) {
    rate <- rate / 100
  }

  # Calculate future value using the formula: payment = P*(r*(1 + r)^n/((1+r)^n-1)
  monthly_rate <- rate / 12
  n_payments <- years * 12
  payment <- principal * (monthly_rate * (1 + monthly_rate)^n_payments) / ((1 + monthly_rate)^n_payments - 1)
  return(payment)
}
