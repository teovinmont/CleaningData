# CodeBook – UCI HAR Dataset Cleaning and Tidying Project

This **CodeBook** explains the variables, data, and transformations performed in the _Human Activity Recognition Using Smartphones_ dataset as part of the Coursera _Getting and Cleaning Data_ course project.

## 1. Raw Dataset Description

The original dataset consists of sensor signals collected from the accelerometer and gyroscope of Samsung Galaxy S smartphones worn by 30 participants performing six daily activities:

- **WALKING**
    
- **WALKING_UPSTAIRS**
    
- **WALKING_DOWNSTAIRS**
    
- **SITTING**
    
- **STANDING**
    
- **LAYING**
    

Each observation includes:

- **Subject**: Identifier (1–30) for the person performing the activity.
    
- **Activity**: Type of physical activity.
    
- **Features**: Time and frequency domain signals derived from accelerometer and gyroscope measurements.
    

The full dataset originally contained 561 feature variables.

---

## 2. Variables in the Cleaned Dataset

After processing, the final dataset contains:

|Variable name|Description|
|---|---|
|`subject`|Integer (1–30). Identifier for the participant.|
|`activity`|Factor with 6 levels. Descriptive activity name replacing numeric codes.|
|`group`|Indicates whether the data point came from the **Training** or **Test** set.|
|`time_*`|Variables derived from the time domain signals.|
|`fourier_*`|Variables derived from the frequency domain signals (Fourier transform).|
|`*_acceleration`|Measurements from the accelerometer.|
|`*_gyroscope`|Measurements from the gyroscope.|
|`*_jerk`|Jerk signals (time derivatives) for accelerometer/gyroscope data.|
|`*_mag`|Magnitude of the signals, calculated using the Euclidean norm.|
|`*_mean`|Mean value of the signal.|
|`*_std`|Standard deviation of the signal.|

All feature variables are **numeric** and represent either mean or standard deviation measurements.

## 3. Transformations Applied

The following transformations were performed:

1. **Merging training and test datasets**
    
    - Combined `X_train`, `X_test`, `subject_train`, `subject_test`, `y_train`, `y_test` into a single dataset.
        
2. **Filtering variables**
    
    - Selected only columns containing `mean()` or `std()` measurements.
        
3. **Adding descriptive activity names**
    
    - Replaced numeric activity codes (1–6) with descriptive names (e.g., `WALKING`).
        
4. **Renaming variables for clarity**
    
    - Removed parentheses `()` and hyphens `-`.
        
    - Applied lowercase and replaced abbreviations:
        
        - `t` → `time_`
            
        - `f` → `fourier_`
            
        - `acc` → `_acceleration`
            
        - `gyro` → `_gyroscope`
            
        - `jerk` → `_jerk`
            
        - `mag` → `_mag`
            
5. **Creating the tidy dataset**
    
    - Aggregated the data by **subject** and **activity**, computing the **mean** for each variable.

## 4. Final Output Files

- **`united_dataset_clean.csv`**  
    The cleaned dataset with descriptive variable names, all observations included.
    
- **`tidy_means_by_subject_activity.csv`**  
    A tidy dataset where each row represents a unique combination of **subject** and **activity**, and each column contains the average of each variable for that combination.
