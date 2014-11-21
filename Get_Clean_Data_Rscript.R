## setiting the working directory and creating a folder
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
## preparing the training data
train = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
train[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
## preparting the testing data
test = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
test[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
## preparing the labels
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
## preparing adjusting read features for R with substituting
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])
## Merge the two data files together
data = rbind(train, test)
## filtering only the data needed
colsneed <- grep(".*Mean.*|.*Std.*", features[,2])
# filtering teh features to needed items
features <- features[colsneed,]
# adding the last two columns
colsneed <- c(colsneed, 562, 563)
# removing any unwated data columns
data <- data[,colsneed]
# adding column names
colnames(data) <- c(features$V2, "Activity", "Subject")
colnames(data) <- tolower(colnames(data))
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
        data$activity <- gsub(currentActivity, currentActivityLabel, data$activity)
        currentActivity <- currentActivity + 1
}
data$activity <- as.factor(data$activity)
data$subject <- as.factor(data$subject)
tidy = aggregate(data, by=list(activity = data$activity, subject = data$subject), mean)

## creating the tidy data to upload for submission
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t")


