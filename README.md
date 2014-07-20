#Getting & Cleaning Data

Course project *Getting &amp; Cleaning Data* course (Coursera)

The *run_analysis.R* script undertakes the following actions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##Raw Data
* Information about the raw data set can be obtained on: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The raw data was downloaded from a mirror site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##Tidy Data Set
The tidy data set has been upoaded as UCI_HAR_Dataset.csv

##CodeBook
The data set contains the following 81 variables:

1. Subject: Subject number (1-30)
2. Activity: Activity type (1=Walking, 2=walking upstairs, 3=walking downstairs, 4=sitting, 5=standing, 6=laying)

Remaining variables provide measurements (some of which in three axes). For each variable, the mean and standard deviation are available:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

##Procedure
The run_analysis.R file transforms the data set as follows:

1. Download and unzip the raw data (if not already present)
2. Read all relevant table (training and data set bounded)
3. Assign variable names
4. Edit variable names (remove brackets and replace dashes with underscores to force compatability)
5. Filter variables with measurements on the mean and standard deviation for each measurement
6. Add subjects and activities to measurements
7. Write partial data set to disk
