

# Final Project {.unnumbered}

## Aim {.unnumbered}

Welcome to your final project. This is worth 160 points (similar to an exam), compared to your labs which were worth 100 points.

By the end of this lab, you will be able to:

1.  Showcase your knowledge of simple linear regression
2.  Carry this forward into a mulitple regression analysis
3.  Use your models to predict a real-life messy dataset.

You need to submit your report by Thurs May 2, 23:59pm. If you are going to be late, you have 3 options:

1.  Especially if you are graduating, remember you can drop either this or your lowest exam grade, so use this as your drop. Submit what you have and focus on the exam.
2.  If you are NOT graduating and struggling to get it done, I am happy to formally defer your grade to give you more time and support to complete it.

<br>

### Need help? {.unnumbered}

**Code won't knit? Struggling? Have a question? See the help page here: [Help!](#Help)**

<br>

## 1. Set up (DON'T SKIP) {.unnumbered}

<br>

### **[Step 1.1] Create a new project for your project** {.unnumbered}

-   I am assuming you now know how to do this. See previous labs and the tutorial

<br><br>

### **[Step 1.2] Go to Canvas and get your personalised data.** {.unnumbered}

-   You each get your own individual dataset, sampled out of a large population. You can download this from Canvas.

<br><br>

### **[Step 1.3] Create a lab report template** {.unnumbered}

