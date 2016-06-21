#CodeBook
This codebook describes the variables, the data, and any transformations or work performed to clean up data.

##The Data
The resulting tidy dataset consists of a subset of the fields from the "Human Activity Recognition Using Smartphones" data set after extracting the original data source and using the following files:

> Original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Files in folder ‘UCI HAR Dataset’ that will be used are:**

1. SUBJECT FILES
- test/subject_test.txt
- train/subject_train.txt
2. ACTIVITY FILES
- test/X_test.txt
- train/X_train.txt
3. DATA FILES
- test/y_test.txt
- train/y_train.txt
4. features.txt - Names of column variables in the dataTable
5. activity_labels.txt - Links the class labels with their activity name.


##The Variables

**Description of abbreviations of measurements**

   - leading t or f is based on time or frequency measurements.
   - Body = related to body movement.
   - Gravity = acceleration of gravity
   - Acc = accelerometer measurement
   - Gyro = gyroscopic measurements
   - Jerk = sudden movement acceleration
   - Mag = magnitude of movement
   - mean and SD are calculated for each subject for each activity for each mean and SD measurements.

The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.


**Identifiers**

 - subject - The ID of the test subject activity 
 - The type of activity
   performed when the corresponding measurements were taken

**Measurements**

 - tBodyAccMeanX
 - tBodyAccMeanY
 - tBodyAccMeanZ
 - tBodyAccStdX
 - tBodyAccStdY
 - tBodyAccStdZ
 - tGravityAccMeanX
 - tGravityAccMeanY
 - tGravityAccMeanZ
 - tGravityAccStdX
 - tGravityAccStdY
 - tGravityAccStdZ
 - tBodyAccJerkMeanX
 - tBodyAccJerkMeanY
 - tBodyAccJerkMeanZ
 - tBodyAccJerkStdX
 - tBodyAccJerkStdY
 - tBodyAccJerkStdZ
 - tBodyGyroMeanX
 - tBodyGyroMeanY
 - tBodyGyroMeanZ
 - tBodyGyroStdX
 - tBodyGyroStdY
 - tBodyGyroStdZ
 - tBodyGyroJerkMeanX
 - tBodyGyroJerkMeanY
 - tBodyGyroJerkMeanZ
 - tBodyGyroJerkStdX
 - tBodyGyroJerkStdY
 - tBodyGyroJerkStdZ
 - tBodyAccMagMean
 - tBodyAccMagStd
 - tGravityAccMagMean
 - tGravityAccMagStd
 - tBodyAccJerkMagMean
 - tBodyAccJerkMagStd
 - tBodyGyroMagMean
 - tBodyGyroMagStd
 - tBodyGyroJerkMagMean
 - tBodyGyroJerkMagStd
 - fBodyAccMeanX
 - fBodyAccMeanY
 - fBodyAccMeanZ
 - fBodyAccStdX
 - fBodyAccStdY
 - fBodyAccStdZ
 - fBodyAccMeanFreqX
 - fBodyAccMeanFreqY
 - fBodyAccMeanFreqZ
 - fBodyAccJerkMeanX
 - fBodyAccJerkMeanY
 - fBodyAccJerkMeanZ
 - fBodyAccJerkStdX
 - fBodyAccJerkStdY
 - fBodyAccJerkStdZ
 - fBodyAccJerkMeanFreqX
 - fBodyAccJerkMeanFreqY
 - fBodyAccJerkMeanFreqZ
 - fBodyGyroMeanX
 - fBodyGyroMeanY
 - fBodyGyroMeanZ
 - fBodyGyroStdX
 - fBodyGyroStdY
 - fBodyGyroStdZ
 - fBodyGyroMeanFreqX
 - fBodyGyroMeanFreqY
 - fBodyGyroMeanFreqZ
 - fBodyAccMagMean
 - fBodyAccMagStd
 - fBodyAccMagMeanFreq
 - fBodyBodyAccJerkMagMean
 - fBodyBodyAccJerkMagStd
 - fBodyBodyAccJerkMagMeanFreq
 - fBodyBodyGyroMagMean
 - fBodyBodyGyroMagStd
 - fBodyBodyGyroMagMeanFreq
 - fBodyBodyGyroJerkMagMean
 - fBodyBodyGyroJerkMagStd
 - fBodyBodyGyroJerkMagMeanFreq

**Activity Labels**

   - WALKING (value 1): subject was walking during the test
   - WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
   - WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
   - SITTING (value 4): subject was sitting during the test
   - STANDING (value 5): subject was standing during the test
   - LAYING (value 6): subject was laying down during the test

## Work performed to cleanup the data

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.