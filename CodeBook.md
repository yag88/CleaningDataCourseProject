CodeBook.md - Getting and Cleaning Data Course Project
======================================================

by YAG, on 18/6/2017

Overview
--------

This code book explains where the data comes from, what operations we performed on it, and the variables in the resulting dataset.

Source
------

We used the Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: (<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>).

The data for the project is this 62.6 MB file: (<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>)

Processing
----------

We conducted the following 5 steps, that are documented with more details in the comments of `run_analysis.R`:

-   (1/5) Merges the training and the test sets to create one data set.
    -   we have created a `FullDataSet` dataframe, but we did not upload it to Github as it is more than 67MB.
-   (2/5) Extracts only the measurements on the mean and standard deviation for each measurement.
-   (3/5) Uses descriptive activity names to name the activities in the data set
-   (4/5) Appropriately labels all the previous tables with descriptive variable names.
-   (5/5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    -   we have created a `NewTidySet.csv` file containing the result of step 5

Observations
------------

Here are the 81 fields for the 10299 observations in `NewTidySet.csv`:

-   Id\_subject - The ID of the test subject for each measurement (between 1 and 30)
-   Id\_activity - The type of activity performed for each measurement (saved as a factor for readability), among 6 activities.
-   Measurements on 79 columns. The column names can be read directly:
    -   tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX tBodyAccStdY tBodyAccStdZ tGravityAccMeanX tGravityAccMeanY tGravityAccMeanZ tGravityAccStdX tGravityAccStdY tGravityAccStdZ tBodyAccJerkMeanX tBodyAccJerkMeanY tBodyAccJerkMeanZ tBodyAccJerkStdX tBodyAccJerkStdY tBodyAccJerkStdZ tBodyGyroMeanX tBodyGyroMeanY tBodyGyroMeanZ tBodyGyroStdX tBodyGyroStdY tBodyGyroStdZ tBodyGyroJerkMeanX tBodyGyroJerkMeanY tBodyGyroJerkMeanZ tBodyGyroJerkStdX tBodyGyroJerkStdY tBodyGyroJerkStdZ tBodyAccMagMean tBodyAccMagStd tGravityAccMagMean tGravityAccMagStd tBodyAccJerkMagMean tBodyAccJerkMagStd tBodyGyroMagMean tBodyGyroMagStd tBodyGyroJerkMagMean tBodyGyroJerkMagStd fBodyAccMeanX fBodyAccMeanY fBodyAccMeanZ fBodyAccStdX fBodyAccStdY fBodyAccStdZ fBodyAccMeanFreqX fBodyAccMeanFreqY fBodyAccMeanFreqZ fBodyAccJerkMeanX fBodyAccJerkMeanY fBodyAccJerkMeanZ fBodyAccJerkStdX fBodyAccJerkStdY fBodyAccJerkStdZ fBodyAccJerkMeanFreqX fBodyAccJerkMeanFreqY fBodyAccJerkMeanFreqZ fBodyGyroMeanX fBodyGyroMeanY fBodyGyroMeanZ fBodyGyroStdX fBodyGyroStdY fBodyGyroStdZ fBodyGyroMeanFreqX fBodyGyroMeanFreqY fBodyGyroMeanFreqZ fBodyAccMagMean fBodyAccMagStd fBodyAccMagMeanFreq fBodyBodyAccJerkMagMean fBodyBodyAccJerkMagStd fBodyBodyAccJerkMagMeanFreq fBodyBodyGyroMagMean fBodyBodyGyroMagStd fBodyBodyGyroMagMeanFreq fBodyBodyGyroJerkMagMean fBodyBodyGyroJerkMagStd fBodyBodyGyroJerkMagMeanFreq
