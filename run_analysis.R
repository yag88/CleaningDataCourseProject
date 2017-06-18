###############################################
# run_analysis.R
# Part of "Getting and Cleaning Data Course Project"
# YAG
# 18/06/2017
# 5. a R script called `run_analysis.R`. 
###############################################




## Loading the data for the project 
## Dowload and unzip only if it has not been done yet.
filename <- "HARUSdataset.zip"
if (!file.exists(filename)){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, filename, method="curl")
}  
if (!file.exists("HARUSdataset")) { 
      unzip(filename) 
}

# read the data tables:  
# X= data set (561 columns, 7352 obervations)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
# dim(Xtrain)
# [1] 7352  561

# y = vector activity (from 1 to 6) for 7352 observations
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
# dim(Ytrain)
# [1] 7352    1
# table(y_train)
# y_train
#    1    2    3    4    5    6 
# 1226 1073  986 1286 1374 1407 

# subject = (from1 to 30). 9 subject in test, 21 in training
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# features : contains the heading of the 561 columns of X data
features <- read.table('./UCI HAR Dataset/features.txt')

# activity labels: Names for the 6 activities
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt')

# (4/5) Appropriately labels all the previous tables with descriptive variable names.
colnames(X_train) <- features[,2] 
colnames(X_test) <- features[,2] 
colnames(y_train) <-"Id_activity"
colnames(y_test) <- "Id_activity"
colnames(subject_train) <- "Id_subject"
colnames(subject_test) <- "Id_subject"

colnames(activity_labels) <- c('Id_activity','ActivityName')

# (3/5) Uses descriptive activity names to name the activities in the data set
# I turned activities into factors
y_test$Id_activity <- factor(x= y_test$Id_activity, levels = activity_labels[,1], labels = activity_labels[,2])
y_train$Id_activity <- factor(x= y_train$Id_activity, levels = activity_labels[,1], labels = activity_labels[,2])

# (1/5) Merges the training and the test sets to create one data set.
merged_train <- cbind(subject_train, y_train, X_train)
merged_test <- cbind(subject_test,y_test,  X_test)
FullDataSet <- rbind(merged_train, merged_test)

# str(FullDataSet)
# 'data.frame':	10299 obs. of  563 variables:
## That's what I expected : all of 2947 + 7352 rows, on 561+2 columns

## write.csv(FullDataSet, "FullDataSet.csv")
## the File generated after our processing is very large (60MB+), no need to upload it back on github.

# (2/5) Extracts only the measurements on the mean and standard deviation for each measurement.
colNames <- colnames(FullDataSet)
## There are 46 columns with the word "mean"
## 33 columns with the word "std". 
## the difference is apparently "meanFreq" measurements

# Create boolean vector for ID, mean and standard deviation:
mean_std_cols <- (grepl("Id_activity" , colNames) | 
                        grepl("Id_subject" , colNames) | 
                        grepl("mean.." , colNames) | 
                        grepl("std.." , colNames) 
)
# > sum(mean_std_cols)
# [1] 81
## I get the 1+1+46+33 = 81 columns I expected.

# subset from FullDataSet:
MeanStdDataSet <- FullDataSet[ , mean_std_cols]
# str(MeanStdDataSet)
# 'data.frame':	10299 obs. of  81 variables:
## That's what I expected. 


# (5/5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
NewTidySet <- aggregate(. ~Id_subject + Id_activity, MeanStdDataSet, mean)
NewTidySet <- NewTidySet[order(NewTidySet$Id_subject, NewTidySet$Id_activity),]

# str(NewTidySet)
# 'data.frame':	180 obs. of  81 variables:
## I got all the rows for 30 subjects x 6 activities => all is OK.


write.table(NewTidySet, "NewTidySet.txt", row.name=FALSE)

## to keep the result in a new file.

