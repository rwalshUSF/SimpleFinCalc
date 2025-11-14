test_that("annuity_payment() returns calculated value", {
  expect_equal(annuity_payment(1000,5,10),129.504575)
})

test_that("annuity_payment() returns calculated value", {
  expect_equal(annuity_payment(profiles1$Principal[1],profiles1$Rate[1],profiles1$Years[1]),64507.7913)
})

test_that("annuity_payment() errors if future_value != numeric", {
  expect_error(annuity_payment("One Thousand",5,10))
})

test_that("annuity_payment() errors if rate != numeric", {
  expect_error(annuity_payment(1000,"Five",10))
})

test_that("annuity_payment() errors if years != numeric", {
  expect_error(annuity_payment(1000,5,"Ten"))
})
