# Coursera_Getting_and_CleanData_project

This repository contains project deliverables for the course of Getting and Cleaning Data in Coursera.
The deliverables includes following files,
- readme.md : this document
- codebook.md : indicates all the variables and summaries calculated, along with units, and any other relevant information
- tidy_data_set.txt : outcome of run_analysis.R
- run_analysis.R : R script which conducts following,

	1. download rawdata from web: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  2. Merges the training and the test sets to create one data set.
	3. Extracts only the measurements on the mean and standard deviation for each measurement.
	4. Uses descriptive activity names to name the activities in the data set
	5. Appropriately labels the data set with descriptive variable names.
From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
