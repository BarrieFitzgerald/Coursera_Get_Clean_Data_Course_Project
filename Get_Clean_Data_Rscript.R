## setting the working directory and creating a folder if need be
        ## NOTE: THIS OR PARTS MAY NOT NEED TO BE RAN IF WORKING DIRECTORY 
        ## AND/OR FOLDER ALREADY EXISTS
setwd("C:/Users/bdfitzgerald/Desktop")
if(!file.exists("get_clean_project")){dir.create("get_clean_project")}
setwd("C:/Users/bdfitzgerald/Desktop/get_clean_project")

## downloading and unzipping the file
        ## NOTE: THIS MAY NOT NEED TO BE RAN AGAIN IF FILE HAS ALREADY
        ## BEEN DOWNLOADED AND UNZIPPED
fileurl <- c("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ")
download.file(fileurl, destfile = "Data_set.zip", mode = "wb")
unzip("Data_set.zip")

## Creating the working files
        ## Training data
training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
        ## Testing data
testing = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
        ## Labels
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
        ## Read features and make the feature names better suited for
        ## R with some substitutions
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])
        ## Merge training and test sets together
allData = rbind(training, testing)
        ## Filtering to only the needed items
colsWeWant <- grep(".*Mean.*|.*Std.*", features[,2])
        # First reduce the features table to what we want
features <- features[colsWeWant,]
        # Now add the last two columns (subject and activity)
colsWeWant <- c(colsWeWant, 562, 563)
        # And remove the unwanted columns from allData
allData <- allData[,colsWeWant]
        # Add the column names (features) to allData
colnames(allData) <- c(features$V2, "Activity", "Subject")
colnames(allData) <- tolower(colnames(allData))
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
        allData$activity <- gsub(currentActivity, currentActivityLabel, allData$activity)
        currentActivity <- currentActivity + 1
}
allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)
tidy = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)

## Creating a Tidy Data Set
        ## Removing the subject and activity column, since a mean of those has no use
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t")
