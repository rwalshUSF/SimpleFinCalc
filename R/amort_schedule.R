#' Amortization Schedule
#'
#' This function performs a calculation with robust input validation.
#'
#' @param principal Single numeric value - The total loan amount.
#' @param rate Single numeric value - The annual interest rate (as a decimal).
#' @param years Single numeric value - The total number of years for the loan.
#'
#' @returns A data frame showing the breakdown of each payment.
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
#' amort_schedule(testP,testR,testY)
#'
amort_schedule <- function(principal, rate, years) {
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

  monthly_rate <- rate / 12
  n_payments <- years * 12
  monthly_payment <- loan_payment(principal, rate, years)

  schedule <- data.frame(
    Payment_No = 1:n_payments,
    Beginning_Balance = NA,
    Payment = monthly_payment,
    Interest = NA,
    Principal_Paid = NA,
    Ending_Balance = NA
  )

  current_balance <- principal
  for (i in 1:n_payments) {
    interest_payment <- current_balance * monthly_rate
    principal_payment <- monthly_payment - interest_payment
    ending_balance <- current_balance - principal_payment

    schedule$Beginning_Balance[i] <- current_balance
    schedule$Interest[i] <- interest_payment
    schedule$Principal_Paid[i] <- principal_payment
    schedule$Ending_Balance[i] <- ending_balance

    current_balance <- ending_balance
  }

  schedule[, c("Beginning_Balance", "Payment", "Interest", "Principal_Paid", "Ending_Balance")] <-
    round(schedule[, c("Beginning_Balance", "Payment", "Interest", "Principal_Paid", "Ending_Balance")], 2)

  return(schedule)
}
