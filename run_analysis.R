# ============================================================================ #
# Author: Teo Monteiro
# Objective:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard
#    deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities
#    in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent
#    tidy data set with the average of each variable for each
#    activity and each subject.
# ============================================================================ #

# LIBRARIES USED ----
library(tidyverse)

# DOWNLOAD AND IMPORT DATA ----
if (!file.exists("UCI HAR Dataset")) {
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, "Dataset.zip", method = 'auto')
        unzip("Dataset.zip")
}

# READ FILES ----
activities <- read_table('UCI HAR Dataset/activity_labels.txt',col_names = c('code', 'activity'))
features <- read_table('UCI HAR Dataset/features.txt', col_names = FALSE, )

# Training files ----
subject_train <- read_table('UCI HAR Dataset/train/subject_train.txt', col_names = 'subject')
X_train <- read_table('UCI HAR Dataset/train/X_train.txt', col_names = FALSE)
y_train <- read_table('UCI HAR Dataset/train/y_train.txt', col_names = 'code')

# Test files ----
subject_test <- read_table('UCI HAR Dataset/test/subject_test.txt', col_names = 'subject')
X_test <- read_table('UCI HAR Dataset/test/X_test.txt', col_names = FALSE)
y_test <- read_table('UCI HAR Dataset/test/y_test.txt', col_names = 'code')


# Rename columns ----
features_names <- features$X2
names(X_train) <- features_names
names(X_test) <- features_names

# Select columns and identify groups

X_train_selected <- X_train |> 
        select(matches('std|mean\b'))

X_test_selected <- X_test |> 
        select(matches('std|mean\b'))


# Unite training datasets ----
train_dataset <- cbind(subject_train, y_train)

train_dataset <- train_dataset |> 
        left_join(activities, by = 'code') |> 
        select(-code) |> 
        cbind(X_train_selected)

# Unite test datasets ----
test_dataset <- cbind(subject_test, y_test)

test_dataset <- test_dataset |> 
        left_join(activities, by = 'code') |> 
        select(-code) |> 
        cbind(X_test_selected)

# Unite train and test datasets ----
united_dataset <- rbind(test_dataset, train_dataset)


# Rename variables
united_dataset_clean <- united_dataset |> 
        rename_with(~ tolower(str_remove_all(., '[()]'))) |> 
        rename_with(~ tolower(str_replace_all(., '-', '_'))) |> 
        rename_with(~ tolower(str_replace(., 'jerk', '_jerk'))) |> 
        rename_with(~ tolower(str_replace(., 'mag', '_mag'))) |> 
        rename_with(~ tolower(str_replace(., '^t', 'time_'))) |> 
        rename_with(~ tolower(str_replace(., '^f', 'fourier_'))) |> 
        rename_with(~ tolower(str_replace(., 'acc', '_acceleration'))) |>
        rename_with(~ tolower(str_replace(., 'gyro', '_gyroscope')))
        
# Create a tidy summary
tidy_means_by_subject_activity <- united_dataset_clean |> 
        group_by(subject, activity) |> 
        summarise(across(where(is.numeric), mean))