-   I expect your report to look professional, with a floating table of contents, a report title and the date in your YAML code (AKA exactly what I have asked in the other labs). You now have many templates:

    -   You could copy over a previous one that you like and just delete your code, use one I provided and/or create your own using tutorial 3 (<https://psu-spatial.github.io/Stat462-2024/T3_Markdown.html#T3_YAML>). <br>

    -   Remember that in the template for lab 6, I have summarized all the linear regression code in a bundle that you can copy/paste to save time.<br>

    -   I suggest copy/pasting your initial library code chunk from Lab 6, then you have those options set and your libraries already loaded.

    -   Press knit and make sure it all works. OR TALK TO DR G.

<br><br>

------------------------------------------------------------------------

## 2. The AirBnB challenge (READ THIS!) {.unnumbered}

You are an analyst for the holiday rental company, AirBnB. You have been paid to answer some questions that the company has about their rentals in San Francisco. They are especially interested in understanding if you can predict rental prices given recent fears about a crash (see below)

AirBnB have provided you a sample dataset of 150 AirBnb rentals from March-05-2023 in San Francisco. Your professor has also merged this with a load of demographics data from the US Census. Overall you have this data:

Your unit of analysis is an individual rental property on a specific day and your response variable is price.

Here is your full list of variables and their units/sources:

-   "host_name" : The name of the person renting out the room/house

-   "neighbourhood" : Neighbourhood name in San-Francisco

-   "room_type" : "Entire_home" or "individual room"

-   **"price" : The price that the airbnb rented for per night in USD.**

-   "minimum_nights" : The minimum number of nights that a guest must stay in order to book

-   "number_of_reviews" : Total number of reviews for that property

-   "reviews_per_month" : Average number of reviews per month

-   "Number_Listings_by_Host" : One means that this is the only airbnb rented by that host (e.g. likely their own home), Several means that they might be a professional short term letter.

-    "availability_365" : How many days the property is available during each year.

-   "num_trees.500m" : Number of trees within 500m of the property

-   "num_bikehire.500m" : Number of bike rental stations within 500m of the property (a measure of tourism)

-   "num_public_art.500m" : Number of public art works and murals within 500m of the property (e.g. a measure of tourism)

-   "num_burglary.500m" : Number of burglaries within 500m of the property during that month/year

-   "num_motor_theft.500" : Number of car thefts within 500m of the property during that month/year

-   "CensusTract_GEOID" : The census tract that the property is situated in. ([what is a census tract?](https://www2.census.gov/geo/pdfs/education/CensusTracts.pdf))

-   "CT_population_density.km2" : The population density in the census tract/neighbourhood (people per square km)

-   "CT_median_age": The median age in the census tract/neighbourhood (years)

-   "CT_percent.incomeGt75E" : The percent of people who make more than \$750000 per year in that tract/neighbourhood (years) e.g. measure of wealth

-   "CT_percent.under18" The percent of people under age 18 in the census tract/neighbourhood

-   "CT_percent.over65" : The percent of people over age 75 in the census tract/neighbourhood

-   "CT_percent.poverty" : The percent of people in poverty in the census tract/neighbourhood

-   "CT_percent.foreignborn": The percent of foreign born people in the census tract/neighbourhood

-   "CT_percent.workhome" : The percent of people who work from home in that tract/neighbourhood

-   "CT_percent.withdegree" : The percent of people with a degree in that tract/neighbourhood

-   "CT_percent.collegestudents" : The percent of college students in that tract/neighbourhood

-   "CT_gini_inequalityindex" : The Gini inequality index in that tract/neighbourhood

-   "CT_median.housevalue" : The median house value in that tract/neighbourhood

-   "CT_median.rent" : The median rent in that tract/neighbourhood

-   "CT_percenthouse.rented" : The percentage of houses rented out in that tract/neighbourhood

-   "CT_percenthouse.vacant" : The percentage of vacant houses in that tract/neighbourhood

-   "CT_percenthouse.broadband" : The percentage of houses with broadband internet in that tract/neighbourhood.

-   "Longitude" (degrees)

-   "Latitude" (degrees)

### **[Step 2.1] Write up a brief introduction (\~ 100 words)** {.unnumbered}

In your report, write up a brief introduction about AirBnb rentals in San Francisco and what you think might be driving rental prices. Consider including a picture/photo to make it look even more professional (imagine a consultancy style report you can share in your job interview). These links might help:

-   <https://news.airbnb.com/about-us/>

-   <https://sfstandard.com/2023/07/05/san-francisco-airbnb-bookings-plunge-as-city-battles-bad-press/>

-   <https://www.newsweek.com/airbnb-revenue-collapse-housing-market-crash-fears-1809543>

Given what you read above (e.g. using your own common sense), write a prediction of which variable(s) you THINK might most impact house prices.

**Remember to use headings and subheadings to make it easy to read. For a similar guide on a different topic, look in the menu on the left and look at the example report.**

<br><br>

### **[Step 2.2] Read in your sample data** {.unnumbered}

You should have downloaded TWO files from the canvas link. Both should have your email ID on them,

-   The first file contains 150 individual room rentals in San Francisco from May 2023

-   The other file contains 150 ENTIRE HOUSE rentals in San Francisco from May 2023

Use the `read_excel()` command to load the data into R. I suggest assigning the room data to a variable called `room` and the other to a variable called `house`. If you are stuck see (<https://psu-spatial.github.io/Stat462-2024/T4_ReadingData.html#T4_readxl>)

<br><br>

### **[Step 2.3] Now make a spatial version** {.unnumbered}

Just like with the Taiwan dataset, you have a spatial component and so you are able to make maps in order to better understand your dataset. To do this:

1.  Make sure that the `sf` , `corrplot` and `tmap` libraries are both installed AND loaded in your library code chink at the top.

2.  Adjust this code to match your variable names and run. R will now understand that room.sf is a spatial dataset - in step 2.4 you can make some maps.


```r
# adjust to whatever you called your datasets. the 4326 means lat/long
room.sf <- st_as_sf(room,coords=c("Longitude","Latitude"),crs=4326)
house.sf <- st_as_sf(house,coords=c("Longitude","Latitude"),crs=4326)
```

<br><br>

### EDIT TO MAKE IT EASIER 

**YOU CAN CHOOSE A SINGLE DATASET TO WORK ON. E.g. you can either analyse the room data (individual rooms sold on airbnb) or you can analyse entire house data.** **If you already analysed both, I will consider this when awarding bonus points.**

<br><br>

### **[Step 2.4] Summarise** A SINGLE DATASET  {.unnumbered}

**Use summary code to describe a single dataset of your choice. As well as your code/analysis/plots, I expect you to write around 100 words, explaining what you see.**

For example, you can use summary code and common sense to report things like how much data you have, what your response variable looks like, if there are any notable outliers, any interesting relationships and any correlations.

Not sure how? You can use old code from your old labs! Also included here in the tutorials

-   Summary code:<https://psu-spatial.github.io/Stat462-2024/T9_wrangling.html#summary-statistics>

-   Plots: <https://psu-spatial.github.io/Stat462-2024/T6_plots.html>

-   Correlation matrices (I suggest the corrplot one): <https://psu-spatial.github.io/Stat462-2024/correlation.html>

-   Maps:

    -   The easiest map you can make is a "quick thematic map", `qtm` from the tmap package

    -   For example, this should run on your spatial data.

        
        ```r
        # on the cloud, try tmap_mode("plot"), or don't make maps
        tmap_mode("view")
        qtm(room.sf,dots.col="price",title="AirBnB Price",dots.size=.5,dots.palette="Spectral")
        ```

    -   For more fancy maps (that aren't much harder), see here. You can also see how to extract things like elevation data if you want even more variables. <https://psu-spatial.github.io/Geog364-2021/364Data_TutorialWranglePoint.html> = BUT KNOW YOU'RE SWITCHING TUTORIAL TO MY OTHER COURSE!

<br><br>

------------------------------------------------------------------------

## 3. Simple Linear Regression {.unnumbered}

<br>

### **[Step 3.1]** Choose two predictor variables for your single dataset. {.unnumbered}

Using your summary above, choose [**TWO**]{.underline} variables predictor variables that you think might predict airbnb prices FOR THE THE SINGLE DATASET YOU SUMMARISED. You could choose these because you think they are the best at predicting prices, or because they look interesting in someway.

-   HINT 1, BEFORE COMMITTING, I would first look at the scatterplots of some variables and choose one that looks like it meets the LINE assessments. Doing transformations is a pain.

-   HINT 2: Look for outliers in the residual plots. It seems there are some weird airbnbs out there, If removing the outlier would make your fit more interesting, go ahead.

**Briefly explain why you chose those two variables in your report, using your summary analysis above to justify your choice.**

<br><br>

### **[Step 3.1b]** Fit a SLR model to each one {.unnumbered}

Conduct TWO SEPARATE simple linear regression analyses, one for each variable - with the response as price.

-   For each, include a professional scatterplot

-   Assess LINE/outliers

-   If you find it breaks LINE or has outliers, consider fitting a transformation or removing the outlier and rerunning (OR SWITCH TO AN EASIER PREDICTOR VARIABLE). See my example report on movies to see what this might look like if you stick with it.

-   And summarise the model in the text (e.g. see my example report on movies - menu on left). E.g. write out the equation in the context of airbnb & prices.

<br><br>

### **[Step 3.2]** Compare the models {.unnumbered}

**See tutorial 15 onwards. Compare your two models in terms of:**

1.  The percentage variability explained

2.  AIC - see the transformations lecture and <https://online.stat.psu.edu/stat501/lesson/10/10.5> and the example report on movies.

3.  The effect (slope) size

4.  Whether the slope is significant

5.  Meeting the LINE assumptions (it's OK to say they both "meet LINE")

At the end, explain which model you would choose so far.

**YOU DO NOT HAVE TO WRITE VERY MUCH FOR THESE. For example:**

1.  **The percentage variability explained:** The $R^2$ for model 1 is 0.875, and the $R^2$ for model 2 is 0.67. This suggests that model 1 is more skillful. In plain language, 87.5% of the variation in building height can be explained by how many floors they have.

<br><br>=

------------------------------------------------------------------------

## 4. Multiple regression & Model fitting  {.unnumbered}

**Stick with the same dataset you are working on.**

1.  Choose 5-10 predictor variables out of the full list that you think might best predict your response. <br>\

2.  Create a full model with those 5-10 predictors, as described in Tutorial 16 (<https://psu-spatial.github.io/Stat462-2024/multiple-regression-model-fitting.html>) The fastest way to type this is to type names(house) (or whatever your dataset is called) into the console, then you can copy/paste column names.<br>\

3.  Use the 'best subsets' code to try all of the combinations of these variables. (<https://psu-spatial.github.io/Stat462-2024/finding-the-optimal-model.html>). The easiest way to see the output clearly is to make your console wider and it show look like a neat table..<br>

4.  Choose the most appropriate set of predictor variables (typically the row with the highest adjusted $R^2$ and lowest AIC). <br>\

5.  Create your final model using the set of variables you just selected. <br>

## 5. Summary {.unnumbered}

1.  Write out the equation for your final model. <br>\
2.  Discuss which predictor(s) have the biggest effect and what that means in terms of airbnb prices. <br>\
3.  Discuss which predictor(s) are significant or not and what that means in terms of airbnb prices. <br>\
4.  Assess the model for LINE assumptions (but don't worry about transformations if it doesn't work) <br>

<br><br>

## 6. Enter your final model on Canvas & submit report {.unnumbered}

Remember to save your work throughout and to spell check your writing (next to the save button).

Now, press the knit button again. If you have not made any mistakes in the code then R should create a html file in your project which includes your answers.

**To make grading faster, I would like you to enter LIMITED answers on a Canvas quiz (less than lab 6). You will also submit your report there.**

<br><br>

## GRADING RUBRIC {.unnumbered}

-   **A\*\* (98% up) :** Everything below AND I can't fault your analysis. If your model needed transformations, you did that successfully and thoughtfully

-   **A\* (96-98%):** Everything below AND Your report is something that you could genuinely hand into a job interview. It's spell-checked, easy to follow, beautifully formatted and explains the results and statistics clearly in terms of airbnb & prices.

-   **A (93-96%) :** Everything below AND you have explained the results and statistics clearly in terms of airbnb & prices. I understand why you chose the predictors you did and your the models validity and skill.

-   **A-:** Everything below AND you attempted all of the requirements (E.g. your report is complete)

-   **B+:** Everything below AND you attempted to explain your results.

-   **B:** EVERYTHING BELOW and You managed to complete all the fields in the canvas quiz (e.g. you got all the models running)

-   **C:** You got at least one model running and assessed it for LINE

-   **D:** You attempted anything and managed to read in the data
