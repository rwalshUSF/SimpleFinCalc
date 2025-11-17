
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SimpleFinCalc

<!-- badges: start -->

<!-- badges: end -->

The goal of the ‘SimpleFinCalc’ R package is to provide a
straightforward suite of functions for performing common financial
calculations, making it an excellent educational tool or quick-reference
utility. It includes core functions for analyzing the time value of
money, such as computing future and present values, as well as
calculating loan payments. The package also features a function for
generating a full amortization schedule, allowing users to easily break
down loan payments into principal and interest over time. By
encapsulating complex financial formulas into easy-to-use functions,
SimpleFinCalc helps users perform essential financial analyses without
the need for manual calculations, streamlining tasks for students,
analysts, or anyone interested in personal finance.

## Installation

You can install the development version of SimpleFinCalc from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("rwalshUSF/SimpleFinCalc")
```

## Data

The ‘SimpleFinCalc’ R package includes a built in data set ‘profiles1’
to assist in the testing and demonstration of the many functions that
the packages includes. The ‘profiles1’ data set consists of 100 records
for financial calculations including synthetic inputs for various loan,
investment, and return calculations for use with the functions
implemented in the ‘SimpleFinCalc’ package.

The data set is available when the package is installed and the library
is loaded in to the R working environment. The data set can also be
referenced with the data() function or ?profiles1 in the R Console.

This is how to access the help file for the built-in ‘profiles1’ data
set:

``` r
# library(SimpleFinCalc)
# ?profiles1
```

Here is a summary of the variables in the built-in ‘profiles1’ data set:

``` r
library(SimpleFinCalc)
summary(profiles1)
#>    Principal           Rate             Years       N_Compounding  
#>  Min.   :  1119   Min.   :0.02228   Min.   : 1.00   Min.   : 1.00  
#>  1st Qu.:130577   1st Qu.:0.04429   1st Qu.:10.00   1st Qu.: 1.00  
#>  Median :270317   Median :0.07364   Median :18.00   Median : 4.00  
#>  Mean   :262715   Mean   :0.07730   Mean   :16.59   Mean   : 5.36  
#>  3rd Qu.:382043   3rd Qu.:0.09891   3rd Qu.:23.25   3rd Qu.:12.00  
#>  Max.   :494457   Max.   :0.14955   Max.   :30.00   Max.   :12.00  
#>  Future_Value_Input  Start_Value       End_Value        Start_Price    
#>  Min.   :   2886    Min.   :  1119   Min.   :   2886   Min.   :  1119  
#>  1st Qu.: 239745    1st Qu.:130577   1st Qu.: 239745   1st Qu.:130577  
#>  Median : 494020    Median :270317   Median : 494020   Median :270317  
#>  Mean   : 539392    Mean   :262715   Mean   : 539392   Mean   :262715  
#>  3rd Qu.: 831580    3rd Qu.:382043   3rd Qu.: 831580   3rd Qu.:382043  
#>  Max.   :1325829    Max.   :494457   Max.   :1325829   Max.   :494457  
#>    End_Price      
#>  Min.   :   2886  
#>  1st Qu.: 239745  
#>  Median : 494020  
#>  Mean   : 539392  
#>  3rd Qu.: 831580  
#>  Max.   :1325829
```

# — 1. Time Value of Money (TVM) Functions —

## fv_simple()

### Calculate the Future Value (FV) of a lump-sum investment (simple interest)

The fv_simple() function performs a ‘Simple Future Value’ calculation
with robust input validation. It takes three variables; Principal, Rate,
and Years, and returns the calculated value.

Simple Future Value - $FV = PV * (1 + r)^n$

``` r
library(SimpleFinCalc)
# With user provided variables:
testP<-1000
testR<-5
testY<-10
fv_simple(testP,testR,testY)
#> [1] 1628.895
# Therefore if a person had a Principal of $1000, at a Rate of .05% for 10 Years 
# they would have ~$1628.895 in the future!

# Using a record from the 'profiles1' data set

# Print the first record in the data set
profiles1[1,]
#>   Principal      Rate Years N_Compounding Future_Value_Input Start_Value
#> 1  457488.2 0.1350653    25             1            1039037    457488.2
#>   End_Value Start_Price End_Price
#> 1   1039037    457488.2   1039037

# Call the function using the 'profiles1[1]' data
fv_simple(profiles1$Principal[1],profiles1$Rate[1],profiles1$Years[1])
#> [1] 10861782
# Therefore if a person had a Principal of $457488.2, at a Rate of 0.13506535% 
# for 25 Years they would have ~$10861782.00 in the future!
```

## fv_compound()

### Calculate the Future Value (FV) of a lump-sum investment (compound interest).

The fv_compound() function performs a ‘Compound Future Value’
calculation with robust input validation. It takes four variables;
Principal, Rate, Years, and N_Compounds; then returns the calculated
value.

Compound Future Value - $FV = P * (1 + r/n)^(n*t)$

``` r
# With user provided variables:
testP<-1000
testR<-5
testY<-10
testN<-4
fv_compound(testP,testR,testY,testN)
#> [1] 1643.619
# Therefore if a person had a Principal of $1000, at a Rate of .05% for 10 Years, 
# that compounds 4 times a year; they would have ~$1643.619 in the future!

