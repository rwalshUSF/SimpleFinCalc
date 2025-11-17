#' Simple Future Value
#'
#' This function performs a calculation with robust input validation.
#'
#' @param principal Single numeric value - The initial principal amount (numeric, positive).
#' @param rate Single numeric percentage - The annual interest rate (numeric, positive, as a decimal).
#' @param years Single numeric value - The number of years (numeric, positive integer or decimal).
#'
#' @returns A numeric value representing the result of the calculation. The future value.
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
#' fv_simple(testP,testR,testY)
#'
fv_simple <- function(principal, rate, years) {
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

  # Calculate future value using the formula: FV = PV * (1 + r)^n
  future_value <- principal * (1 + rate)^years

  return(future_value)
}
