#installing packages
library(readr)
library(tidyr)
library(dplyr)
library(readxl)

#doing excel route as csv was pushing errors
path <- "/Users/rhino/downloads/titanic3.xls"
df <- read_excel(path)

#look at unique values. Values found: S, C, NA, Q
unique(df$embarked)

#checking for number of NULL values
na_vec <- is.na(df$embarked)
sum(na_vec) #appears to be 2

#get values that are NOT NULL, then reverse logic, set values to vector
embark_null_list <- (grep(pattern = "", df$embarked, invert = TRUE))

#loop through embark_null_list to set NULL values to S
for (item in embark_null_list){
  df$embarked[item] = 'S'
}
#check that code worked -- success
unique(df$embarked)

#get unique age values
unique(df$age)

#set mean of age value with NULL values removed. mean == 29.88
mean_age <- mean(df$age, na.rm = TRUE)

#set age_null_list, same grep logic as before
age_null_list <- (grep(pattern = "", df$age, invert = TRUE))

#loop through and change null value in age to mean_age of 28.88
for (item in age_null_list){
  df$age[item] <- mean_age
}

#set boat_null_list, same grep logic as before
boat_null_list <- (grep(pattern = "", df$boat, invert = TRUE))

#loop through and change null value to None
for (item in boat_null_list){
  df$boat[item] <- 'None'
}

###REMOVE
#set cabin_null_list, same grep logic as before
#cabin_null_list <- grepl(pattern = "", df$cabin, invert = TRUE)
###REMOVE

#set new column 
df$has_cabin_number <- grepl(pattern = "", df$cabin)

#check number of TRUE: 295
sum(df$has_cabin_number)

#set boolean in new column: TRUE==1, FALSE==0
for (item in 1:length(df)){
  if (df$has_cabin_number[item]==TRUE){df$has_cabin_number[item]=1}
  else {df$has_cabin_number[item]=0}
}
#check work: 295
sum(df$has_cabin_number)