# Using a record from the 'profiles1' data set

# Print the first record in the data set
profiles1[1,]
#>   Principal      Rate Years N_Compounding Future_Value_Input Start_Value
#> 1  457488.2 0.1350653    25             1            1039037    457488.2
#>   End_Value Start_Price End_Price
#> 1   1039037    457488.2   1039037

# Call the function using the 'profiles1[1]' data
fv_compound(profiles1$Principal[1],profiles1$Rate[1],profiles1$Years[1],profiles1$N_Compounding[1])
#> [1] 10861782
# Therefore if a person had a Principal of $457488.2, at a Rate of 0.1350653% for 
# 25 Years, that compounds once a year; they would have ~$10861782.00 in the future!
```

## pv()

### Calculate the Present Value (PV) of a future sum of money.

The pv() function performs a ‘Present Value’ calculation with robust
input validation. It takes three variables; Future_Value_Input, Rate,
and Years; then returns the calculated value.

Present Value - $PV = FV / (1 + r)^n$

``` r
# With user provided variables:
testF<-10000
testR<-5
testY<-10
pv(testF,testR,testY)
#> [1] 6139.133
# Therefore if a person will have $10000 in the future, at an annual discount 
# Rate of .05%, receiving the money 10 Years from now; their money is worth 
# ~$6139.133 in the present!

# Using a record from the 'profiles1' data set

# Print the first record in the data set
profiles1[1,]
#>   Principal      Rate Years N_Compounding Future_Value_Input Start_Value
#> 1  457488.2 0.1350653    25             1            1039037    457488.2
#>   End_Value Start_Price End_Price
#> 1   1039037    457488.2   1039037

# Call the function using the 'profiles1[1]' data
pv(profiles1$Future_Value_Input[1],profiles1$Rate[1],profiles1$Years[1])
#> [1] 43763.29
# Therefore if a person will have $1039037 in the future, at an annual discount 
# Rate of 0.1350653%, receiving the money 25 Years from now; their money is worth 
# ~$43763.29 in the present!
```

## annuity_payment()

### Calculate the fixed annuity payment amount for a loan or investment.

The annuity_payment() function performs an ‘annuity_payment’ calculation
with robust input validation. It takes three variables; Principal, Rate,
and Years; then returns the calculated value. The regular annual payment
amount.

Fixed Annuity Payment - $payment = P * (r*(1 + r)^n)/((1 + r)^n-1)$

``` r
# With user provided variables:
testP<-1000
testR<-5
testY<-10
annuity_payment(testP,testR,testY)
#> [1] 129.5046
# Therefore if a person has $1000 in an annuity, at an annual Rate of .05%, 
# receiving payments for 10 Years; their regular payment is ~$129.5046!

# Using a record from the 'profiles1' data set

# Print the first record in the data set
profiles1[1,]
#>   Principal      Rate Years N_Compounding Future_Value_Input Start_Value
#> 1  457488.2 0.1350653    25             1            1039037    457488.2
#>   End_Value Start_Price End_Price
#> 1   1039037    457488.2   1039037

# Call the function using the 'profiles1[1]' data
annuity_payment(profiles1$Principal[1],profiles1$Rate[1],profiles1$Years[1])
#> [1] 64507.79
# Therefore if a person has $457488.2 in an annuity, at an annual Rate of 
# 0.1350653%, receiving payments for 25 Years; their regular payment is 
# ~$64507.79!
```

# — 2. Loan and Mortgage Calculation —

## loan_payment()

### Calculate the fixed monthly payment for a loan.

The loan_payment() function performs a ‘loan_payment’ calculation with
robust input validation. It takes three variables; Principal, Rate, and
Years; then returns the calculated value. The fixed monthly payment.

Monthly Loan Payment - $payment = P*(r*(1 + r)^n/((1+r)^n-1)$

``` r
# With user provided variables:
testP<-1000
testR<-5
testY<-10
loan_payment(testP,testR,testY)
#> [1] 10.60655
# Therefore if a person borrows $1000, at an annual Rate of .05%, 
# for 10 Years; their fixed monthly loan payment is ~$10.60655!

# Using a record from the 'profiles1' data set

# Print the first record in the data set
profiles1[1,]
#>   Principal      Rate Years N_Compounding Future_Value_Input Start_Value
#> 1  457488.2 0.1350653    25             1            1039037    457488.2
#>   End_Value Start_Price End_Price
#> 1   1039037    457488.2   1039037

