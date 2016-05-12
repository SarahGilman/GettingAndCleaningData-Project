# Data Variables 

The features in this data set are a processed summary of another database measuring accelerometer and gyroscope 3-axial signals. Original data contained mean and standard deviation values over various time measurements. 

For this summary: 
- Any data point that was a mean or standard deviation was selected (measurements with names ending in "mean()" or "std()")
- Data were grouped by subject (1-30) and activity ().
- Averages were taken over groups. 

These measurements for each subject/activity pair are:  
‘()-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc.mean()-XYZ
- tBodyAcc.std()-XYZ
- tGravityAcc.mean()-XYZ
- tGravityAcc.std()-XYZ
- tBodyAccJerk.mean()-XYZ
- tBodyAccJerk.std()-XYZ
- tBodyGyro.mean()-XYZ
- tBodyGyro.std()-XYZ
- tBodyGyroJerk.mean()-XYZ
- tBodyGyroJerk.std()-XYZ
- tBodyAccMag.mean()
- tBodyAccMag.std()
- tGravityAccMag.mean()
- tGravityAccMag.std()
- tBodyAccJerkMag.mean()
- tBodyAccJerkMag.std()
- tBodyGyroMag.mean()
- tBodyGyroMag.std()
- tBodyGyroJerkMag.mean()
- tBodyGyroJerkMag.std()
- fBodyAcc.mean()-XYZ
- fBodyAcc.std()-XYZ
- fBodyAccJerk.mean()-XYZ
- fBodyAccJerk.std()-XYZ
- fBodyGyro.mean()-XYZ
- fBodyGyro.std()-XYZ
- fBodyAccMag.mean()
- fBodyAccMag.std()
- fBodyBodyAccJerkMag.mean()
- fBodyBodyAccJerkMag.std()
- fBodyBodyGyroMag.mean()
- fBodyBodyGyroMag.std()
- fBodyBodyGyroJerkMag.mean()
- fBodyBodyGyroJerkMag.std()

The complete list of variables of each feature vector is available in ‘features.txt’

# R Script Details
(1) Read & merges the training and the test sets to create one data set: Script uses rbind to combine subject and activity label vectors. Activity data are processed row by row to accomodate extra whitespaces and select only a subset of fields.

(2) Extracts only the measurements on the mean and standard deviation for each measurement: Script uses grep command on feature names to identify desired fields - those ending with mean() or std().

(3) Uses descriptive activity names to name the activities in the data set: Script replaces text for activities descriptions instead of numeric activity codes. 

(4) Appropriately labels the data set with descriptive variable names: Script uses feature names from the original data as column names.

(5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject: Script uses pipeline of group_by and summarize_each to find mean values for each variable over subject and activity

