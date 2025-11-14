test_that("simple_return() returns calculated value", {
  expect_equal(simple_return(1000,15632),14.632)
})

test_that("simple_return() returns calculated value", {
  expect_equal(simple_return(profiles1$Start_Price[1],profiles1$End_Price[1]),1.271178422)
})

test_that("simple_return() errors if Start_Price != numeric", {
  expect_error(simple_return("One Thousand",5))
})

test_that("simple_return() errors if End_Price != numeric", {
  expect_error(simple_return(1000,"Five"))
})
