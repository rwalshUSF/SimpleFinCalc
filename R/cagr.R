#' Compound Annual Growth Rate
#'
#' This function performs a calculation with robust input validation.
#'
#' @param start_value Single numeric value - The initial value of the investment.
#' @param end_value Single numeric value - The final value of the investment.
#' @param years Single numeric value - The number of years the investment was held.
#'
#' @returns The Compound Annual Growth Rate (CAGR) of an investment as a decimal.
#' @export
#'
#' @examples
#'
#' # Using user variables:
#'
#' testSV<-1000
#' testEV<-15632
#' testY<-10
#' cagr(testSV,testEV,testY)
#'
cagr <- function(start_value, end_value, years) {
  # Input validation
  if (!is.numeric(start_value) || any(is.na(start_value)) || length(start_value) != 1) {
    stop("Argument 'start_value' must be a single numeric value without NA.")
  }
  if (!is.numeric(end_value) || any(is.na(end_value)) || length(end_value) != 1) {
    stop("Argument 'end_value' must be a single numeric value without NA.")
  }
  if (!is.numeric(years) || any(is.na(years)) || length(years) != 1 || any(years <= 0)) {
    stop("Argument 'years' must be a single numeric value without NA & positive.")
  }
  cagr_rate <- ((end_value / start_value)^(1 / years)) - 1
  return(cagr_rate)
}
