# GettingAndCleaningData-Project
Final project for the course

# Human Activity Recognition Using Smartphones Dataset -- Summary Data 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Original study used phone’s embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The data set here took all mean and standard deviation measures from the original study, and reports the average for these measures grouped these by subject and activity performed. Uses training and test data from original database.

For each record it is provided:

- An identifier of the subject who carried out the experiment.
- Its activity label. 
- Average values for all 68 measurements for triaxial acceleration and gyroscope measures.

The dataset includes the following files:

- 'README.md'

- 'CodeBook.md': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_summary.txt': Average values for all means and standard deviations measured. 

- 'run_analysis.R': Script to convert raw data into summary.


# R Script Details
(1) Read & merges the training and the test sets to create one data set: Script uses rbind to combine subject and activity label vectors. Activity data are processed row by row to accomodate extra whitespaces and select only a subset of fields.

(2) Extracts only the measurements on the mean and standard deviation for each measurement: Script uses grep command on feature names to identify desired fields - those ending with mean() or std().

(3) Uses descriptive activity names to name the activities in the data set: Script replaces text for activities descriptions instead of numeric activity codes. 

(4) Appropriately labels the data set with descriptive variable names: Script uses feature names from the original data as column names.

(5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject: Script uses pipeline of group_by and summarize_each to find mean values for each variable over subject and activity


# Original Study Information:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
