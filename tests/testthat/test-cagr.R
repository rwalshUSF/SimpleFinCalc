test_that("cagr() returns calculated value", {
  expect_equal(cagr(1000,15632,10),0.316441166)
})

test_that("cagr() returns calculated value", {
  expect_equal(cagr(profiles1$Start_Value[1],profiles1$End_Value[1],profiles1$Years[1]),0.033356201)
})

test_that("cagr() errors if Start_Value != numeric", {
  expect_error(cagr("One Thousand",5,10))
})

test_that("cagr() errors if End_Value != numeric", {
  expect_error(cagr(1000,"Five",10))
})

test_that("cagr() errors if years != numeric", {
  expect_error(cagr(1000,5,"Ten"))
})
