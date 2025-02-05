


# Basic model comparisons

You are now being asked to assess two (or more) models and decide "which is best". Here are some metrics we could use to compare models.

### Is the model appropriate?  LINE & influential outliers {.unnumbered}

There is no point comparing a model if one (or both) of them is not valid! So before carrying on, it's important to assess whether each of your models is valid in its own right. See the LINE tutorial for more.

1.  [**Linearity**]{.underline} **- COULD A CURVE FIT BETTER THAN A LINE?**
    -   *Assessed by visual inspection of the scatterplot and residual plot.* <br><br>
    -   If broken, apply a transformation to the RESPONSE and see if your new model does better <br><br>
2.  [**Independence**]{.underline} **- To be best of your knowledge, Is your sample representative of the overall population?** Are all the points independent of each other? Or do you have a "basketball team in your sample" situation (if you are trying to assess student height).
    -   *Assessed by visually looking for non-randomness (clusters/patterns) in your data and residual plot.* <br><br>
3.  [**Normality of residuals**]{.underline} **- Are your residuals normally distributed around the line of best fit? Or are they skewed in some way?**
    -   *Assessed by the qq-plot and normality tests*
    -   If broken apply a transformation to a/the PREDICTOR and see if your new model does better<br><br>
4.  [**Equal variance of residuals**]{.underline} **- no matter what your predictor/response - are your points around the same distance from the line? Or do you see "fanning out" / "bow-tie shapes"**
    -   *Assessed by visual inspection of residual plot and heteroskadisity F-test.*
    -   If broken apply a transformation to a/the PREDICTOR and see if your new model does better <br><br>

<br><br> 

### Coefficient of Determination $R^2$ {.unnumbered}

We could look first at the coefficient of variation for each model in the model summary. e.g. which model explains more variation in your response variable.

<br> 

#### Standard $R^2$ {.unnumbered}


The amount of variability explained by your model. e.g. 90% of the variability in building height can be explained by the number of floors it has.

#### Adjusted $R^2$ {.unnumbered}


This is more appropriate for multiple regression as it takes into account the number of predictors to prevent overfitting. Read this! <https://online.stat.psu.edu/stat501/lesson/10/10.3> and see the lecture on transformations/AIC.

#### Where to find them {.unnumbered}


The easiest way is in the olsrr summary. Look at the statistics at the top.


``` r
data("iris")
model <- lm(Sepal.Length~Sepal.Width,data=iris)
olsrr::ols_regress(model)
```

```
##                          Model Summary                           
## ----------------------------------------------------------------
## R                        0.118       RMSE                 0.820 
## R-Squared                0.014       MSE                  0.672 
## Adj. R-Squared           0.007       Coef. Var           14.120 
## Pred R-Squared          -0.011       AIC                371.992 
## MAE                      0.675       SBC                381.024 
## ----------------------------------------------------------------
##  RMSE: Root Mean Square Error 
##  MSE: Mean Square Error 
##  MAE: Mean Absolute Error 
##  AIC: Akaike Information Criteria 
##  SBC: Schwarz Bayesian Criteria 
## 
##                                ANOVA                                
## -------------------------------------------------------------------
##                Sum of                                              
##               Squares         DF    Mean Square      F        Sig. 
## -------------------------------------------------------------------
## Regression      1.412          1          1.412    2.074    0.1519 
## Residual      100.756        148          0.681                    
## Total         102.168        149                                   
## -------------------------------------------------------------------
## 
##                                   Parameter Estimates                                   
## ---------------------------------------------------------------------------------------
##       model      Beta    Std. Error    Std. Beta      t        Sig      lower    upper 
## ---------------------------------------------------------------------------------------
## (Intercept)     6.526         0.479                 13.628    0.000     5.580    7.473 
## Sepal.Width    -0.223         0.155       -0.118    -1.440    0.152    -0.530    0.083 
## ---------------------------------------------------------------------------------------
```


<br><br>

### MSE, RMSE, (root) mean squared error {.unnumbered}

This is the raw variability around the regression line in units of Y. You can see this as the residual mean squares in ANOVA, or at the summary at the top.

#### RMSE

Root mean squared error. Same thing but the square root (e.g. closer to the standard deviation)

<br><br>

### Information criteria:  AIC {.unnumbered}

