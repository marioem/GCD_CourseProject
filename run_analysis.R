#################################################################################
#
# Filename: run_analysis.R
#  Version: 1.0
#     Date: 2015.08.23
#   Author: Mariusz Musiał
#
# This script is aimed at generating tidy data set from the data collected during
# the project "Human Activity Recognition Using Smartphones Data Set". It forms
# part of the "Getting and Cleaning Data" course project offered by JHU through
# Coursera.com. More data about the "Human Activity Recognition Using Smartphones
# Data Set" project can be foud at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
#
# According to instructions set out in the course project description, this script
# does the following:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
#
#         Input: the original data structure extracted from 
#                https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#                into the working directory, where also this script should
#                be present.
#        Output: file "UCItidyDataMeans.txt" stored in "UCI HAR Dataset" directory
#     Execution: run this script from your current working directory using 
#                source("run_analysis.R")
# Prerequisites: 1) this script is located in your current working directory
#                2) UCI HAR Dataset is extracted from the downloaded zip file
#                   into your current working directory. This would result in a
#                   "UCI HAR Dataset" data directory in current working directory.
#                3) System which this script is run upon does not require escaping
#                   of the spaces in the filenames passed to R functions
#                4) dplyr package is installed on your system
#
# The tidy data set is written using write.table function with row.names = FALSE.
# It can be read back using
#        read.table("./UCI HAR Dataset/UCItidyDataMeans.txt", header = T)
#
#################################################################################


if(!require("dplyr")) {
    stop("Please install dplyr package.")
}

# Check if diectory with data exists. It is assumed that if the top level directory
# exists, then all the corresponding directory and file structure exists, too.
if(!dir.exists("./UCI HAR Dataset")) {
    stop("Data directory structure \"UCI HAR Dataset\" missing")
}

cat("Reading UCI HAR Dataset. This will take a while...\n")

# Some constants useful for reading data files

# Files containing feature data
testFile <- "./UCI HAR Dataset/test/X_test.txt"
trainFile <- "./UCI HAR Dataset/train/X_train.txt"

# File containing feature names (i.e. column names for feature data)
featureNamesFile <- "./UCI HAR Dataset/features.txt"

# Files containig subject IDs identifying which row in feature data comes from which subject
subTestFile <- "./UCI HAR Dataset/test/subject_test.txt"
subTrainFile <- "./UCI HAR Dataset/train/subject_train.txt"

# Files containig activity IDs identifying which row in feature data comes from which activity
activityIdTestFile <- "./UCI HAR Dataset/test/y_test.txt"
activityIdTrainFile <- "./UCI HAR Dataset/train/y_train.txt"

# File containign activity names
activityNameFile <- "./UCI HAR Dataset/activity_labels.txt"

featureNames <- read.table(featureNamesFile, col.names = c("id", "name"), stringsAsFactors = F)
featureData <- read.table(testFile, col.names = featureNames$name, stringsAsFactors = F)
tmpData <- read.table(trainFile, col.names = featureNames$name, stringsAsFactors = F)

# Join the test and train feature data (in this order) by rows

cat("Merging data...\n")

featureData <- rbind(featureData, tmpData)
rm("tmpData")

# Join the subject IDs for test and train files
subject <- read.table(subTestFile, col.names = "SubjectID", stringsAsFactors = F)
subject <- rbind(subject, read.table(subTrainFile, col.names = "SubjectID", stringsAsFactors = F))

# Join the activities IDs for test and train files
activity <- read.table(activityIdTestFile, col.names = "ActivityID", stringsAsFactors = F)
activity <- rbind(activity, read.table(activityIdTrainFile, col.names = "ActivityID", stringsAsFactors = F))

# Read activity name file
activityName <- read.table(activityNameFile, col.names = c("ActivityID", "ActivityName"), stringsAsFactors = F)

# Extract from featureData only measurements on the mean and standard dev on each measurement.
# As indicated in the CodeBook the angle variables are not considered means on other measurements.
cat("Extracting means and standard deviations...\n")
featureDataSlim <- select(featureData, matches("mean|std", ignore.case = T))
featureDataSlim <- select(featureDataSlim, -starts_with("angle"))
rm(featureData) # we don't need it any more, free the memory

# Add columns of SubjectID and ActivityID

activity <- left_join(activity, activityName, by = "ActivityID")

featureDataSlim <- cbind(ActivityName = activity$ActivityName, featureDataSlim)
featureDataSlim <- cbind(SubjectID = subject$SubjectID, featureDataSlim)

rm(activity, activityName, subject, featureNames)

# Group resulting feature data by subject and activity and calculate means

cat("Assembling tidy data set...\n")
tidyData <- (featureDataSlim %>% group_by(SubjectID, ActivityName) %>% summarise_each(funs(mean)))

# Clean up a bit the variable names

nicerNames <- gsub("\\.\\.\\.", "\\.", names(tidyData))
nicerNames <- gsub("\\.\\.", "", nicerNames)
nicerNames <- gsub("BodyBody", "Body", nicerNames)

colnames(tidyData) <- nicerNames

rm(featureDataSlim)

# write the tidy data to a file

cat("Writing tidy data to a file...\n")

tidyFile <- "./UCI HAR Dataset/UCItidyDataMeans.txt"

if(file.exists(tidyFile)) {
    # warning("Tidy data file exists. Overwriting!")
    file.remove(tidyFile) # We assume here that the file is not write-protected
}

write.table(tidyData, tidyFile, row.names = F)

cat("Done\n")

