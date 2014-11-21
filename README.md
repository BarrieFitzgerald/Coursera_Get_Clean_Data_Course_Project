Getting and Cleaning Data: Course Project
=========================================

Introduction
------------
This repository contains the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization.

Notes on the original data.

About the data
------------------
Test Dataset:
* The 561 available features are found in the x_test.txt. The data is not labeled.
* The activity labels are located in the y_test.txt file.
* The test subjects are located in the subject_test.txt file.

Train Dataset:
* The 561 available features are found in the x_train.txt. The data is not labeled.
* The activity labels are located in the y_train.txt file.
* The test subjects are located the subject_train.txt file.

About the script
-------------------------------------
A script (Get_Clean_Data_Rscript.r) was created to devel called run_analysis.R which will merge the test and training sets together.
Prerequisites for this script:

1. the UCI HAR Dataset must be extracted and..
2. the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.

