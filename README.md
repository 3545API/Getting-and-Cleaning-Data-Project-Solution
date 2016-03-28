==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

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

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


## Used read.table() to read each source file into assigned data frame.
#======================================================================

•	‘activity’ = activity_labels.txt, 2 variables, 6 observations.

•	‘variable’ = features.txt, 2 variables, 561 observations.
o	Then ‘variable’ was transferred from a data frame to a character vector (561 components).

•	‘subject_train’ = subject_train.txt, 1 variable, 7352 observations.

•	‘label_train’ = y_train.txt, 1 variable, 7352 observations.

•	‘data_set_train’ = X_train.txt, the character vector ‘variable’ was used as column names for the data frame ‘data_set_train’, 561 variables, 7352 observations.
o	Then used cbind() to combine three data frames ‘subject_train’, ‘label_train’, and ‘data_set_train’ into a new data frame ‘data_set_train’, 563 variables, 7352 observations.

•	‘subject_test’ = subject_test.txt, 1 variable, 2947 observations.

•	‘label_test’ = y_test.txt, 1 variable, 2947 observations.

•	‘data_set_test’ = X_test.txt, the character vector ‘variable’ was used as column names for the data frame ‘data_set_test’, 561 variables, 2947 observations.
o	Then used cbind() to combine three data frames ‘subject_test’, ‘label_test’, and ‘data_set_test’ into a new data frame ‘data_set_test’, 563 variables, 2947 observations.


## Task 1:  merges the training and the test sets to create one data set.
#========================================================================

•	Used rbind() to combine two data frames: ‘data_set_train’ and ‘data_set_test’ into a data frame ‘data_set_1’, 563 variables, 10299 observations.


## Task 2: extracts only the measurements on the mean and standard deviation for each measurement.
#=================================================================================================

•	Used colnames() to get column names of the data frame ‘data_set_1’ in a character vector ‘colnames’, 563 components.

•	Used grep() to extract "mean" and "std" from column names of the data frame ‘data_set_1’, and then report location/column numbers as an integer vector ‘col_mean_std’, 66 components.

•	Extracted the measurements on the mean and standard deviation for each measurement from the data frame ‘data_set_1’ to a data frame ‘data_set_2’, 68 variables, 10299 observations.


## Task 3: uses descriptive activity names to name the activities in the data set
#================================================================================

•	Used ftable() to find out frequency of 6 activities in the data frame ‘data_set_2’ as a ftable ‘activity_frequency’. 

•	Used rep(), seq(), nrow() and the ftable ‘activity_frequency’ to generate a data frame ‘activity_description’, 2 variables, 10299 observations, in which activity number counts and activity name counts match observation counts in the data frame ‘data_set_2’, and frequency of 6 activities in the data frame ‘activity_description’ matches the one of 6 activities in the data frame ‘data_set_2’.

•	Used arrange() in dplyr package to arrange the data frames ‘data_set_2’ and ‘activity_description’ following the increasing order of activity_number.

•	Transferred ‘activity_description’ from a data frame to a character vector, 10299 components.

•	Used cbind() to combine the character vector ‘activity_description’ and the data frame ‘data_set_2’ into a data frame ‘data_set_3’, 69 variables, 10299 observations.


## Task 4: appropriately labels the data set with descriptive variable names. 
#============================================================================

•	The task was performed when reading X_train.txt and X_test.txt into data frames ‘data_set_train’ and ‘data_set_test’. The character vector ‘variable’ was used as column names to describe each variable.

•	Used arrange() in dplyr package to arrange the data frame ‘data_set_3’ based on the increasing order of activity_number and then the increasing order of subject. And assigned the arranged data frame ‘data_set_3’ to data frame ‘ data_set_4’, 69 variables, 10299 observations.


## Task 5: from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#=======================================================================================================================================================

•	Used pipeline operator with select(), group_by(), and summarise_each(funs(mean)) in dplyr package to calculate average of each variable for the group of each activity and each subject in the data frame ‘data_set_4’. Result was assigned to a data frame ‘variable_mean’, 68 variables, 180 observations.

•	 Used for() and if() to assign activity name to each activity number in the data frame ‘variable_mean’ and stored in a character vector ‘activity_name’, 180 components.

•	Used cbind() to combine the character vector ‘activity_name’ and the data frame ‘variable_mean’ into a data frame ‘data_set_5’, 69 variables, 180 observations.

•	Use write.table() to write the data frame ‘data_set_5’ into tidy_data.txt.
