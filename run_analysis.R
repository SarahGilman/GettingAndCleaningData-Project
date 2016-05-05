## Load necessary libraries
library(stringr)
library(dplyr)

## Get the data set if necessary
fileName = "UCI HAR Dataset"
if ( !file.exists(fileName) ) { 
    temp <- "Dataset.zip"
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp, method="curl") 
    unzip(temp)
}

## (1) Read & merges the training and the test sets to create one data set.
## For subjects and labels, use basic rbind to glue vectors together
subjects <- rbind(
    read.csv(paste(fileName,"/train/subject_train.txt",sep=""), sep=" ", header=FALSE), 
    read.csv(paste(fileName,"/test/subject_test.txt",sep=""), sep=" ", header=FALSE) )
labels <- rbind(
    read.csv(paste(fileName,"/train/y_train.txt",sep=""), sep=" ", header=FALSE), 
    read.csv(paste(fileName,"/test/y_test.txt",sep=""), sep=" ", header=FALSE) )

## (2) Extracts only the measurements on the mean and standard deviation for each measurement.
## Use features file to list rows, and grep tp select those which are mean or standard devaition values
features <- read.csv(paste(fileName,"/features.txt",sep=""), sep=" ", header=FALSE)
features[,3] <- tolower( features[,2] )
meansAndStddev <- grep( "mean\\(|std\\(", features[,3] )

## For activity reports, read each row, extract appropriate data columns,
## convert to numeric, and attach row to an activity data frame
## Data frame initialized with correct row and column counts for speedier editing
activity = data.frame(matrix(ncol = length(meansAndStddev), nrow = length(labels)))
res <- readLines(file(paste(fileName,"/train/X_train.txt",sep="")))
for (i in 1:length(res)) {
    row <- as.numeric( unlist(strsplit(gsub("  ", " ", str_trim(res[i], side="both")), " ")) )
    activity[i,] <- row[meansAndStddev]
}
res <- readLines(file(paste(fileName,"/test/X_test.txt",sep="")))
for (j in 1:length(res)) {
    row <- as.numeric( unlist(strsplit(gsub("  ", " ", str_trim(res[j], side="both")), " ")) )
    activity[i + j,] <- row[meansAndStddev]
}

## (4) Appropriately labels the data set with descriptive variable names.
## Use feature names from file for the column names 
colnames(activity) <- features[meansAndStddev, 2]

## Add columns to activity data with subject and activity labels  
activity[,"subject"] <- subjects
activity[,"labelCode"] <- labels

## (3) Uses descriptive activity names to name the activities in the data set
## Merge all activity indicies with appropriate text, remove activity codes
activity_labels <- read.csv(paste(fileName,"/activity_labels.txt",sep=""), sep=" ", header=FALSE)
activity <- merge(activity, activity_labels, by.x="labelCode", by.y="V1", sort=FALSE)
names(activity)[names(activity)=="V2"] <- "activity"
activity["labelCode"] <- NULL 

## (5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Use pipeline of group_by and summarize_each to find mean values for each variable over subject and activity
activity_summary <- activity %>% group_by(subject, activity) %>% summarize_each(funs(mean))

## write the summary table 
write.table(activity_summary, file=paste(fileName,"/activity_summary.txt", sep=""), sep=" ", row.name=FALSE)
