

# Probability distributions

## What are they?  Full info

We have talked about several distributions and tests so far in the lab. To see the help files for most of them, see `?Distributions`.

<details>

<summary>[Expand to see the current list]{style="color: #1388aa;"}</summary>

-   **For the normal distribution see [`dnorm`](http://127.0.0.1:16033/help/library/stats/help/dnorm).**

-   **For the Poisson distribution see [`dpois`](http://127.0.0.1:16033/help/library/stats/help/dpois).**

-   **For the Student's t distribution see [`dt`](http://127.0.0.1:16033/help/library/stats/help/dt).**

-   **For the uniform distribution see [`dunif`](http://127.0.0.1:16033/help/library/stats/help/dunif).**

-   For the beta distribution see [`dbeta`](http://127.0.0.1:16033/help/library/stats/help/dbeta).

-   For the binomial (including Bernoulli) distribution see [`dbinom`](http://127.0.0.1:16033/help/library/stats/help/dbinom).

-   For the Cauchy distribution see [`dcauchy`](http://127.0.0.1:16033/help/library/stats/help/dcauchy).

-   For the chi-squared distribution see [`dchisq`](http://127.0.0.1:16033/help/library/stats/help/dchisq).

-   For the exponential distribution see [`dexp`](http://127.0.0.1:16033/help/library/stats/help/dexp).

-   For the F distribution see [`df`](http://127.0.0.1:16033/help/library/stats/help/df).

-   For the gamma distribution see [`dgamma`](http://127.0.0.1:16033/help/library/stats/help/dgamma).

-   For the geometric distribution see [`dgeom`](http://127.0.0.1:16033/help/library/stats/help/dgeom). (This is also a special case of the negative binomial.)

-   For the hypergeometric distribution see [`dhyper`](http://127.0.0.1:16033/help/library/stats/help/dhyper).

-   For the log-normal distribution see [`dlnorm`](http://127.0.0.1:16033/help/library/stats/help/dlnorm).

-   For the multinomial distribution see [`dmultinom`](http://127.0.0.1:16033/help/library/stats/help/dmultinom).

-   For the negative binomial distribution see [`dnbinom`](http://127.0.0.1:16033/help/library/stats/help/dnbinom).

-   For the Weibull distribution see [`dweibull`](http://127.0.0.1:16033/help/library/stats/help/dweibull).

-   For less common distributions of test statistics see [`pbirthday`](http://127.0.0.1:16033/help/library/stats/help/pbirthday), [`dsignrank`](http://127.0.0.1:16033/help/library/stats/help/dsignrank), [`ptukey`](http://127.0.0.1:16033/help/library/stats/help/ptukey) and [`dwilcox`](http://127.0.0.1:16033/help/library/stats/help/dwilcox) (and see the ‘See Also’ section of [`cor.test`](http://127.0.0.1:16033/help/library/stats/help/cor.test)).

<br>

</details>

<br>

## The normal distribution {#T5_NormalDist}

Remember as we discussed in lectures, we normally state that a variable modelled using by a normal distribution is described by:

X∼N(μ,σ^2^)

In this expression:

-   X is the random variable.

-   ∼ means "is distributed as."

-   N represents the normal distribution.

-   μ is the mean of the distribution.

-   σ^2^ is the VARIANCE of the distribution.

**In R commands, you need the standard deviation instead. (you can google how to get the sd from the variance if you have forgotten)**

<br>

### Help file

To see the help file for all normal related functions:


``` r
?Normal
```

<br>

### Generate a random sample

To generate a random sample from a normal distribution we use rnorm:


``` r
# random sample of size 100
sample.normal <- rnorm(n=100,mean=4,sd=2)
```

<br>

### Calculate probability when given a z-score

To calculate a z score from your sample/population, you can use R as a calculator.

To calculate the probability of greater/lesser than a value in a given normal distribution (e.g. you can use this as an interactive table)


``` r
# probability of less than 1.7 in a normal distribution with mean 4 and standard deviation = 2 
pnorm(1.7,mean=4,sd=2,lower.tail = TRUE)
```

```
## [1] 0.1250719
```

``` r
# probability of GREATER than 1.8 in a normal distribution with mean 4 and VARIANCE = 9
1 - pnorm(1,mean=4,sd=3,lower.tail = TRUE)
```

```
## [1] 0.8413447
```

``` r
# or
pnorm(1,mean=4,sd=2,lower.tail = FALSE)
```

```
## [1] 0.9331928
```

<br>

### Calculate z-score when given a probability

Inversely, to calculate the z-score for a given probability


``` r
# what value is less than 60% of the data?
qnorm(0.6,mean=4,sd=2,lower.tail = TRUE)
```

```
## [1] 4.506694
```

``` r
# what value is greater than 80% of the data?
qnorm(0.8,mean=4,sd=2,lower.tail = FALSE)
```

```
## [1] 2.316758
```

<br><br>

### Testing normality

#### Wilks Shapiro test for normality

To test for normality:

First, have a look at the histogram! Here is the code for the Shapiro-Wilk test.


``` r
shapiro.test(HousesNY$Price)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  HousesNY$Price
## W = 0.96341, p-value = 0.1038
```

There are many online tutorials for interpretation

<br>

####  QQ-Norm plot

You can also make a QQ-Norm plot. Instal the ggpubr package, add it to your library code chunk and run.


``` r
library(ggpubr)
ggqqplot(HousesNY$Price,col="blue")
```

YOU CAN INTERPRET IT HERE: <https://www.learnbyexample.org/r-quantile-quantile-qq-plot-base-graph/>

<br><br>

## T-distribution {#TDist}

What even is this? See this nice resource: <https://365datascience.com/tutorials/statistics-tutorials/students-t-distribution/>

To see the help file for all these:


``` r
?TDist
```

### Calculate a probability given a T-Statistic

To calculate a t-statistic from your sample/population, you can use R as a calculator. To calculate the probability of greater/lesser than a value in a given t-distribution (e.f. you can use this as an interactive t-table)


``` r
# probability of seeing less than 1.7 in a  t-distribution 
# with 20 degrees of freedom
pt(1.55,df=20,lower.tail = TRUE)
```

```
## [1] 0.9315892
```

<br>

### Calculate a T-Statistic for a given probability

To calculate the value for a given probability


``` r
# what value is greater than 90% of the data in a t-distribution with df=25
qt(0.9,df=25,lower.tail = TRUE)
```

```
## [1] 1.316345
```

<br>

### One sided T-test

To conduct a full t-test on some data:


``` r
# Conduct a two-sided t-test where we think that the data comes from a T-distribution with mean 100.
t.test(HousesNY$Price,mu=100,alternative="two.sided")
```

```
## 
## 	One Sample t-test
## 
## data:  HousesNY$Price
## t = 2.3954, df = 52, p-value = 0.02024
## alternative hypothesis: true mean is not equal to 100
## 95 percent confidence interval:
##  102.2125 125.0516
## sample estimates:
## mean of x 
##  113.6321
```

or see the detailed tutorial here: <http://www.sthda.com/english/wiki/one-sample-t-test-in-r> for one-sample

and here for comparing two samples: <http://www.sthda.com/english/wiki/unpaired-two-samples-t-test-in-r>

<br><br>

## Others?

More to come later.. but they all follow the same format
