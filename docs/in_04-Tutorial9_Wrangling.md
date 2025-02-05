

# Data Wrangling {#T9_wrangling}

## Example datasets

Here I will show a few examples for the houses dataset we were using in lectures. I will also use a separate dataset on spring frost dates.



<br><br>

## Looking at the data itself {#T9_basics}

To have a look at the data there are many options. You can:

-   Click on its NAME in the environment tab (not the blue arrow)

    <br>

-   Type its name into the console or into a code chunk

    -   (e.g. I would type, type `HousesNY` into the console or a code chunk)

        <br>

-   Run the command `View(tablename)` IN THE CONSOLE

    -   (View is a command from the tidyverse package).<br>

    -   This will open the data in a new tab.

        <br>

-   Run the command `head(``tablename``)` to see the first 6 lines or so (good for quick checks)

    <br>

-   Run the command `glimpse(``tablename``)` to get a nice summary.

    <br>

-   Run the command `names(``tablename``)` to get the column names.

### Example


``` r
# Note, there are sometimes more columns to the right, use the arrow to see
head(HousesNY)
```

```
##   Price Beds Baths  Size  Lot
## 1  57.6    3     2 0.960 1.30
## 2 120.0    6     2 2.786 0.23
## 3 150.0    4     2 1.704 0.27
## 4 143.0    3     2 1.200 0.80
## 5  92.5    3     1 1.329 0.42
## 6  50.0    2     1 0.974 0.34
```

To see what the column names are, you can use the `names(dataset)` command


``` r
names(HousesNY)
```

```
## [1] "Price" "Beds"  "Baths" "Size"  "Lot"
```

Or the glimpse command:


``` r
glimpse(HousesNY)
```

```
## Rows: 53
## Columns: 5
## $ Price <dbl> 57.6, 120.0, 150.0, 143.0, 92.5, 50.0, 89.0, 140.0, 197.5, 125.1…
## $ Beds  <int> 3, 6, 4, 3, 3, 2, 2, 4, 4, 3, 3, 3, 3, 4, 3, 3, 4, 3, 4, 3, 4, 4…
## $ Baths <dbl> 2.0, 2.0, 2.0, 2.0, 1.0, 1.0, 2.0, 3.0, 2.5, 2.0, 2.0, 1.0, 2.0,…
## $ Size  <dbl> 0.960, 2.786, 1.704, 1.200, 1.329, 0.974, 1.029, 2.818, 2.268, 1…
## $ Lot   <dbl> 1.30, 0.23, 0.27, 0.80, 0.42, 0.34, 0.29, 0.21, 1.00, 0.30, 1.30…
```

To see how many columns and rows there are, you can use the `nrow()` and `ncol()` commands


``` r
nrow(HousesNY)
```

```
## [1] 53
```

``` r
ncol(HousesNY)
```

```
## [1] 5
```

------------------------------------------------------------------------

<br><br>

## Summary statistics

To look at the summaries there are a load of options. Choose your favourites:

-   `summary(dataset)`
-   `skim(dataset)` in the skimr package
-   `summarize(dataset)` in the papeR package. This looks pretty powerful, I'm just learning it

None are better or worse than others - simply choose what works for you in the moment.


``` r
summary(HousesNY)
```

```
##      Price            Beds           Baths            Size      
##  Min.   : 38.5   Min.   :2.000   Min.   :1.000   Min.   :0.712  
##  1st Qu.: 82.7   1st Qu.:3.000   1st Qu.:1.500   1st Qu.:1.296  
##  Median :107.0   Median :3.000   Median :2.000   Median :1.528  
##  Mean   :113.6   Mean   :3.396   Mean   :1.858   Mean   :1.678  
##  3rd Qu.:141.0   3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:2.060  
##  Max.   :197.5   Max.   :6.000   Max.   :3.500   Max.   :3.100  
##       Lot        
##  Min.   :0.0000  
##  1st Qu.:0.2700  
##  Median :0.4200  
##  Mean   :0.7985  
##  3rd Qu.:1.1000  
##  Max.   :3.5000
```


``` r
library(skimr) # you would need to install this
skim(HousesNY)
```


