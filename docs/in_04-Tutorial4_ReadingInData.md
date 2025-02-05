

# Reading in data {#T4_ReadingData}

<br>

## DON'T USE 'FILE/IMPORT' OR DRAG IN DATA

We often have to read in data from file. For those of you who have used before, you might have done this interactively e.g. going to File/Import data. The problem with this is that when you press 'knit' the computer don't know how to reproduce your actions, so it will crash.

So we want to learn the code commands to put into a code chunk. Here are some common ways to do so (there are many others!)

<br><br>

------------------------------------------------------------------------

## REMEMBER TO USE PROJECTS

The advantage of using projects is that you don't have to 'tell' the computer where to look for data. So for those of you who used R before, you don't have to use commands like setwd().

**INSTEAD PUT THE DATA FILES IN THE SAME FOLDER AS YOUR PROJECT .Rproj file.**

R will automatically look there first without you needing to tell it any locations.

[**ADVANCED**]{.underline}: If you want to be fancy, you can make a sub-folder and the use "*./foldername/*filename.. " in front of your file name. e.g, the . means look in the current folder, then go into the subfolder called foldername, then look for your filename.

<br><br>

------------------------------------------------------------------------

## Reading in csv files

**First, make sure your csv is in your lab folder and you are running your lab project.**

CSV files are like basic spreadsheets without formatting. E.g. comma separated values. The easiest way to read in a csv file is using the read.csv() command. This is built into R, you don't need to install any packages.


``` r
mydata <- read.csv("FILENAME.csv")
```

-   The command is `read.csv()` - if you go to ?read.csv you can see lots of other options like skipping rows etc.

-   "`FILENAME.csv`" is whatever you have called your file. Its case sensitive.

-   `mydata` is the variable name you wish to save it as. This can be anything you like (e.g. if i read in data on frost dates, I might call it frost).

Other valid commands that do the same thing are `read_csv()` (from the readr package) and `fread()` (from the data.table package). These are faster and more adaptable, but you would have do download the packages and they read the data into their own propitiatory format.

### I got an error

If you get an error, it means that either you have typed the filename in wrongly (for example you didn't include the .csv) or that the file isn't in exactly the same folder as your .rproj, or that you're not running your project so the computer doesn't know where to look.

### My data doesn't have column names

If your data doesn't have column names, you can tell R that it doesn't like this:


``` r
mydata <- read.csv("FILENAME.csv",header=FALSE)
```

Then you can rename your columns using the `names()` command.

<br><br>

------------------------------------------------------------------------

## Reading in excel files {#T4_readxl}

**First, make sure your xlsx or xls file is in your lab folder and you are running your lab project.**

More complex spreadsheets are easily read in using the `read_excel()` command from the `readxl` package.

First, go to the packages tab, click install and download/install the readxl package. Then add `readxl` to your library code chunk and run (e.g. `library(readxl)` )


``` r
library(readxl)
```

Now you can read in excel files using this command


``` r
mydata2 <- read_excel("FILENAME.xlsx")
```

-   The command is read_excel`()` - if you go to ?read_excel you can see lots of other options like skipping rows etc.

-   "FILENAME.xlsx" is whatever you have called your file. Its case sensitive and you need the extension.

-   `mydata2` is the variable name you wish to save it as. This can be anything you like (e.g. if i read in data on frost dates, I might call it frost).

Other valid commands that do the same thing are `read_table()` (from the readr package) and `fread()` (from the data.table package). These are faster and more adaptable, but you would have do download the packages and they read the data into their own propitiatory format.

If you get an error, it means that either you have typed the filename in wrongly (for example you didn't include the .csv) or that the file isn't in exactly the same folder as your .rproj, or that you're not running your project so the computer doesn't know where to look.

<br><br>

------------------------------------------------------------------------

## Loading built-in data {#T4_loaddata}

R also has many built-in datasets. To load them into R:

1.  In your library code chunk, load the library that contains the dataset \<br<br>

2.  Load the dataset using the 'data' command <br><br>

3.  This will create a 'data promise' in your Environment tab. To look at or use the data, click on its NAME, or run any command. Here, I used the glimpse command, but you can do anything.

For example, to load the palmer penguins data.


``` r
library(palmerpenguins) #normally this would be at the top of the code chunk
data("penguins")
glimpse(penguins)
```

```
## Rows: 344
## Columns: 8
## $ species           <fct> Adelie, Adelie, Adelie, Adelie, Adelie, Adelie, Adel…
## $ island            <fct> Torgersen, Torgersen, Torgersen, Torgersen, Torgerse…
## $ bill_length_mm    <dbl> 39.1, 39.5, 40.3, NA, 36.7, 39.3, 38.9, 39.2, 34.1, …
## $ bill_depth_mm     <dbl> 18.7, 17.4, 18.0, NA, 19.3, 20.6, 17.8, 19.6, 18.1, …
## $ flipper_length_mm <int> 181, 186, 195, NA, 193, 190, 181, 195, 193, 190, 186…
## $ body_mass_g       <int> 3750, 3800, 3250, NA, 3450, 3650, 3625, 4675, 3475, …
## $ sex               <fct> male, female, female, NA, female, male, female, male…
## $ year              <int> 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007…
```
