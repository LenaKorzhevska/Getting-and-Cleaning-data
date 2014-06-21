CodeBook - Experiment with accelerometers from the Samsung Galaxy S smartphone

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Variables:
subjectID - id if a person who took part in experiment, 1-30
activityID - id of activity person subject of experiment is doing, 1-6
activityLable - activity name, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
561 variables of measurement, description in files features_info.txt and variable names in features.txt

Manipulation with data:
1)The data are taken from abovementioned files in the following order:
  -3 files contain test information where concatenated together: 'test/subject_test.txt','test/X_test.txt','test/y_test.txt'.
  -the names of columns were added from 'features.txt' 
  -receive data.frame c_file_t
  -3 files contain train information where concatenated together: 'train/subject_train.txt','train/X_train.txt','train/y_train.txt'.
   -the names of columns were added from 'features.txt'
   -receive data.frame c_file_train
2) 2 datasets where binded together row-wise into all_data: 563 variables and 10299 rows
3) all_data where subseted to include only measurement columns with mean() and std() information of observations. Subseted dataset all_data_subs consists of 68 columns(variables) and 10299 rows
4)received dataset was joint with the names of activities and the final_data with 69 columns and 10299 rows was received
5)using melt and dcasr function the tidy summary dataset summary_df was created. it consist of average of each obervation for each subject and each activity 

