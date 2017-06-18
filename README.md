README.md - Getting and Cleaning Data Course Project
====================================================

by YAG on 18/6/2017

Overview
--------

This repository contains the R code and documentation files for the Course Project of "Getting and Cleaning data" (<https://www.coursera.org/learn/data-cleaning/>)

Files
-----

`README.md` is the present file. It describes the content of the repository.

`CodeBook.md` gives the references for the data, and describes the variables of the data.

`run_analysis.R` contains all the code to perform the analyses described in the `CodeBook.md` , as per the 5 steps required for the project:

-   (1/5) Merges the training and the test sets to create one data set.
    -   we have created a `FullDataSet` dataframe, but we did not upload it to Github as it is more than 67MB.
-   (2/5) Extracts only the measurements on the mean and standard deviation for each measurement.
-   (3/5) Uses descriptive activity names to name the activities in the data set
-   (4/5) Appropriately labels all the previous tables with descriptive variable names.
-   (5/5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    -   we have created a `NewTidySet.csv` file containing the result of step 5

`NewTidySet.csv` is the new tidy data set with the average of each variable for each activity and each subject.
