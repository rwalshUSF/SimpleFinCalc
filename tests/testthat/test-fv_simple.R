test_that("fv_simple() returns calculated value", {
  expect_equal(fv_simple(1000,5,10),1628.89463)
})

test_that("fv_simple() errors if principal != numeric", {
  expect_error(fv_simple("One Thousand",5,10))
})

test_that("fv_simple() errors if rate != numeric", {
  expect_error(fv_simple(1000,"Five",10))
})

test_that("fv_simple() errors if years != numeric", {
  expect_error(fv_simple(1000,5,"Ten"))
})
