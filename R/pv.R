#' Present Value
#'
#' This function performs a calculation with robust input validation.
#'
#' @param future_value Single numeric value - The future value amount.
#' @param rate Single numeric value - The annual discount rate (as a decimal).
#' @param years Single numeric value - The number of years until the future value is received.
#'
#' @returns A numeric value representing the result of the calculation. The present value.
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
#' testF<-10000
#' testR<-5
#' testY<-10
#' pv(testF,testR,testY)
#'
pv <- function(future_value, rate, years) {
  # Input validation
  if (!is.numeric(future_value) || any(is.na(future_value)) || length(future_value) != 1 || any(future_value <= 0)) {
    stop("Argument 'future_value' must be a single numeric value without NA & positive.")
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
  pv_value <- future_value / (1 + rate)^years
  return(pv_value)
}
