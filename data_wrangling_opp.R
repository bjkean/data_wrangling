#installing packages
library(readr)
library(tidyr)
library(dplyr)
library(readxl)

#setting file paths on local
data_path1 <- "/Users/rhino/downloads/UCI_HAR_Dataset/train/X_train.txt"
data_path2 <- "/Users/rhino/downloads/UCI_HAR_Dataset/test/X_test.txt"

#data column names
col_path <- "/Users/rhino/downloads/UCI_HAR_Dataset/features.txt"

#features path
feat_path1 <- "/Users/rhino/downloads/UCI_HAR_Dataset/train/y_train.txt"
feat_path2 <- "/Users/rhino/downloads/UCI_HAR_Dataset/test/y_test.txt"

#subject paths
sub_path1 <- "/Users/rhino/downloads/UCI_HAR_Dataset/train/subject_train.txt"
sub_path2 <- "/Users/rhino/downloads/UCI_HAR_Dataset/test/subject_test.txt"

#reading in column names and converting to a vector
names <- read_table(col_path, col_names = FALSE)
columns <- unlist(names)
class(columns)

#TRAIN DATA
#reading observed data
df_train <- read_table(data_path1, col_names = columns)
length(df_train) #561 cols
nrow(df_train) #7352 rows

#actions for TRAIN data
action_train <- read_table(feat_path1, col_names = "action")
nrow(action_train) #7352 rows

#subjects for TRAIN data
sub_train <- read_table(sub_path1, col_names = "subject")
nrow(sub_train) #7352 rows

#combining all TRAIN data
full_train_df <- bind_cols(sub_train, action_train, df_train)
length(full_train_df) #563 --> 561 + action + subject
nrow(full_train_df) #7352

#TEST DATA
#reading TEST data
df_test <- read_table(data_path2, col_names = columns)
length(df_test) #561 cols
nrow(df_test) #2947 rows

#actions for TEST data
action_test <- read_table(feat_path2, col_names = "action")
nrow(action_test) #2947 rows

#subjects for TEST data
sub_test <- read_table(sub_path2, col_names = "subject")
nrow(sub_test) #2947 rows

#combining all TEST data
full_test_df <- bind_cols(sub_test, action_test, df_test)
length(full_test_df) #563
nrow(full_test_df) #2947

#combining TEST & TRAIN data
df_all <- bind_rows(full_test_df, full_train_df)
length(df_all) #563
nrow(df_all) #10299


