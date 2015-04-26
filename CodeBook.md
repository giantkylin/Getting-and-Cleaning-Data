# CodeBook

This describes the variables, the data, and any transformations that you performed to fetch the data.

## The data source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The input data

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## output data

**the tidy data set containes 180 observations with 65 variables:**

* an activity labe (Activities): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* an subject identifer: 1, 2, 3, ..., 30
* a 63 variables with time and frequency signal variables ( numeric )

## Transformation details
###how to use run_analysis.R

1. Download the data source and put into a folder. 
2. Set the folder as your working directory using setwd() function in RStudio.
3. Unzip the file and you'll have a UCI HAR Dataset folder.
4. Make sure run_analysis.R is in the working direcory. 
5. Run source("run_analysis.R"), then it will generate a new file result_tidy.txt in your working directory

###run_analysis.R walkthrough step by step.

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
