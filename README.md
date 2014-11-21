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

About the script and the cleaning process
-------------------------------------
A script (Get_Clean_Data_Rscript.r) was created to merge the test and train data sets. Direct link to script: https://github.com/BarrieFitzgerald/Coursera_Get_Clean_Data_Course_Project/blob/master/Get_Clean_Data_Rscript.R

There are helpful notes in the script that must be followed in teh initial set up.

First, you need to set up your working directory and folder.
Second, you need to download the data.
Third, you need to download the data and unzip the file to begin working the script
Now, you can begin the process of cleaning the data to create a tidy data set.

After the merger of two sets of data, lables are added. and extra data (data not needed) were excluded. 
Only the mean and standard deviation variables were kept.

About the exporting of the dataset
-------------------------------------
Once the data set has been created, the script will export the dataset as a tab-delimited file called "tidy.txt." Direct link to dataset: https://github.com/BarrieFitzgerald/Coursera_Get_Clean_Data_Course_Project/blob/master/tidy.txt

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables. Direct link to CodeBook: https://github.com/BarrieFitzgerald/Coursera_Get_Clean_Data_Course_Project/blob/master/CodeBook.md

