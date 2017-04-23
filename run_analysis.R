##Getting and Cleaning Data Course 
##Johns Hopkins University on Coursera

## by Milana Smuk


## This code does the folowing:
##  1. Merges the training and the test sets to create one data set.
##  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##  3. Uses descriptive activity names to name the activities in the data set.
##  4. Appropriately labels the data set with descriptive variable names. 
##  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.




## 1. Merge the training and the test sets to create one data set.


## 1.1 Download & unzip files 
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
zipFile <- "UCI HAR Dataset.zip" 

if (!file.exists(zipFile)) {
  download.file(fileurl, zipFile, mode = "wb")
}

dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}

## 1.2 Read train and test data sets as well as features and activity labels

trainSubjects <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainValues <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainActivity <- read.table(file.path(dataPath, "train", "y_train.txt"))

testSubjects <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testValues <- read.table(file.path(dataPath, "test", "X_test.txt"))
testActivity <- read.table(file.path(dataPath, "test", "y_test.txt"))

features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)

activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityID", "activityLabel")

##1.3 Merge the train and test sets in one data set

train <- cbind(trainSubjects, trainValues, trainActivity)
test <- cbind(testSubjects, testValues, testActivity)
projectData<- rbind(train, test)

colnames(projectData) <- c("subject", features[, 2], "activity")




## 2. Extract only the measurements on the mean and standard deviation for each measurement. 


columnsNeeded<- grepl("subject|activity|mean|std", colnames(projectData))
projectData <- projectData[, columnsNeeded]




## 3. Use descriptive activity names to name the activities in the data set.

projectData$activity <- factor(projectData$activity, 
                                 levels = activities[, 1], labels = activities[, 2])




## 4. Appropriately label the data set with descriptive variable names

names(projectData) <- gsub("^t", "time", names(projectData))  ##changes names into more descriptive form
names(projectData) <- gsub("^f", "frequency", names(projectData))
names(projectData) <- gsub("Acc", "Accelerometer", names(projectData))
names(projectData) <- gsub("Gyro", "Gyroscope", names(projectData))
names(projectData) <- gsub("Mag", "Magnitude", names(projectData))
names(projectData) <- gsub("BodyBody", "Body", names(projectData))
names(projectData) <- gsub("mean", "Mean", names(projectData))
names(projectData) <- gsub("std", "Std", names(projectData))

names(projectData) <- gsub("[\\(\\)-]", "", names(projectData))  ##removes special caracter





## 5. create an independent tidy data set with the average of each variable for each activity and each subject

library(dplyr)
projectDataMeans <- projectData %>% 
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

write.table(projectDataMeans, "tidy_data.txt", row.names = FALSE, quote = FALSE)