(read more here: <https://online.stat.psu.edu/stat501/lesson/10/10.5>).

To compare regression models, some statistical software may also give values of statistics referred to as **information criterion** statistics. For regression models, these statistics combine information about the SSE, the number of parameters in the model, and the sample size. A low value, compared to values for other possible models, is good. Some data analysts feel that these statistics give a more realistic comparison of models than the 𝐶𝑝 statistic because 𝐶𝑝tends to make models seem more different than they actually are.

This is a non parametric test that takes into account the number of predictors and the amount of data, so is often more robust to bad linear fits than $R^2$ (which needs LINE to be true)

Three information criteria that we present are called **Akaike’s Information Criterion** (**AIC**), the **Bayesian Information Criterion** (**BIC**) (which is sometimes called **Schwartz’s Bayesian Criterion** (**SBC**)), and **Amemiya’s Prediction Criterion** (**APC**). The respective formulas are as follows:

![](images/Screenshot 2024-04-24 at 3.17.31 PM.png){width="70%"}

In the formulas, *n* = sample size and *p* = number of regression coefficients in the model being evaluated (including the intercept). Notice that the only difference between AIC and BIC is the multiplier of *p*, the number of parameters.

Each of the information criteria is used in a similar way — in comparing two models, the model with the lower value is preferred. The 'raw' values have little physical meaning. For now, know that the lower the AIC, the "better" the model.

Let's compare two models now, using our transformed data:


``` r
model                 <- lm(Sepal.Length~Sepal.Width,data=iris)
model.transformation  <- lm(Sepal.Length~sqrt(Sepal.Width),data=iris)

model1summary <- summary(model)
model2summary <- summary(model.transformation)

# Adjusted R2
paste("Model 1:",round(model1summary$adj.r.squared,2) )
```

```
## [1] "Model 1: 0.01"
```

``` r
paste("Model 2:",round(model2summary$adj.r.squared,2) )
```

```
## [1] "Model 2: 0.01"
```

``` r
# AIC
AIC(model,model.transformation)
```

```
##                      df      AIC
## model                 3 371.9917
## model.transformation  3 372.2743
```

# Multiple regression & model fitting

## MLR

This is very similar to simple regression, but you can add in extra predictors:

For example, this will predict sepal length, using TWO predictors (width and petal length).  See the MLR lecture for interpretation.


``` r
MLRmodel <- lm(Sepal.Length ~ Sepal.Width + Petal.Length ,data=iris)

ols_regress(MLRmodel)
```

```
##                          Model Summary                          
## ---------------------------------------------------------------
## R                       0.917       RMSE                 0.330 
## R-Squared               0.840       MSE                  0.109 
## Adj. R-Squared          0.838       Coef. Var            5.704 
## Pred R-Squared          0.834       AIC                101.025 
## MAE                     0.266       SBC                113.068 
## ---------------------------------------------------------------
##  RMSE: Root Mean Square Error 
##  MSE: Mean Square Error 
##  MAE: Mean Absolute Error 
##  AIC: Akaike Information Criteria 
##  SBC: Schwarz Bayesian Criteria 
## 
##                                 ANOVA                                 
## ---------------------------------------------------------------------
##                Sum of                                                
##               Squares         DF    Mean Square       F         Sig. 
## ---------------------------------------------------------------------
## Regression     85.840          2         42.920    386.386    0.0000 
## Residual       16.329        147          0.111                      
## Total         102.168        149                                     
## ---------------------------------------------------------------------
## 
##                                  Parameter Estimates                                   
## --------------------------------------------------------------------------------------
##        model     Beta    Std. Error    Std. Beta      t        Sig     lower    upper 
## --------------------------------------------------------------------------------------
##  (Intercept)    2.249         0.248                  9.070    0.000    1.759    2.739 
##  Sepal.Width    0.596         0.069        0.313     8.590    0.000    0.459    0.733 
## Petal.Length    0.472         0.017        1.006    27.569    0.000    0.438    0.506 
## --------------------------------------------------------------------------------------
```



# Finding the "optimal model"

## Best subsets

There are many models/combinations of predictors that we could use to predict our response variable. We want to find the best model possible, but we also don\'t want to overfit.

So far, we manually compared two models. In fact there is a way to compare all the combinations of predictors. This is using the `ols_step_best_subset()` command.

Describe what the \"best subset\" method is doing. Hint, we will go over this in lectures, but also <https://online.stat.psu.edu/stat501/lesson/10/10.3>

First, decide every predictor you think might be useful and create a model using this.  

FOR YOUR PROJECT, CHOOSE 8 PREDICTORS MAX (or R takes too long)



``` r
FullModel <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species ,data=iris)


BestSubsets <- ols_step_best_subset(FullModel)
BestSubsets
```

So now we can find a model that seems to have the lowest AIC, the highest R2 etc.  BUT YOU STILL HAVE TO CHECK FOR LINE!


