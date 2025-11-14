#' Simple Return
#'
#' This function performs a calculation with robust input validation.
#'
#' @param start_price Single numeric value - The initial price/value.
#' @param end_price Single numeric value - The final price/value.
#'
#' @returns The simple return as a decimal (e.g., 0.10 for 10%).
#' @export
#'
#' @examples
#'
#' testSP<-1000
#' testEP<-15632
#' simple_return(testSP,testEP)
#'
simple_return <- function(start_price, end_price) {
  # Input validation
  if (!is.numeric(start_price) || any(is.na(start_price)) || length(start_price) != 1) {
    stop("Argument 'start_price' must be a single numeric value without NA.")
  }
  if (!is.numeric(end_price) || any(is.na(end_price)) || length(end_price) != 1) {
    stop("Argument 'end_price' must be a single numeric value without NA.")
  }
  return_rate <- (end_price - start_price) / start_price
  return(return_rate)
}
