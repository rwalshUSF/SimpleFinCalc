test_that("loan_payment() returns calculated value", {
  expect_equal(loan_payment(1000,5,10),10.60655152)
})

test_that("loan_payment() returns calculated value", {
  expect_equal(loan_payment(profiles1$Principal[1],profiles1$Rate[1],profiles1$Years[1]),5334.95649)
})

test_that("loan_payment() errors if future_value != numeric", {
  expect_error(loan_payment("One Thousand",5,10))
})

test_that("loan_payment() errors if rate != numeric", {
  expect_error(loan_payment(1000,"Five",10))
})

test_that("loan_payment() errors if years != numeric", {
  expect_error(loan_payment(1000,5,"Ten"))
})