Table: (\#tab:unnamed-chunk-7)Data summary

|                         |         |
|:------------------------|:--------|
|Name                     |HousesNY |
|Number of rows           |53       |
|Number of columns        |5        |
|_______________________  |         |
|Column type frequency:   |         |
|numeric                  |5        |
|________________________ |         |
|Group variables          |None     |


**Variable type: numeric**

|skim_variable | n_missing| complete_rate|   mean|    sd|    p0|   p25|    p50|    p75|  p100|hist  |
|:-------------|---------:|-------------:|------:|-----:|-----:|-----:|------:|------:|-----:|:-----|
|Price         |         0|             1| 113.63| 41.43| 38.50| 82.70| 107.00| 141.00| 197.5|▃▇▅▃▃ |
|Beds          |         0|             1|   3.40|  0.79|  2.00|  3.00|   3.00|   4.00|   6.0|▂▇▆▁▁ |
|Baths         |         0|             1|   1.86|  0.65|  1.00|  1.50|   2.00|   2.00|   3.5|▅▇▁▁▁ |
|Size          |         0|             1|   1.68|  0.60|  0.71|  1.30|   1.53|   2.06|   3.1|▃▇▅▂▂ |
|Lot           |         0|             1|   0.80|  0.76|  0.00|  0.27|   0.42|   1.10|   3.5|▇▃▂▁▁ |


``` r
library(pillar) # you would need to install this
glimpse(HousesNY)
```

```
## Rows: 53
## Columns: 5
## $ Price <dbl> 57.6, 120.0, 150.0, 143.0, 92.5, 50.0, 89.0, 140.0, 197.5, 125.1…
## $ Beds  <int> 3, 6, 4, 3, 3, 2, 2, 4, 4, 3, 3, 3, 3, 4, 3, 3, 4, 3, 4, 3, 4, 4…
## $ Baths <dbl> 2.0, 2.0, 2.0, 2.0, 1.0, 1.0, 2.0, 3.0, 2.5, 2.0, 2.0, 1.0, 2.0,…
## $ Size  <dbl> 0.960, 2.786, 1.704, 1.200, 1.329, 0.974, 1.029, 2.818, 2.268, 1…
## $ Lot   <dbl> 1.30, 0.23, 0.27, 0.80, 0.42, 0.34, 0.29, 0.21, 1.00, 0.30, 1.30…
```

or


``` r
str(HousesNY)
```

```
## 'data.frame':	53 obs. of  5 variables:
##  $ Price: num  57.6 120 150 143 92.5 ...
##  $ Beds : int  3 6 4 3 3 2 2 4 4 3 ...
##  $ Baths: num  2 2 2 2 1 1 2 3 2.5 2 ...
##  $ Size : num  0.96 2.79 1.7 1.2 1.33 ...
##  $ Lot  : num  1.3 0.23 0.27 0.8 0.42 0.34 0.29 0.21 1 0.3 ...
```

To see what the column names are, you can use the names(dataset) command


``` r
names(HousesNY)
```

```
## [1] "Price" "Beds"  "Baths" "Size"  "Lot"
```

To print the first few rows


``` r
head(HousesNY)
```

```
##   Price Beds Baths  Size  Lot
## 1  57.6    3     2 0.960 1.30
## 2 120.0    6     2 2.786 0.23
## 3 150.0    4     2 1.704 0.27
## 4 143.0    3     2 1.200 0.80
## 5  92.5    3     1 1.329 0.42
## 6  50.0    2     1 0.974 0.34
```

To find the number of rows and columns


``` r
nrow(HousesNY)
```

```
## [1] 53
```

``` r
ncol(HousesNY)
```

```
## [1] 5
```

``` r
#or both dimensions
dim(HousesNY)
```

```
## [1] 53  5
```

Or you can do things manually, using the \$ symbol to choose a column. All of this is for the price column


``` r
mean(HousesNY$Price)
```

```
## [1] 113.6321
```

``` r
median(HousesNY$Price)
```

```
## [1] 107
```

``` r
mode(HousesNY$Price)
```

```
## [1] "numeric"
```

``` r
sd(HousesNY$Price)
```

```
## [1] 41.43006
```

``` r
var(HousesNY$Price)
```

```
## [1] 1716.45
```

``` r
IQR(HousesNY$Price)
```

```
## [1] 58.3
```

``` r
range(HousesNY$Price)
```

```
## [1]  38.5 197.5
```


------------------------------------------------------------------------

<br><br>


## Removing missing values {#Missing}

### na.omit

The na.omit command will remove any row with ANY missing value. 

Note I'm overwriting my variable HousesNY with the new one. It's up to you if you want to do this or make a new variable


``` r
HousesNY <- na.omit(HousesNY)
```

<br><br>

### Missing values in single columns, complete.cases

If you want to only remove rows with missing values in a single column, we can use the complete cases command



``` r
HousesNY <- HousesNY[complete.cases(HousesNY$Price), ]
```

E.g. take the HousesNY table and ONLY include values where the price data is not missing.   Note, this can be any column name at all.

<br><br>


### Turning values into NA

Sometimes, you have -999 or something as your missing mark.  R expects them to be NA.  

You can apply a RULE using the filter command below or like this to make them actually NAs


``` r
HousesNY$Price[HousesNY$Price < 0]   <- NA
```

E.g. here I select all the prices that are less than 0 (e.g impossible) and set them to NA.


<br>

## Ignoring missing data in commands


There are missing values in some datasets - and by default, R will set the answer to statistics to also be missing.


``` r
# Create some test data
test <- data.frame(A=c(1,3,4),
                   B=c(NA,3,1))
print(test)
```

```
##   A  B
## 1 1 NA
## 2 3  3
## 3 4  1
```


``` r
# Take the mean of column B
mean(test$B)
```

```
## [1] NA
```

``` r
# Take the correlation between A and B
cor(test$A,test$B)
```

```
## [1] NA
```

To ignore them in a given command, try adding ,na.rm=TRUE to the command e.g.


``` r
mean(test$B, na.rm=TRUE)
```

```
## [1] 2
```

or sometimes I look in the help file (or on google) for a slightly different terminology.


``` r
#the cor command doesn't follow the pattern.

cor(test$A,test$B,use = "complete.obs")
```

```
## [1] -1
```



## Making frequency tables

Sometimes we want to see how many rows there are in different categories. The easiest way to do this is using the table command. For example, in our New York data, we can see how many houses there are with each number of beds using


``` r
table(HousesNY$Beds)
```

```
## 
##  2  3  4  5  6 
##  5 26 19  2  1
```

So there are 19 rows in our dataset where the Beds column says 4 (AKA 19 houses in our sample with 4 beds). Or we can look at a 2 dimensional table


``` r
table(HousesNY$Beds, HousesNY$Baths)
```

```
##    
##      1 1.5  2 2.5  3 3.5
##   2  2   0  3   0  0   0
##   3  8   3 14   0  1   0
##   4  3   1 10   1  3   1
##   5  0   0  1   0  0   1
##   6  0   0  1   0  0   0
```

So there are 10 houses with 4 beds and 2 baths

To make these look more professional there are a number of packages you can install and use. For example, ztable will take the output of table and format it in a pretty way. This will look TERRIBLE when you run R as it's making html code. But when you press knit it will look beautiful


``` r
# don't include the install line in your code, run it in the console
# install.package("ztable")

library(ztable)
library(magrittr)
options(ztable.type="html")

mytable <- table(HousesNY$Beds, HousesNY$Baths)

my_ztable =ztable(mytable) 
print(my_ztable,caption="Table 1. Basic Table")
```

<head><style>
        table {
              font-family: times ;
color:  black ;
text-align: right;}
        th {
              padding: 1px 1px 5px 5px;
	        }
        td {
             padding: 1px 1px 5px 5px; }
      </style></head><table align="center" style="border-collapse: collapse; caption-side:top; font-size:11pt;"><caption style="text-align:center;">Table 1. Basic Table</caption><tr>
<th style="border-left: 0px solid black;background-color: #FFFFFF;border-top: 2px solid gray;border-bottom: 1px solid gray;">&nbsp;</th>
<th <th align="center" style="font-weight: normal;border-left: 0px solid black;border-bottom: 1px solid gray;border-top: 2px solid gray;">1</th>
<th <th align="center" style="font-weight: normal;border-left: 0px solid black;border-bottom: 1px solid gray;border-top: 2px solid gray;">1.5</th>
<th <th align="center" style="font-weight: normal;border-left: 0px solid black;border-bottom: 1px solid gray;border-top: 2px solid gray;">2</th>
<th <th align="center" style="font-weight: normal;border-left: 0px solid black;border-bottom: 1px solid gray;border-top: 2px solid gray;">2.5</th>
<th <th align="center" style="font-weight: normal;border-left: 0px solid black;border-bottom: 1px solid gray;border-top: 2px solid gray;">3</th>
<th <th align="center" style="font-weight: normal;border-left: 0px solid black;border-right:0px solid black;border-bottom: 1px solid gray;border-top: 2px solid gray;">3.5</th>
</tr>
<tr>
<td  style="border-left: 0px solid black; ">2</td>
<td align="right" style="border-left: 0px solid black;">  2</td>
<td align="right" style="border-left: 0px solid black;">  0</td>
<td align="right" style="border-left: 0px solid black;">  3</td>
<td align="right" style="border-left: 0px solid black;">  0</td>
<td align="right" style="border-left: 0px solid black;">  0</td>
<td align="right" style="border-left: 0px solid black;border-right:0px solid black;">  0</td>
</tr>
<tr>
<td  style="border-left: 0px solid black; border-top: hidden;">3</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  8</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  3</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;"> 14</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  0</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  1</td>
<td align="right" style="border-left: 0px solid black;border-right:0px solid black;border-top: hidden;">  0</td>
</tr>
<tr>
<td  style="border-left: 0px solid black; border-top: hidden;">4</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  3</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  1</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;"> 10</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  1</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  3</td>
<td align="right" style="border-left: 0px solid black;border-right:0px solid black;border-top: hidden;">  1</td>
</tr>
<tr>
<td  style="border-left: 0px solid black; border-top: hidden;">5</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  0</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  0</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  1</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  0</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  0</td>
<td align="right" style="border-left: 0px solid black;border-right:0px solid black;border-top: hidden;">  1</td>
</tr>
<tr>
<td  style="border-left: 0px solid black; border-top: hidden;">6</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  0</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  0</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  1</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  0</td>
<td align="right" style="border-left: 0px solid black;border-top: hidden;">  0</td>
<td align="right" style="border-left: 0px solid black;border-right:0px solid black;border-top: hidden;">  0</td>
</tr>
<tr>
<td colspan="7" align="left" style="font-size:9pt ;border-top: 1px solid black; border-bottom: hidden;"></td>
</tr>
</table>

<br><br>




## Wrangling basics {#WrangleBasics}


### Selecting a specific column

Here I am using the NYHouses data as an example. Sometimes we want to deal with only one specific column in our spreadsheet/dataframe, for example applying the mean/standard deviation/inter-quartile range command to say just the Price column.

To do this, we use the \$ symbol. For example, here I'm simply selecting the data in the elevation column only and saving it to a new variable called elevationdata.


``` r
data("HousesNY")
price <- HousesNY$Price

price
```

Try it yourself. You should have seen that as you typed the \$, it gave you all the available column names to choose from.

This means we can now easily summarise specific columns. For example:

-   `summary(HousesNY)` will create a summary of the whole spreadsheet,
-   `summary(HousesNY$Price)` will only summarise the Price column.\
-   `mean(HousesNY$Price)` will take the mean of the Price column in the HousesNY dataframe.

<br><br>


### Choosing values from rows and columns

Sometimes, we do not want to analyse at the entire data.frame. Instead, we would like to only look at one (or more) columns or rows.

There are several ways we can select data.

-   To choose a specific column, we can use the `$` symbol to select its name (as described above)

-   If you know which number rows or columns you want, you can use **square brackets** to numerically select data.

Essentially our data follows the format: tablename$$ROWS,COLUMNS$$


``` r
# reading in some new data
frost    <- readxl::read_excel("Data_frostdata.xlsx")

# This will select the data in the 5th row and 7th column
frost[5,7]
```

```
## # A tibble: 1 × 1
##   Elevation
##       <dbl>
## 1       195
```

``` r
# This will select the 2nd row and ALL the columns 
frost[2,]
```

```
## # A tibble: 1 × 8
##   Station State Type_Fake Avg_DOY_SpringFrost Latitude Longitude Elevation
##   <chr>   <chr> <chr>                   <dbl>    <dbl>     <dbl>     <dbl>
## 1 Union   AL    City                     82.3     32.0     -85.8       440
## # ℹ 1 more variable: Dist_to_Coast <dbl>
```

``` r
# This will select the 3rd column and ALL the rows
frost[,3]
```

```
## # A tibble: 76 × 1
##    Type_Fake                    
##    <chr>                        
##  1 City                         
##  2 City                         
##  3 Airport                      
##  4 City                         
##  5 City                         
##  6 City                         
##  7 City                         
##  8 City                         
##  9 Agricultural_Research_Station
## 10 Agricultural_Research_Station
## # ℹ 66 more rows
```

``` r
# similar to using its name
frost$Type_Fake
```

```
##  [1] "City"                          "City"                         
##  [3] "Airport"                       "City"                         
##  [5] "City"                          "City"                         
##  [7] "City"                          "City"                         
##  [9] "Agricultural_Research_Station" "Agricultural_Research_Station"
## [11] "Agricultural_Research_Station" "Airport"                      
## [13] "Airport"                       "City"                         
## [15] "City"                          "Airport"                      
## [17] "City"                          "Airport"                      
## [19] "City"                          "Airport"                      
## [21] "City"                          "City"                         
## [23] "City"                          "Airport"                      
## [25] "Agricultural_Research_Station" "City"                         
## [27] "City"                          "City"                         
## [29] "Airport"                       "Agricultural_Research_Station"
## [31] "Airport"                       "City"                         
## [33] "City"                          "City"                         
## [35] "Airport"                       "Agricultural_Research_Station"
## [37] "City"                          "City"                         
## [39] "City"                          "Agricultural_Research_Station"
## [41] "Agricultural_Research_Station" "City"                         
## [43] "City"                          "Airport"                      
## [45] "Airport"                       "Airport"                      
## [47] "Agricultural_Research_Station" "City"                         
## [49] "City"                          "City"                         
## [51] "City"                          "Agricultural_Research_Station"
## [53] "Agricultural_Research_Station" "Agricultural_Research_Station"
## [55] "Airport"                       "City"                         
## [57] "Airport"                       "City"                         
## [59] "Airport"                       "City"                         
## [61] "Agricultural_Research_Station" "Airport"                      
## [63] "Agricultural_Research_Station" "City"                         
## [65] "City"                          "City"                         
## [67] "City"                          "Airport"                      
## [69] "Airport"                       "Agricultural_Research_Station"
## [71] "Airport"                       "City"                         
## [73] "Airport"                       "Airport"                      
## [75] "City"                          "Agricultural_Research_Station"
```

``` r
# We can combine our commands, this will print the 13th row of the Longitude column 
# (no comma as we're only looking at one column)
frost$Longitude[13]
```

```
## [1] -82.58
```

``` r
# The : symbol lets you choose a sequence of numbers e.g. 1:5 is 1 2 3 4 5
# So this prints out rows 11 to 15 and all the columns
frost[11:15,]
```

```
## # A tibble: 5 × 8
##   Station  State Type_Fake      Avg_DOY_SpringFrost Latitude Longitude Elevation
##   <chr>    <chr> <chr>                        <dbl>    <dbl>     <dbl>     <dbl>
## 1 Winthrop SC    Agricultural_…                87.2     34.9     -81.0       690
## 2 Little   SC    Airport                       87.7     34.2     -81.4       711
## 3 Calhoun  SC    Airport                       91.5     34.1     -82.6       530
## 4 Clemson  SC    City                          93.6     34.7     -82.8       824
## 5 De       FL    City                          71.3     30.7     -86.1       245
## # ℹ 1 more variable: Dist_to_Coast <dbl>
```

``` r
# The "c" command allows you to enter whatever numbers you like.  
# So this will print out rows 4,3,7 and the "Elevation" and "Dist_to_Coast" columns
frost[c(4,3,7), c("Elevation","Dist_to_Coast")]
```

```
## # A tibble: 3 × 2
##   Elevation Dist_to_Coast
##       <dbl>         <dbl>
## 1        13          1.15
## 2       800        252.  
## 3       500        132.
```


### Deleting rows

Or if you know the row number you can use the minus - sign to remove. Or just filter below.


``` r
# remove row 6 and and overwrite
frost <- frost[-6 ,]

# remove columns 4 and 2 and save result to newdata and overwrite
newdata <- frost[, - c(2,4) ]
```

<br><br>

## Filtering {#WrangleFilter}

### The which command approach

The which command essentially says "which numbers" meet a certain threshold

e,g,


``` r
a <- 100:110
which(a > 107)
```

```
## [1]  9 10 11
```

Or which rows:


``` r
outlier_rows <- which(frost$Dist_to_Coast < 1.5)
```

So you can also add questions and commands inside the square brackets. For example here is the weather station with the lowest elevation. You can see my command chose BOTH rows where elevation = 10.


``` r
# which row has the lowest elevation
# note the double == (more below)
row_number <- which(frost$Elevation == min(frost$Elevation))

# choose that row
loweststtation <- frost[row_number ,  ]
loweststtation
```

```
## # A tibble: 2 × 8
##   Station     State Type_Fake   Avg_DOY_SpringFrost Latitude Longitude Elevation
##   <chr>       <chr> <chr>                     <dbl>    <dbl>     <dbl>     <dbl>
## 1 Charlestown SC    Agricultur…                84.6     32.8     -79.9        10
## 2 Edenton     NC    City                       85.3     36.0     -76.6        10
## # ℹ 1 more variable: Dist_to_Coast <dbl>
```


``` r
seaside <- frost[which(frost$Dist_to_Coast < 10) ,  ]
seaside
```

```
## # A tibble: 5 × 8
##   Station     State Type_Fake   Avg_DOY_SpringFrost Latitude Longitude Elevation
##   <chr>       <chr> <chr>                     <dbl>    <dbl>     <dbl>     <dbl>
## 1 Fernandina  FL    City                       46.9     30.7     -81.5        13
## 2 Charlestown SC    Agricultur…                84.6     32.8     -79.9        10
## 3 Edenton     NC    City                       85.3     36.0     -76.6        10
## 4 Southport   NC    City                       82.8     33.9     -78.0        20
## 5 Brunswick   GA    Agricultur…                48.4     31.2     -81.5        13
## # ℹ 1 more variable: Dist_to_Coast <dbl>
```


### The dplyr filter command (tidyverse)

Filtering means selecting rows/observations based on their values. To filter in R, use the command `filter()` from the dplyr package. I tend to write it as `dplyr:filter()` to force it to be correct.

Here we can apply the filter command to choose specific rows that meet certain criteria


``` r
filter(frost, State == "FL")
```

The double equal operator `==` means equal to. The command is telling R to keep the rows in *frost* where the *State* column equals "FL".

If you want a few categories, choose the %in% operator, using the `c()` command to stick together the categories you want. For example, here are states in Florida and Virginia.


``` r
filter(frost, State %in% c("FL","VA"))
```

We can also explicitly exclude cases and keep everything else by using the not equal operator `!=`. The following code *excludes* airport stations.


``` r
filter(frost, Type_Fake != "Airport")
```

What about filtering if a row has a value greater than a specified value? For example, Stations with an elevation greater than 500 feet?


``` r
filter(frost, Elevation > 500)
```

Or less-than-or-equal-to 200 feet.


``` r
# or save the result to a new variable
lowland_stations <- filter(frost, Elevation < 200)
summary(lowland_stations)
```

<br>

In addition to comparison operators, filtering may also utilize logical operators that make multiple selections. There are three basic logical operators: `&` (and), `|` (or), and `!` (not). We can keep Stations with an *Elevation* greater than 300 **and** *State* in Alabama `&`.


``` r
filter(frost, Elevation > 300 & State == "AL")
```

Use `|` to keep Stations with a *Type_Fake* of "Airport" **or** a last spring frost date after April (\~ day 90 of the year).


``` r
filter(frost, Type_Fake == "Airport" | Avg_DOY_SpringFrost > 90 )
```


<br><br>


### "Group_by" command: statistics per group

What if we want to do more than just count the number of rows?

Well, we can use the `group_by()` and `summarise()` commands and save our answers to a new variable.

Here we are making use of the pipe symbol, %\>%, which takes the answer from group_by and sends it directly to the summarise command.

Here is some data on frost dates at weather stations.


``` r
frost    <- readxl::read_excel("Data_frostdata.xlsx")
head(frost)
```

```
## # A tibble: 6 × 8
##   Station    State Type_Fake Avg_DOY_SpringFrost Latitude Longitude Elevation
##   <chr>      <chr> <chr>                   <dbl>    <dbl>     <dbl>     <dbl>
## 1 Valley     AL    City                    110.      34.6     -85.6      1020
## 2 Union      AL    City                     82.3     32.0     -85.8       440
## 3 Saint      AL    Airport                  99.8     34.2     -86.8       800
## 4 Fernandina FL    City                     46.9     30.7     -81.5        13
## 5 Lake       FL    City                     60.6     30.2     -82.6       195
## 6 West       GA    City                     85.6     32.9     -85.2       575
## # ℹ 1 more variable: Dist_to_Coast <dbl>
```

To summarise results by the type of weather station:


``` r
frost.summary.type <- group_by(frost, by=Type_Fake) %>%
                          summarise(mean(Latitude),
                                    max(Latitude),
                                    min(Dist_to_Coast))
frost.summary.type
```

```
## # A tibble: 3 × 4
##   by                       `mean(Latitude)` `max(Latitude)` `min(Dist_to_Coast)`
##   <chr>                               <dbl>           <dbl>                <dbl>
## 1 Agricultural_Research_S…             33.7            36.3                 4.95
## 2 Airport                              34.4            37.3                45.4 
## 3 City                                 33.7            36.5                 1.15
```

Here, my code is:

-   Splitting up the frost data by the Type_Fake column<br>(e.g. one group for City, one for Airport and one for Agricultural Research)
-   For the data rows in *each group*, calculating the mean latitude, the maximum latitude and the minimum distance to the coast
-   Saving the result to a new variable called frost.summary.type.
-   Printing the results on the screen e.g. the furthest North/maximum latitude of rows tagged Agricultural_Research_Station is 36.32 degrees.

<br><br>


## Sorting data

### The dplyr arrange command (tidyverse)


We use the `arrange()` function to sort a data frame by one or more variables. You might want to do this to get a sense of which cases have the highest or lowest values in your data set or sort counties by their name. For example, let's sort in ascending order by elevation.


``` r
arrange(frost, Latitude)
```

```
## # A tibble: 76 × 8
##    Station     State Type_Fake  Avg_DOY_SpringFrost Latitude Longitude Elevation
##    <chr>       <chr> <chr>                    <dbl>    <dbl>     <dbl>     <dbl>
##  1 Inverness   FL    City                      50.6     28.8     -82.3        40
##  2 Ocala       FL    City                      52.7     29.2     -82.1        75
##  3 Lake        FL    City                      60.6     30.2     -82.6       195
##  4 Tallahassee FL    Agricultu…                75.8     30.4     -84.4        55
##  5 Fernandina  FL    City                      46.9     30.7     -81.5        13
##  6 De          FL    City                      71.3     30.7     -86.1       245
##  7 Quitman     GA    City                      65.5     30.8     -83.6       185
##  8 Brunswick   GA    Agricultu…                48.4     31.2     -81.5        13
##  9 Waycross    GA    Agricultu…                75.9     31.2     -82.3       145
## 10 Tifton      GA    City                      87.3     31.4     -83.5       380
## # ℹ 66 more rows
## # ℹ 1 more variable: Dist_to_Coast <dbl>
```

By default, `arrange()` sorts in ascending order. We can sort by a variable in descending order by using the `desc()` function on the variable we want to sort by. For example, to sort the dataframe by *Avg_DOY_SpringFrost* in descending order we use


``` r
arrange(frost, desc(Avg_DOY_SpringFrost))
```

```
## # A tibble: 76 × 8
##    Station      State Type_Fake Avg_DOY_SpringFrost Latitude Longitude Elevation
##    <chr>        <chr> <chr>                   <dbl>    <dbl>     <dbl>     <dbl>
##  1 Marshall     NC    Airport                  118.     35.8     -82.7      2000
##  2 Highlands    NC    Agricult…                118.     35.0     -83.2      3333
##  3 Mt           NC    City                     113.     36.5     -80.6      1041
##  4 Louisburg    NC    City                     113.     36.1     -78.3       260
##  5 Rocky        VA    Airport                  111.     37.0     -79.9      1315
##  6 Henderson    NC    Agricult…                111.     36.3     -78.4       512
##  7 Farmville    VA    Airport                  111.     37.3     -78.4       450
##  8 Statesville  NC    City                     110.     35.8     -80.9       951
##  9 Valley       AL    City                     110.     34.6     -85.6      1020
## 10 Hendersonvi… NC    Agricult…                110.     35.3     -82.4      2160
## # ℹ 66 more rows
## # ℹ 1 more variable: Dist_to_Coast <dbl>
```

<br> <br>
