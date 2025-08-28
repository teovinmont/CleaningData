# CleaningData
This project demonstrates the process of **cleaning** and **tidying** the *Human Activity Recognition Using Smartphones* (UCI HAR) dataset as part of the Coursera *Getting and Cleaning Data* course. The goal is to transform raw sensor data into a well-structured, human-readable format suitable for further analysis.

## Objectives

The script performs the following steps:

1.  **Merge datasets** – Combines training and test sets into a single dataset.
2.  **Filter relevant measurements** – Selects only variables representing the mean and standard deviation.
3.  **Apply descriptive labels** – Replaces activity codes with descriptive activity names.
4.  **Clean variable names** – Renames columns to make them descriptive, consistent, and analysis-ready.
5.  **Create a tidy summary** – Produces a second dataset containing the average of each variable for each activity and each subject.

## Data Source

The original dataset comes from:

-   [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones)
-   Dataset used: *Human Activity Recognition Using Smartphones* (Version 1.0)

## Output Datasets

-   **`united_dataset_clean`** – Cleaned dataset with descriptive variable names.
-   **`tidy_means_by_subject_activity`** – Final tidy dataset with the mean of each variable grouped by subject and activity.

## Requirements

-   R version ≥ 4.0

-   Packages:

    ``` r
    install.packages("tidyverse")
    ```

## Reproducibility

The script automatically downloads and unzips the dataset if it is not already present in the working directory, ensuring reproducibility across environments.
