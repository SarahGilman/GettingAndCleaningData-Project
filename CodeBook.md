Feature Selection 
=================

The features in this data set are a processed summary of another database measuring accelerometer and gyroscope 3-axial signals. 

Original data contained mean and standard deviation values over various time measurements. 

For this summary: 
- Any data point that was a mean or standard deviation was selected (measurements with names ending in "mean()" or "std()")
- Data were grouped by subject (1-30) and activity ().
- Averages were taken over groups. 

These measurements for each subject/activity pair are:  
‘()-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc.mean()-XYZ
tBodyAcc.std()-XYZ
tGravityAcc.mean()-XYZ
tGravityAcc.std()-XYZ
tBodyAccJerk.mean()-XYZ
tBodyAccJerk.std()-XYZ
tBodyGyro.mean()-XYZ
tBodyGyro.std()-XYZ
tBodyGyroJerk.mean()-XYZ
tBodyGyroJerk.std()-XYZ
tBodyAccMag.mean()
tBodyAccMag.std()
tGravityAccMag.mean()
tGravityAccMag.std()
tBodyAccJerkMag.mean()
tBodyAccJerkMag.std()
tBodyGyroMag.mean()
tBodyGyroMag.std()
tBodyGyroJerkMag.mean()
tBodyGyroJerkMag.std()
fBodyAcc.mean()-XYZ
fBodyAcc.std()-XYZ
fBodyAccJerk.mean()-XYZ
fBodyAccJerk.std()-XYZ
fBodyGyro.mean()-XYZ
fBodyGyro.std()-XYZ
fBodyAccMag.mean()
fBodyAccMag.std()
fBodyBodyAccJerkMag.mean()
fBodyBodyAccJerkMag.std()
fBodyBodyGyroMag.mean()
fBodyBodyGyroMag.std()
fBodyBodyGyroJerkMag.mean()
fBodyBodyGyroJerkMag.std()


The complete list of variables of each feature vector is available in ‘features.txt’
