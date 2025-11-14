test_that("pv() returns calculated value", {
  expect_equal(pv(10000,5,10),6139.13254)
})

test_that("pv() returns calculated value", {
  expect_equal(pv(profiles1$Future_Value_Input[1],profiles1$Rate[1],profiles1$Years[1]),43763.2931)
})

test_that("pv() errors if future_value != numeric", {
  expect_error(pv("One Thousand",5,10))
})

test_that("fv_simple() errors if rate != numeric", {
  expect_error(fv_simple(1000,"Five",10))
})

test_that("fv_simple() errors if years != numeric", {
  expect_error(fv_simple(1000,5,"Ten"))
})

