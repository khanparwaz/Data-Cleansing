###########################
# Getting and Cleaning Data
# Course Project
# Peter Prevos
# prevos.net
###########################

# INITIALISATION
# Clean environment
rm(list = ls())
# Download and unpack zip file
if (!file.exists("UCI HAR Dataset.zip")) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, dest="UCI HAR Dataset.zip", method="curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip("UCI HAR Dataset.zip")
}
# Read tables
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")[2]
subject <-  rbind(read.table("UCI HAR Dataset/test/subject_test.txt"), read.table("UCI HAR Dataset/train/subject_train.txt"))
activity_lables <- rbind(read.table("UCI HAR Dataset/test/y_test.txt"), read.table("UCI HAR Dataset/train/y_train.txt"))
data_set <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt"))
# Asign variable names
names(activity) <- c("lable", "activity")
names(features) <- "feature"
names(subject) <- "subject"
names(activity_lables) <- "lable"
names(data_set) <- features$feature

# Remove brackets from field names
names(data_set) <- sub("\\(\\)", "", names(data_set))
# Replace dash with underscore
names(data_set) <- gsub("-", "_", names(data_set))
# Determine locations of mean and std
mean_std <- c(grep("mean", names(data_set)), grep("std", names(data_set)))
# Keep only mean and std values
data_set <- data_set[mean_std]
# Add subjects and activities
activity_lables <- merge(activity_lables, activity, by="lable")
data_set <- cbind(subject, activity_lables[2], data_set)


# Write subset to disk
write.csv(data_set[1:100,], "UCI_HAR_Dataset.csv")
