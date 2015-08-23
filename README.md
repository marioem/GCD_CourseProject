# "Getting and Cleaning Data" JHU Course Project.

## Repository Description
This repository contains the following files:

1. run_analysis.R - R script to generate tidy data file from the input data
2. README.md - present README file
3. CodeBook.md - codebook file describing data in the tidy data file

## run_analysis.R script
### Purpose

This script is aimed at generating tidy data set from the data collected during the project "Human Activity Recognition Using Smartphones Data Set". The script forms part of the "Getting and Cleaning Data" course project offered by JHU School of Public Health, delivered through [Coursera](coursera.com).

More information about the "Human Activity Recognition Using Smartphones Data Set" project (including detailed data description) can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

According to the instructions set out in the course project description, this script does the following:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 5. Appropriately labels the data set with descriptive variable names. 

	Important: see also **Notes of the implementation of steps 4 and 5.** later in this document.

### Assumptions
In order to use this script it is assumed that:

1. System which this script is run upon does not require escaping of the spaces in the filenames passed to R functions
2. dplyr package is installed (use `install.packages("dyplr")`, if necessary)

### Usage intructions

1. Download and extract [UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into your current working directory, maintaining subdirectories structure contained in the zipped file
2. Download "run_analysis.R" script into your current working directory
3. Run the script using `source("run_analysis.R")`
4. Output file *"UCItidyDataMeans.txt"* (wide form) is stored in "UCI HAR Dataset" directory
     
The tidy data set is written using `write.table` function with the parameter `row.names = FALSE` and default settings for the remaining ones.

To read back the tidy data file into R type:

`read.table("./UCI HAR Dataset/UCItidyDataMeans.txt", header = T)`

### Script code overview
*run_analysis.R* script reads 3 files comprising the test data (X\_test.txt, subject\_test.txt, y\_test.txt) and 3 files comprising the train data (X\_train.txt, subject\_train.txt, y\_train.txt) and merges the corresponding test and train files using `rbind` function. Variable names (column names) of the feature data frame (i.e. merged X\_test.txt and X\_train.txt files) are taken from feature.txt file.


In the merged feature data frame are then kept only the columns containing the measurements on the mean and standard deviation for each measurement. Those columns are identified by the strings "mean" and "std" in their names **with the exception of all columns containing measurements of an angle** (column name starts with the string "angle"). The rationale behind this decision is that the angle variables (columns) by themselves are not mean angles between other measurements (vectors) but angles between means of other measurements (vectors).

After removing the redundant columns, the merged feature data frame is prepended by two columns: *SubjectID*, identifying the subject which the given observations comes from, and *ActivityName*, identifying in a descriptive way one of the six activities the observation belongs to.

Finally, the tidy data set is prepared by calculating means of every measurement for each combination of subject and activity. The tidy data set is then saved to a file. 

>**WARNING!**
>
>**If the file named *UCItidyDataMeans.txt* already exists, it is silently overwritten!**

**Notes of the implementation of steps 4 and 5**

In order to reduce the memory usage during script execution, the intermediate data frames are removed using `rm` function when not needed any more. Due to this, the descritpive column names are constructed from the original column names as one of the last steps in the script and applied to the final, tidy data set only. This means that the original steps 4 and 5 are executed in the reverse order. 


### System information
*run_analysis.R* script has been developed and tested in the following environment:

- Mac OS X 10.10.5
- RStudio 0.99.467
- R 3.2.1

Also, the overview of the processing steps in the code, and the reasoning behind any decisions you made about things to include or exclude goes in the README.md document. 

Activity code/id variable is dropped in favour of ActivityName
