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


#set variables based on patterns in each
my_vars <- c('uni','ak','van','ps')

#for loop runs through my_vars vector.
#converts value to a value from my_vars based on position from grep
for (var in my_vars){
  for (num in grep(var,df$company)){
    df$company[num] <- var
  } 
}

#create lookup table
lut <- c('ps'='philips', 'ak'='akzo','van'='van houten','uni'='unilever')
df$company <- lut[df$company]
df$company


