# Getting-and-Cleaning-Data
##Coursera Getting and Cleaning Data Final Project

**Files in this repo.**

* README.md -- you are reading it right now
* CodeBook.md -- codebook describing variables, the data and transformations
* run_analysis.R -- actual R code


**You should create one R script called run_analysis.R that does the following.**

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It should run in a folder of the Samsung data (the zip had this folder: UCI HAR Dataset) The script assumes it has in it's working directory the following files and folders:

* activity_labels.txt
* features.txt
* test/
* train/

The output is created in working directory with the name of result_tidy.txt
