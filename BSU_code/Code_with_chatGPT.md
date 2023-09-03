# chatGPT prompts used to make forecast

## Prompt 1

I have a datset called FANG that looks like this.

> FANG %>%
+     slice(0) %>%
+     glimpse()
Rows: 0
Columns: 8
$ symbol   <chr> 
$ date     <date> 
$ open     <dbl> 
$ high     <dbl> 
$ low      <dbl> 
$ close    <dbl> 
$ volume   <dbl> 
$ adjusted <dbl> 

The goal is to forecast close for the next week.

Please, write R code to create a forecast model using the rsample, tidymodels, timetk, and modeltime packages.

### Problem
XXXXXXXXXXX

## Prompt 2
Please, update the code using the timetk and modeltime packages instead of the forecast package.


