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

**how to use run_analysis.R**

1. Download the data source and put into a folder. 
2. Set the folder as your working directory using setwd() function in RStudio.
3. Unzip the file and you'll have a UCI HAR Dataset folder.
4. Make sure run_analysis.R is in the working direcory. 
5. Run source("run_analysis.R"), then it will generate a new file result_tidy.txt in your working directory

**run_analysis.R walkthrough step by step.**

Step 1:
import proper libraries.

Step 2:
set working directory in case no exteral set

Step 3:
Read all the test and training files: y_test.txt, subject_test.txt and X_test.txt.
Read the features from features.txt and filter it to only leave features that are either means ("mean()") or standard deviations ("std()"). 
Read the activity labels from activity_labels.txt and replace the numbers with the text.

Step 4:
Combine the files to a data frame in the form of subjects, labels, the rest of the data.
A new data frame is then created that includes subjects, labels and the described features.

Step 5:
Remove all non-alphanumeric characters and apply the now-good-columnnames to the data frame.

Step 6:
Create a new data frame by finding the mean for each combination of subject and label by aggregate() function.

Step 7:
Write the new tidy set into a text file called result_tidy.txt, formatted similarly to the original files.
