test_that("amort_schedule() errors if future_value != numeric", {
  expect_error(amort_schedule("One Thousand",5,10))
})

test_that("amort_schedule() errors if rate != numeric", {
  expect_error(amort_schedule(1000,"Five",10))
})

test_that("loan_payment() errors if years != numeric", {
  expect_error(amort_schedule(1000,5,"Ten"))
})
