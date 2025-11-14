#' Simple Future Value
#'
#' @param principal Single numeric value
#' @param rate Single numeric percentage
#' @param years Single numeric value
#'
#' @returns A numeric value
#' @export
#'
#' @examples
#' testP<-1000
#' testR<-5
#' testY<-10
#' fv_simple(testP,testR,testY)
#'
fv_simple <- function(principal, rate, years) {
  # Ensure rate is in decimal form
  if (rate > 1) {
    rate <- rate / 100
  }

  # Calculate future value using the formula: FV = PV * (1 + r)^n
  future_value <- principal * (1 + rate)^years

  return(future_value)
}
