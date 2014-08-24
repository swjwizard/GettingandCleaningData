# run_analysis Codebook.md
## run_analysis markdown file
### by Stephen Jones

## Requirements

*   Create one R script called run_analysis.R that does the following. 
*   Merges the training and the test sets to create one data set.
*   Extracts only the measurements on the mean and standard deviation for each measurement. 
*   Uses descriptive activity names to name the activities in the data set
*   Appropriately labels the data set with descriptive variable names. 
*   Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## Introduction

    This repository contains "run_analysis.R" and this "run_anlaysis Codebook.md".  It is the class project for Getting and Cleaning Data.
    
    The data is located in the "UCI HAR Dataset" directory located under the working directory.  The activity labels and feature labels
    are used to consistently label the columns.  Some labels were altered to have a consitent naming convention. There are no parameters
    to be passed to run_analysis.R since it is self contained.  The directory structure is as follows:
    
    /UCI HAR Dataset
        |____ activity_labels.txt
        |____ features.txt
        |____ features_info.txt
        |
        |____ /train
        |       |____ subject_train.txt
        |       |____ X_train.txt
        |       |____ y_train.txt
        |
        |____ /test
        |       |____ subject_test.txt
        |       |____ X_test.txt
        |       |____ y_test.txt
        
    
    The script run_analysis.R will merge the train and test data together and applying the appropriate labels.  Only the mean and standard
    deviation columns are kept.  The end result is a dataset called tidyData.txt
