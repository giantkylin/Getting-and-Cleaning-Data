# Cousera Getting and Cleaning Data course final project R code

# source library
library(data.table)
library(dplyr)

# set working directory if not set separately
#wd <- "C:\\Users\\lenovo\\workspace\\GD\\project"
#setwd(wd)

# number of rows to test
nrows = -1

# Directories and files
X_train <- "UCI HAR Dataset\\train\\X_train.txt"
subject_train <- "UCI HAR Dataset\\train\\subject_train.txt"
Y_train <- "UCI HAR Dataset\\train\\y_train.txt"
X_test <- "UCI HAR Dataset\\test\\X_test.txt"
subject_test <- "UCI HAR Dataset\\test\\subject_test.txt"
Y_test <- "UCI HAR Dataset\\test\\y_test.txt"
file_feature <- "UCI HAR Dataset\\features.txt"
activity_label <- "UCI HAR Dataset\\activity_labels.txt"

# Load all data

df_train <- read.table(X_train, sep = "", header = FALSE, colClasses = "numeric", nrows = nrows)
subject_train <- read.table(subject_train, sep = "", header = FALSE, colClasses = "numeric", nrows = nrows)
activity_train <- read.table(Y_train, sep = "", header = FALSE, colClasses = "numeric", nrows = nrows)
df_test <- read.table(X_test, header = FALSE, sep = "", colClasses = "numeric", nrows = nrows)
subject_test <- read.table(subject_test, sep = "", header = FALSE, colClasses = "numeric", nrows = nrows)
activity_test <- read.table(Y_test, sep = "", header = FALSE, colClasses = "numeric", nrows = nrows)
act_lbl <- read.table(activity_label, sep="", header = FALSE,stringsAsFactors = FALSE)
colname <- read.table(file_feature, sep ="", header = FALSE, stringsAsFactors = FALSE)

# merge all data 

df <- rbind(df_train, df_test)
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)

# Find all mean and std values and set the colnames
sel <- grep("mean[(][)]|std[(][)]", colname[[2]])
dfs <- df[,colname[sel,1]]
colnames(dfs) <- colname[sel,2]
dfs$subject <- subject[[1]]
dfs$activity <- activity[[1]]
dt <- tbl_df(dfs)
colnames(act_lbl) <- c("activity", "activities")
dt <- merge(dt, act_lbl, by = "activity")
dt <- select(dt, -activity)

# shape the colnames so it is more understandable
names(dt) <- gsub('\\(|\\)',"",names(dt), perl = TRUE)
names(dt) <- gsub('^t',"Time",names(dt))
names(dt) <- gsub('^f',"Frequency",names(dt))
names(dt) <- gsub('Acc', "Acceleration", names(dt))
names(dt) <- gsub('GyroJerk', "AngularAcceleration", names(dt))
names(dt) <- gsub('Gyro', "AugularSpeed", names(dt))
names(dt) <- gsub('Mag', "Magnitude", names(dt))

# group the data by subject and activities to calculate mean
aggr.data <- aggregate(dt[1:63], by=list(subject = dt$subject, activities = dt$activities),mean)

#check data
str(aggr.data)

# write to text file
write.table(format(aggr.data, scientific=F), "result_tidy.txt", row.names=F, col.names=T, quote=2)


