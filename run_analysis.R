###################################################
##
##	run_analysis.R
##	Authtor:  Stephen Jones
##	
###################################################

## Setting the working directory
setwd("E:/CourseraDataScience/Getting and Cleaning Data")

## reading the training data into one "training" data frame
trainingData = read.table("UCI HAR Dataset/train/X_train.txt", sep="")
trainingData[,562] = read.table("UCI HAR Dataset/train/y_train.txt", sep="")
trainingData[,563] = read.table("UCI HAR Dataset/train/subject_train.txt", sep="")

## reading the testing data into one "testing" data frame
testData = read.table("UCI HAR Dataset/test/X_test.txt", sep="")
testData[,562] = read.table("UCI HAR Dataset/test/y_test.txt", sep="")
testData[,563] = read.table("UCI HAR Dataset/test/subject_test.txt", sep="")

## reading the activityLabels data into "activityLabesls" data frame
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt", sep="")

# reading the features two files into one "features" data frame
# renaming some variable names to make it easier to use
features = read.table("UCI HAR Dataset/features.txt", sep="")
features[,2] = gsub('-mean()', 'Mean', features[,2])
features[,2] = gsub('-std()', 'StdDev', features[,2])


# merging the training and testing data sets together
allData = rbind(trainingData, testData)

# Only get the data for Mean and StdDev.
colsNeeded <- grep(".*Mean.*|.*StdDev.*", features[,2])
# First reduce the features table to what we want
features <- features[colsNeeded,]
# Now add the last two columns (subject and activity)
colsNeeded <- c(colsNeeded, 562, 563)
)
# And remove the unwanted columns from allData
allData <- allData[,colsNeeded]
# Add the column names (features) to allData
colnames(allData) <- c(features$V2, "Activity", "Subject")
colnames(allData) <- tolower(colnames(allData))

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  allData$activity <- gsub(currentActivity, currentActivityLabel, allData$activity)
  currentActivity <- currentActivity + 1
}

allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)

tidyData = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)
# Removing the subject and activity columns
tidyData[,90] = NULL
tidyData[,89] = NULL
write.table(tidyData, "tidyData.txt", sep="\t")



