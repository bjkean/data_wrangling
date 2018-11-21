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
length(unique(df$company)) #19 unique values

#converting all values to lowercase
df$company <- tolower(df$company)

unique(df$company)
length(unique(df$company)) #12 unique values


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

#Separate the product code and product number into separate columns
df <- separate(df, `Product code / number`, c('product_code','product_number'),sep="-")

lut2 <- c('p'='Smartphone' , 'v'='TV' , 'x'='Laptop' , 'q'='Tablet')

df$product <- lut2[df$product_code]

df <- unite(df, "full_address", c(address, city, country), sep=',',remove=FALSE)

#creates binary cols for company name
df$company_philips <- as.numeric(df$company=='philips')
df$company_akzo <- as.numeric(df$company=='akzo')
df$company_van_houten <- as.numeric(df$company=='van houten')
df$company_unilever <- as.numeric(df$company=='unilever')

#creates binary cols for product
df$product_smartphone <- as.numeric(df$product=='Smartphone')
df$product_tv <- as.numeric(df$product=='TV')
df$product_laptop <- as.numeric(df$product=='Laptop') 
df$product_tablet <- as.numeric(df$product == 'Tablet')

write.csv(df, file = "final.csv")

##code not working, variable not recognizing, final output is column called 'column'
cols <- c("company_philips", "company_akzo", "company_van_houten", "company_unilever")
vals <- c('pilips','azko','van houten','unilever')

num = 1

for (column in cols){
    df$column <- as.numeric(df$company==vals[num])
    num < - num + 1
  }
View(df)


