#' Annuity Payments
#'
#' This function performs a calculation with robust input validation.
#'
#' @param principal Single numeric value - The initial principal amount (loan amount or present value).
#' @param rate Single numeric value - The annual interest rate (as a decimal).
#' @param years Single numeric value - The number of years for the annuity/loan.
#'
#' @returns A numeric value representing the result of the calculation. The regular payment amount.
#' @export
#'
#' @examples
#'
#' # With user provided variables:
#'
#' # Rate can be entered as a whole number (conversion handled by check in function)
#' # or as a decimal. The function will determine the rate to be a percentage
#' # between 0 and 1
#'
#' testP<-1000
#' testR<-5
#' testY<-10
#' annuity_payment(testP,testR,testY)
#'
annuity_payment <- function(principal, rate, years) {
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
  # Assumes annual payments, aligns with annual rate/years inputs
  payment <- principal * (rate * (1 + rate)^years) / ((1 + rate)^years - 1)
  return(payment)
}
