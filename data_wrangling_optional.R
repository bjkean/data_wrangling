#installing packages
library(readr)
library(tidyr)
library(dplyr)
library(readxl)

#setting file paths on local
path1 <- "/Users/rhino/downloads/UCI_HAR_Dataset/train/X_train.txt"
path2 <- "/Users/rhino/downloads/UCI_HAR_Dataset/train/y_train.txt"
path3 <- "/Users/rhino/downloads/UCI_HAR_Dataset/features.txt"
path4 <- "/Users/rhino/downloads/UCI_HAR_Dataset/train/subject_train.txt"

#reading in column names and converting to a vector
names <- read_table(path3, col_names = FALSE)
columns <- unlist(names)
class(columns)

#using read_table as other read_* have produced only one column
#data <- read_table(path1, col_names = columns)
data <- read_table(path1, col_names = columns)
head(data)
#561 columns
length(colnames(data))

#7352 rows
nrow(data)



#reading action data into a table
data_action <- read_table(path2, col_names = "action")
data_action
vec_data_action <- unlist(data_action)  

#reading subjects into a table
subjects <- read_table(path4, col_names = "person")
vec_subjects <- unlist(subjects)

#Combining data_action w/ data
data$action <- vec_data_action

#Comgining data / subjects
data$subject <- vec_subjects

df2 <- bind_cols(data_action, subjects, data)
colnames(df2)
