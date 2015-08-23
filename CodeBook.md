#Codebook for *UCItidyDataMeans.txt* data set

##General information
###Source data

The *UCItidyDataMeans.txt* data set is derived from "Human Activity Recognition Using Smartphones Data Set" available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) using [*run_analysis.R*](https://github.com/marioem/GCD_CourseProject/blob/master/run_analysis.R) script.

Original data set contains, among others, a 561-feature vector with measurements from smartphone accelerometer and gyroscope in the time and frequency domains, accompanied by the IDs of the subject taking part in the experiment and of the activity the subject was performing. This 561-featre vector data set is the source of data used to prepare the tidy data set described in this codebook.

Detailed description of every variable in the feature data set is available in the ***features_info.txt*** file distributed with the original data set.

More information about the experiment and the structure of the source data is available in the ***README.txt*** file included with the original data set.

To access the home page of the "Human Activity Recognition Using Smartphones" project please follow this [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

###Data structure

The *UCItidyDataMeans.txt* data set is organized in a table of 181 rows (including headers) and 81 columns. Rows represent observations and columns observed variables (measurements).
###Variable naming conventions
Variable naming for variables in columns 3 through 81 is derived from the original data set conventions:

* measurement domain indicates one-letter prefix: t - time, f - frequency
* acceleration source indicates particle: Body - body component, Gravity - gravitational component
* source device, particle: Acc - accelerometer, Gyro - gyroscope
* Jerk signal, particle: Jerk
* cartesian coordinates signal component, particles: X, Y, Z
* magnitude of the cartesian components, particle: Mag
* estimations appled to signal variables: mean - arithmetic mean, std - standard deviation

		Important:
		As all the variables in this tidy data set are means of the 
		original variables (i.e. they are eiter means of means or
		means of standard deviations) this additional application of 
		mean function is not indicated in the variable name of the
		tidy data set.

###Transformations applied to source data set

The source data set is available in two subsets: test and training. Those two subsets are merged into one data set. From the merged data set only the measurements on the mean and standard deviation for each measurement are extracted. Then for each subject and for each activity **a mean value for all the extracted measurements is calculated**. Those mean values are stored in the variables in columns 3 through 81, described in a table below.
###Units

All variables are unitless. For variables in columns 3 through 81 this is due to their normalization.

Original linear inertial signals are expressed in 'g' units and radial inertial signals in rad/s.
###Ranges

All variables in columns 3 through 81 are normalized i.e. their range is [-1,1]

##Variable description
*Note: The description "Mean of x" refers to the variable name from the original data set.*


| Col. no | Variable name | Type |          Description              |
|--------:|:--------------|:-----|:----------------------------------|
| 1 |  SubjectID | Num | ID of the Subject.<br>**Range**: [1,30]. |
| 2 |  ActivityName | Char | Descriptive name of the activity.<br>**Elements**: <br>LAYING, <br>SITTING, <br>STANDING, <br>WALKING, <br>WALKING\_DOWNSTAIRS, <br>WALKING\_UPSTAIRS |
| 3 |  tBodyAcc.mean.X | Num | Mean of tBodyAcc-mean()-X |
| 4 |  tBodyAcc.mean.Y | Num | Mean of tBodyAcc-mean()-Y |
| 5 |  tBodyAcc.mean.Z | Num | Mean of tBodyAcc-mean()-Z |
| 6 |  tBodyAcc.std.X | Num | Mean of tBodyAcc-std()-X |
| 7 |  tBodyAcc.std.Y | Num | Mean of tBodyAcc-std()-Y |
| 8 |  tBodyAcc.std.Z | Num | Mean of tBodyAcc-std()-Z |
| 9 |  tGravityAcc.mean.X | Num | Mean of tGravityAcc-mean()-X |
| 10 |  tGravityAcc.mean.Y | Num | Mean of tGravityAcc-mean()-Y |
| 11 |  tGravityAcc.mean.Z | Num | Mean of tGravityAcc-mean()-Z |
| 12 |  tGravityAcc.std.X | Num | Mean of tGravityAcc-std()-X |
| 13 |  tGravityAcc.std.Y | Num | Mean of tGravityAcc-std()-Y |
| 14 |  tGravityAcc.std.Z | Num | Mean of tGravityAcc-std()-Z |
| 15 |  tBodyAccJerk.mean.X | Num | Mean of tBodyAccJerk-mean()-X |
| 16 |  tBodyAccJerk.mean.Y | Num | Mean of tBodyAccJerk-mean()-Y |
| 17 |  tBodyAccJerk.mean.Z | Num | Mean of tBodyAccJerk-mean()-Z |
| 18 |  tBodyAccJerk.std.X | Num | Mean of tBodyAccJerk-std()-X |
| 19 |  tBodyAccJerk.std.Y | Num | Mean of tBodyAccJerk-std()-Y |
| 20 |  tBodyAccJerk.std.Z | Num | Mean of tBodyAccJerk-std()-Z |
| 21 |  tBodyGyro.mean.X | Num | Mean of tBodyGyro-mean()-X |
| 22 |  tBodyGyro.mean.Y | Num | Mean of tBodyGyro-mean()-Y |
| 23 |  tBodyGyro.mean.Z | Num | Mean of tBodyGyro-mean()-Z |
| 24 |  tBodyGyro.std.X | Num | Mean of tBodyGyro-std()-X |
| 25 |  tBodyGyro.std.Y | Num | Mean of tBodyGyro-std()-Y |
| 26 |  tBodyGyro.std.Z | Num | Mean of tBodyGyro-std()-Z |
| 27 |  tBodyGyroJerk.mean.X | Num | Mean of tBodyGyroJerk-mean()-X |
| 28 |  tBodyGyroJerk.mean.Y | Num | Mean of tBodyGyroJerk-mean()-Y |
| 29 |  tBodyGyroJerk.mean.Z | Num | Mean of tBodyGyroJerk-mean()-Z |
| 30 |  tBodyGyroJerk.std.X | Num | Mean of tBodyGyroJerk-std()-X |
| 31 |  tBodyGyroJerk.std.Y | Num | Mean of tBodyGyroJerk-std()-Y |
| 32 |  tBodyGyroJerk.std.Z | Num | Mean of tBodyGyroJerk-std()-Z |
| 33 |  tBodyAccMag.mean | Num | Mean of tBodyAccMag-mean() |
| 34 |  tBodyAccMag.std | Num | Mean of tBodyAccMag-std() |
| 35 |  tGravityAccMag.mean | Num | Mean of tGravityAccMag-mean() |
| 36 |  tGravityAccMag.std | Num | Mean of tGravityAccMag-std() |
| 37 |  tBodyAccJerkMag.mean | Num | Mean of tBodyAccJerkMag-mean() |
| 38 |  tBodyAccJerkMag.std | Num | Mean of tBodyAccJerkMag-std() |
| 39 |  tBodyGyroMag.mean | Num | Mean of tBodyGyroMag-mean() |
| 40 |  tBodyGyroMag.std | Num | Mean of tBodyGyroMag-std() |
| 41 |  tBodyGyroJerkMag.mean | Num | Mean of tBodyGyroJerkMag-mean() |
| 42 |  tBodyGyroJerkMag.std | Num | Mean of tBodyGyroJerkMag-std() |
| 43 |  fBodyAcc.mean.X | Num | Mean of fBodyAcc-mean()-X |
| 44 |  fBodyAcc.mean.Y | Num | Mean of fBodyAcc-mean()-Y |
| 45 |  fBodyAcc.mean.Z | Num | Mean of fBodyAcc-mean()-Z |
| 46 |  fBodyAcc.std.X | Num | Mean of fBodyAcc-std()-X |
| 47 |  fBodyAcc.std.Y | Num | Mean of fBodyAcc-std()-Y |
| 48 |  fBodyAcc.std.Z | Num | Mean of fBodyAcc-std()-Z |
| 49 |  fBodyAcc.meanFreq.X | Num | Mean of fBodyAcc-meanFreq()-X |
| 50 |  fBodyAcc.meanFreq.Y | Num | Mean of fBodyAcc-meanFreq()-Y |
| 51 |  fBodyAcc.meanFreq.Z | Num | Mean of fBodyAcc-meanFreq()-Z |
| 52 |  fBodyAccJerk.mean.X | Num | Mean of fBodyAccJerk-mean()-X |
| 53 |  fBodyAccJerk.mean.Y | Num | Mean of fBodyAccJerk-mean()-Y |
| 54 |  fBodyAccJerk.mean.Z | Num | Mean of fBodyAccJerk-mean()-Z |
| 55 |  fBodyAccJerk.std.X | Num | Mean of fBodyAccJerk-std()-X |
| 56 |  fBodyAccJerk.std.Y | Num | Mean of fBodyAccJerk-std()-Y |
| 57 |  fBodyAccJerk.std.Z | Num | Mean of fBodyAccJerk-std()-Z |
| 58 |  fBodyAccJerk.meanFreq.X | Num | Mean of fBodyAccJerk-meanFreq()-X |
| 59 |  fBodyAccJerk.meanFreq.Y | Num | Mean of fBodyAccJerk-meanFreq()-Y |
| 60 |  fBodyAccJerk.meanFreq.Z | Num | Mean of fBodyAccJerk-meanFreq()-Z |
| 61 |  fBodyGyro.mean.X | Num | Mean of fBodyGyro-mean()-X |
| 62 |  fBodyGyro.mean.Y | Num | Mean of fBodyGyro-mean()-Y |
| 63 |  fBodyGyro.mean.Z | Num | Mean of fBodyGyro-mean()-Z |
| 64 |  fBodyGyro.std.X | Num | Mean of fBodyGyro-std()-X |
| 65 |  fBodyGyro.std.Y | Num | Mean of fBodyGyro-std()-Y |
| 66 |  fBodyGyro.std.Z | Num | Mean of fBodyGyro-std()-Z |
| 67 |  fBodyGyro.meanFreq.X | Num | Mean of fBodyGyro-meanFreq()-X |
| 68 |  fBodyGyro.meanFreq.Y | Num | Mean of fBodyGyro-meanFreq()-Y |
| 69 |  fBodyGyro.meanFreq.Z | Num | Mean of fBodyGyro-meanFreq()-Z |
| 70 |  fBodyAccMag.mean | Num | Mean of fBodyAccMag-mean() |
| 71 |  fBodyAccMag.std | Num | Mean of fBodyAccMag-std() |
| 72 |  fBodyAccMag.meanFreq | Num | Mean of fBodyAccMag-meanFreq() |
| 73 |  fBodyAccJerkMag.mean | Num | Mean of fBodyBodyAccJerkMag-mean() |
| 74 |  fBodyAccJerkMag.std | Num | Mean of fBodyBodyAccJerkMag-std() |
| 75 |  fBodyAccJerkMag.meanFreq | Num | Mean of fBodyBodyAccJerkMag-meanFreq() |
| 76 |  fBodyGyroMag.mean | Num | Mean of fBodyBodyGyroMag-mean() |
| 77 |  fBodyGyroMag.std | Num | Mean of fBodyBodyGyroMag-std() |
| 78 |  fBodyGyroMag.meanFreq | Num | Mean of fBodyBodyGyroMag-meanFreq() |
| 79 |  fBodyGyroJerkMag.mean | Num | Mean of fBodyBodyGyroJerkMag-mean() |
| 80 |  fBodyGyroJerkMag.std | Num | Mean of fBodyBodyGyroJerkMag-std() |
| 81 |  fBodyGyroJerkMag.meanFreq | Num | Mean of fBodyBodyGyroJerkMag-meanFreq() |

*Rev. 1.0.1<br>2015.08.23*