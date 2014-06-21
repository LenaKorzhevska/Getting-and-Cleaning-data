Getting-and-Cleaning-data
=========================

Coursera "Getting and Cleaning Data" course project

In the file CodeBook.md there are description of all variables, data and the steps of the data transformations.

In the file run_analysis.R there is R code for the manipulations with data. It works in the following way:
- The data are taken from test and train folders :
 -- 3 files contain test information where concatenated together:     'test/subject_test.txt','test/X_test.txt','test/y_test.txt'.
 -- the names of columns were added from 'features.txt'
 -- receive data.frame c_file_t
 -- 3 files contain train information where concatenated together: 'train/subject_train.txt','train/X_train.txt','train/y_train.txt'.
 -- the names of columns were added from 'features.txt'
 -- receive data.frame c_file_train
 - 2 datasets where binded together row-wise into all_data: 563 variables and 10299 rows
 - all_data where subseted to include only measurement columns with mean() and std() information of observations. Subseted dataset all_data_subs consists of 68 columns(variables) and 10299 rows
 - received dataset was joint with the names of activities and the final_data with 69 columns and 10299 rows was received
 - using melt and dcasr function the tidy summary dataset summary_df was created. it consist of average of each obervation fo r each subject and each activity
 - tidy dataset is saved in tidy_data.txt
 - 
In the file tidy_data.Rda and tidy_data.txt there is a tidy data set (just different formats, the same information inside).



Files with dataset:
- 'features_info.txt'
- 'features.txt'
- 'activity_labels.txt'
- 'X_train.txt'
- 'y_train.txt'
- 'X_test.txt'
- 'y_test.txt'
- 'subject_train.txt'
- 'subject_test.txt'
