test_that("fv_compound() returns calculated value", {
  expect_equal(fv_compound(1000,5,10,4),1643.61946)
})

test_that("fv_compound() returns calculated value", {
  expect_equal(fv_compound(profiles1$Principal[1],profiles1$Rate[1],profiles1$Years[1],profiles1$N_Compounding[1]),10861782.0)
})

test_that("fv_compound() errors if principal != numeric", {
  expect_error(fv_simple("One Thousand",5,10,4))
})

test_that("fv_compound() errors if rate != numeric", {
  expect_error(fv_simple(1000,"Five",10,4))
})

test_that("fv_compound() errors if years != numeric", {
  expect_error(fv_simple(1000,5,"Ten",4))
})

test_that("fv_compound() errors if n_comp != numeric", {
  expect_error(fv_simple(1000,5,10,"Four"))
})
