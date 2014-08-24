GettingandCleaningData
======================

    This repository contains "run_analysis.R" and this "run_anlaysis Codebook.md".  It is the class project for Getting and Cleaning Data.
    
    The data is located in the "UCI HAR Dataset" directory located under the working directory.  The activity labels and feature labels are used to consistently label the columns.  Some labels were altered to have a consitent naming convention. There are no parameters to be passed to run_analysis.R since it is self contained.  The directory structure is as follows:
    
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
        
    
    The script run_analysis.R will merge the train and test data together and applying the appropriate labels.  The activity labels and feature labels are used to consistently label the columns.  Some labels were altered to provide a more consitent naming convention.  There are no parameters to be passed to run_analysis.R since it is self contained. The resulting dataset has only the mean and standard deviation columns.  All other columes were removed.  The resulting text file is a dataset called tidyData.txt

