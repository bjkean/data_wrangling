#installing packages
library(readr)
library(tidyr)
library(dplyr)
library(readxl)

#setting internal path for fil
path <- "/Users/rhino/downloads/refine.xlsx"

#reading file into a dataframe w/ tibble format
df <- read_excel(path)

#looking at data
print(df)

#viewing column names
colnames(df)

#Goal: accepted company names: philips, akzo, van houten and unilever
names <- c('philips', 'akzo', 'van houten', 'unilever')
#view unique values in column 'company'
unique(df$company)

#getting number of unique values in company
length(unique(df$company)) #19

#converting all values to lowercase
df$company <- tolower(df$company)

unique(df$company)
length(unique(df$company)) #12

#Start here. Create a lookup table and make it so that you can apply the pattern to
#all values
for (names in df$company){
    if (str_detect(names,pattern='ak')==TRUE)
      print(names)
    df$names <- 'akzo'
}
df$company