# Call the function using the 'profiles1[1]' data
loan_payment(profiles1$Principal[1],profiles1$Rate[1],profiles1$Years[1])
#> [1] 5334.956
# Therefore if a person borrows $457488.2, at an annual Rate of 0.1350653%, 
# for 25 Years; their fixed monthly loan payment is ~$5334.956!
```

## amort_schedule()

### Create an amortization schedule data frame for a loan.

The ‘amort_schedule()’ function performs ‘amort_schedule’ calculations
with robust input validation. It takes three variables; Principal, Rate,
and Years; then returns A data frame showing the breakdown of each
payment.

The ‘amort_schedule’ function relies on two core formulas and a
sequential process:

Formula for the Fixed Monthly Payment (same as loan payment)

Monthly Loan Payment - $payment = P*(r*(1 + r)^n/((1+r)^n-1)$

Then, Formulas Used Within the Amortization Loop:

The function then iterates through each payment period (month) using a
for loop and applies three simple formulas for each row:

Interest Payment: $Interest = Beginning Balance * monthly rate$

Principal Paid: $Principal Paid = Payment - Interest$

Ending Balance: $Ending Balance = Beginning Balance - Principal Paid$

``` r
# With user provided variables:
testP<-1000
testR<-5
testY<-10
sched1<-amort_schedule(testP,testR,testY)
# The output is limited for space
head(sched1)
#>   Payment_No Beginning_Balance Payment Interest Principal_Paid Ending_Balance
#> 1          1           1000.00   10.61     4.17           6.44         993.56
#> 2          2            993.56   10.61     4.14           6.47         987.09
#> 3          3            987.09   10.61     4.11           6.49         980.60
#> 4          4            980.60   10.61     4.09           6.52         974.08
#> 5          5            974.08   10.61     4.06           6.55         967.53
#> 6          6            967.53   10.61     4.03           6.58         960.96

# Using a record from the 'profiles1' data set

# Print the first record in the data set
profiles1[1,]
#>   Principal      Rate Years N_Compounding Future_Value_Input Start_Value
#> 1  457488.2 0.1350653    25             1            1039037    457488.2
#>   End_Value Start_Price End_Price
#> 1   1039037    457488.2   1039037

# Call the function using the 'profiles1[1]' data
sched2<-amort_schedule(profiles1$Principal[1],profiles1$Rate[1],profiles1$Years[1])
# The output is limited for space
head(sched2)
#>   Payment_No Beginning_Balance Payment Interest Principal_Paid Ending_Balance
#> 1          1          457488.2 5334.96  5149.23         185.72       457302.5
#> 2          2          457302.5 5334.96  5147.14         187.82       457114.7
#> 3          3          457114.7 5334.96  5145.03         189.93       456924.8
#> 4          4          456924.8 5334.96  5142.89         192.07       456732.7
#> 5          5          456732.7 5334.96  5140.73         194.23       456538.5
#> 6          6          456538.5 5334.96  5138.54         196.41       456342.0
```

# — 3. Return and Growth Calculations —

## cagr()

### Calculate the Compound Annual Growth Rate (CAGR) of an investment.

The cagr() function performs a ‘cagr’ calculation with robust input
validation. It takes three variables; Start_Value, End_Value, and Years;
then returns the calculated value. The Compound Annual Growth Rate
(CAGR) of an investment as a decimal.

$CAGR = ((endvalue / startvalue)^(1 / years)) - 1$

``` r
# With user provided variables:
testSV<-1000
testEV<-15632
testY<-10
cagr(testSV,testEV,testY)
#> [1] 0.3164412
# Therefore if a person enters an investment worth $1000, and the investment is 
# worth $15632 after 10 Years; their CAGR is ~0.3164412!

# Using a record from the 'profiles1' data set

# Print the first record in the data set
profiles1[1,]
#>   Principal      Rate Years N_Compounding Future_Value_Input Start_Value
#> 1  457488.2 0.1350653    25             1            1039037    457488.2
#>   End_Value Start_Price End_Price
#> 1   1039037    457488.2   1039037

# Call the function using the 'profiles1[1]' data
cagr(profiles1$Start_Value[1],profiles1$End_Value[1],profiles1$Years[1])
#> [1] 0.0333562
# Therefore if a person enters an investment worth $457488.2, and the investment is 
# worth $1039037 after 25 Years; their CAGR is ~0.0333562!
```

## simple_return()

### Calculate the Simple Return (percentage change) of an investment.

The simple_return() function performs a ‘simple_return’ calculation with
robust input validation. It takes two variables; Start_Price and
End_Price; then returns the calculated value. The simple return as a
decimal (e.g., 0.10 for 10%).

$Simple Return = (endprice - startprice) / startprice$

``` r
# With user provided variables:
testSP<-1000
testEP<-15632
simple_return(testSP,testEP)
#> [1] 14.632
# Therefore if a person enters an investment that costs $1000, and the investment is 
# now worth $15632 their simple return rate is ~14.632!

# Using a record from the 'profiles1' data set

# Print the first record in the data set
profiles1[1,]
#>   Principal      Rate Years N_Compounding Future_Value_Input Start_Value
#> 1  457488.2 0.1350653    25             1            1039037    457488.2
#>   End_Value Start_Price End_Price
#> 1   1039037    457488.2   1039037

# Call the function using the 'profiles1[1]' data
simple_return(profiles1$Start_Price[1],profiles1$End_Price[1])
#> [1] 1.271178
# Therefore if a person enters an investment that costs $457488.2, and the investment is 
# now worth $1039037 their simple return rate is ~1.271178!
```
