#' Simple Future Value
#'
#' This function performs a calculation with robust input validation.
#'
#' @param principal Single numeric value - Must not contain `NA` values and all values must be positive.
#' @param rate Single numeric percentage - Must not contain `NA` values and all values must be positive.
#' @param years Single numeric value - Must not contain `NA` values and all values must be positive.
#'
#' @returns A numeric value representing the result of the calculation.
#' @export
#'
#' @examples
#'
#' # Using user variables:
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
