
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SimpleFinCalc

<!-- badges: start -->

<!-- badges: end -->

The goal of SimpleFinCalc is to provide a straightforward suite of
functions for performing common financial calculations, making it an
excellent educational tool or quick-reference utility. It includes core
functions for analyzing the time value of money, such as computing
future and present values, as well as calculating loan payments. The
package also features a function for generating a full amortization
schedule, allowing users to easily break down loan payments into
principal and interest over time. By encapsulating complex financial
formulas into easy-to-use functions, SimpleFinCalc helps users perform
essential financial analyses without the need for manual calculations,
streamlining tasks for students, analysts, or anyone interested in
personal finance.

## Installation

You can install the development version of SimpleFinCalc from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("rwalshUSF/SimpleFinCalc")
```

## Example

This is a basic example which shows you how to solve a common financial
problem (Simple Future Value):

``` r
library(SimpleFinCalc)
data("profiles1")
# Using built in 'profiles1' data set to calculate simple future value:
fv_simple(profiles1$Principal[1],profiles1$Rate[1],profiles1$Years[1])
#> [1] 10861782
```

The ‘SimpleFinCalc’ R package includes a built in data set ‘profiles1’
to assist in the testing and demonstration of the many functions that
the packages includes. The data set is available when the package is
installed and the library is loaded in to the R working environment. The
data set can alo be referenced with the data() function.

Here is a summary of the variables in the built-in ‘profiles1’ data set:

``` r
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
