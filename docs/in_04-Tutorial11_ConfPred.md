



# Confidence and Prediction Intervals

## What are they?

Essentially these are two different things:

**Confidence interval:** "Error bar" on the location of the regression line at any specific value of x, or "what is the uncertainty on the population mean of $y$, for a specific value of $x$?"

**Prediction interval:** Predicting the range of likely y-values for a new data-point, or "if you had to put a new dot on the scatterplot, what range of y values would it likely be found in

These are described in detail here:

-   <https://online.stat.psu.edu/stat462/node/125/>
-   <https://online.stat.psu.edu/stat462/node/126/>
-   <https://online.stat.psu.edu/stat462/node/127/>
-   <https://online.stat.psu.edu/stat462/node/128/>

In R, lets look at the pirate dataset


```r
#For our pirate weight/height dataset
lm.pirate <- lm(weight~height,data=pirates)
summary(lm.pirate)
```

```
## 
## Call:
## lm(formula = weight ~ height, data = pirates)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -12.3592  -2.6564  -0.0708   2.7275  11.1451 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -68.87722    1.71250  -40.22   <2e-16 ***
## height        0.81434    0.01003   81.16   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.928 on 998 degrees of freedom
## Multiple R-squared:  0.8684,	Adjusted R-squared:  0.8683 
## F-statistic:  6587 on 1 and 998 DF,  p-value: < 2.2e-16
```

## Calculating a confidence interval

**What are the AVERAGE WEIGHTS (and uncertainty on our estimate) of pirates whose heights are 150cm and 170cm?**


```r
# So we have the MODEL
lm.pirate <- lm(weight~height,data=pirates)


# a mini table of our new X-Values - you need the column name to be identical to your predictor
new.pirates <- data.frame(height=c(150,170))


# and the command
# predict (MODEL_NAME ,  NAME_OF_NEW_DATA,  TYPE_OF_INTERVAL, SIG LEVEL)
predict(lm.pirate,newdata=new.pirates,interval="confidence",level=0.95)
```

```
##        fit      lwr      upr
## 1 53.27345 52.80652 53.74037
## 2 69.56020 69.31640 69.80400
```

We are 95% certain that on average, the AVERAGE weight of pirates who are 150cm tall falls between 52.8 Kg and 53.74 Kg.

We are 95% certain that on average, the AVERAGE weight of pirates who are 170cm tall falls between 69.32 Kg and 69.80 Kg.

## Calculating a prediction interval

**A new pirate joins and her height is 160cm. What range of weights is she likely to have? with a significance level of 99%**


```r
# So we have the MODEL
lm.pirate <- lm(weight~height,data=pirates)


# a mini table of our new X-Values - you need the column name to be identical to your predictor
new.pirates <- data.frame(height=c(160))


# and the command
# predict (MODEL_NAME ,  NAME_OF_NEW_DATA,  TYPE_OF_INTERVAL, SIG LEVEL)
predict(lm.pirate,newdata=new.pirates,interval="predict",level=0.99)
```

```
##        fit      lwr      upr
## 1 61.41682 51.27067 71.56298
```

Given our model, her weight is likely to be somewhere between 51.27 Kg and 71.56 Kg with 99% certainty.



