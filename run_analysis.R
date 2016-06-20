#load libraries needed
library(data.table)
library(dplyr)
library(tidyr)

#Download data to current working directory
fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip')){
        download.file(fileurl,'./UCI HAR Dataset.zip', mode = 'wb')
        unzip("UCI HAR Dataset.zip", exdir = './')
}

#read, combine and convert training data
training_x <- tbl_df(read.table('./UCI HAR Dataset/train/X_train.txt'))
training_activity <- tbl_df(read.table('./UCI HAR Dataset/train/y_train.txt')) #training activity column
training_subject <- tbl_df(read.table('./UCI HAR Dataset/train/subject_train.txt')) #training subject column
training_data <-  bind_cols(training_subject, training_activity, training_x)

#read, combine and convert testing data
test_x <- read.table('./UCI HAR Dataset/test/X_test.txt')
test_activity <- read.table('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ') #test activity column
test_subject <- read.table('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ') #test subject column
test_data <-  bind_cols(test_subject, test_activity, test_x)

#Merges the training and the test sets to create one data set
merged_data <- rbind(training_data, test_data) #bind_rows(training_data, test_data)

#time to put labels or variable names from features.txt and include "subject" and "activity"
features <- read.table('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
names(merged_data) <- c(c('subject', 'activity'), as.character(features[,2]))


#Extracts only the measurements on the mean and standard deviation for each measurement
mean_std_only <- grep('mean|std', features[,2])
merged_data <- merged_data[,c(1,2,mean_std_only + 2)]


#Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity_labels <- as.character(activity_labels[,2]) #we refer to second column for the labels
#column activity in merged_data is replaced according to the corresponding name in activity_labels
merged_data$activity <- activity_labels[merged_data$activity] 


#Appropriately labels the data set with descriptive variable names
name.new <- names(merged_data)
name.new <- gsub("[(][)]", "", name.new)
name.new <- gsub("^t", "TimeDomain_", name.new)
name.new <- gsub("^f", "FrequencyDomain_", name.new)
name.new <- gsub("Acc", "Accelerometer", name.new)
name.new <- gsub("Gyro", "Gyroscope", name.new)
name.new <- gsub("Mag", "Magnitude", name.new)
name.new <- gsub("-mean-", "_Mean_", name.new)
name.new <- gsub("-std-", "_StandardDeviation_", name.new)
name.new <- gsub("-", "_", name.new)
names(merged_data) <- name.new

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_merged_data <- aggregate(merged_data[,3:81], by = list(activity = merged_data$activity, subject = merged_data$subject),FUN = mean)
write.table(x = tidy_merged_data, file = "tidy_merged_data.txt", row.names = FALSE)

