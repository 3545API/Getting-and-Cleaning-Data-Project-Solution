codebook
========
- described the variables existing in “run_analysis.R”

- briefly summarized each variable’s structure and transformations performed to get the variables


## Information of source files used in "run_analysis.R”
========================================================
- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


## Information of features used in database
============================================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


## New variables in “run_analysis.R”
=====================================
activity
•	A data frame read from “activity_labels.txt”
•	2 variables, 6 observations
•	2 variables: activity_number, activity_name

variable
•	A character vector read from “features.txt”
•	561 components/features
o	1-40: tBodyAcc
o	41-80: tGravityAcc
o	81-120: tBodyAccJerk
o	121-160: tBodyGyro
o	161-200: tBodyGyroJerk
o	201-213: tBodyAccMag
o	214-226: tGravityAccMag
o	227-239: tBodyAccJerkMag
o	240-252: tBodyGyroMag
o	253-265: tBodyGyroJerkMag
o	266-344: fBodyAcc
o	345-423: fBodyAccJerk
o	424-502: fBodyGyro
o	503-515: fBodyAccMag
o	516-528: fBodyBodyAccJerkMag
o	529-541: fBodyBodyGyroMag
o	542-554: fBodyBodyGyroJerkMag
o	555-561: Angle

subject_train 
•	A data frame read from "subject_train.txt"
•	1 variable, 7352 observations
•	1 variable: subject, the volunteers who performed the activity

label_train
•	A data frame read from "y_train.txt"
•	1 variable, 7352 observations
•	1 variable: activity_number

data_set_train
•	A data frame read from "X_train.txt" and combined with subject_train and label_train
•	563 variables, 7352 observations
•	563 variables: activity_number + subject + 561 components/features

subject_test
•	A data frame read from " subject_test.txt"
•	1 variable, 2947 observations
•	1 variable: subject, the volunteers who performed the activity

label_test
•	A data frame read from "y_test.txt"
•	1 variable, 2947 observations
•	1 variable: activity_number

data_set_test
•	A data frame read from "X_test.txt" and combined with subject_test and label_test
•	563 variables, 2947 observations
•	563 variables: activity_number + subject + 561 components/features

data_set_1
•	A data frame contains training data set and test data set
•	563 variables, 10299 observations
•	563 variables: activity_number + subject + 561 components/features

colnames 
•	A character vector
•	563 components: activity_number + subject + 561 components/features

col_mean_std
•	An integer vector of column numbers where mean and standard deviation for each measurement were reported. 
•	66 components
o	33 for mean 
o	33 for standard deviation

data_set_2
•	A data frame, subset of data frame: data_set_1
•	68 variables, 10299 observations
•	68 variables: activity_number + subject + 33 for mean + 33 for standard deviation

activity_frequency
•	A ftable showing frequency of 6 activities in data_set_2
o	WALKING: 1722
o	WALKING_UPSTAIRS: 1544
o	WALKING_DOWNSTAIRS: 1406
o	SITTING: 1777
o	STANDING: 1906
o	LAYING: 1944

activity_description
•	A character vector containing activity names
o	Frequency of each activity equals the one of each activity in data_set_2
•	10299 components
o	WALKING: 1722
o	WALKING_UPSTAIRS: 1544
o	WALKING_DOWNSTAIRS: 1406
o	SITTING: 1777
o	STANDING: 1906
o	LAYING: 1944

data_set_3
•	A data frame, data_set_2 combined with activity_description
•	69 variables, 10299 observations
•	69 variables: activity_description + activity_number + subject + 33 for mean + 33 for standard deviation

data_set_4
•	A data frame, rearranged data frame of data_set_3 following the increasing order of activity_number and then subject
•	69 variables, 10299 observations
•	69 variables: activity_description + activity_number + subject + 33 for mean + 33 for standard deviation

variable_mean
•	A data frame, transferred from the data frame: data_set_4
o	grouped by activity_number and subject 
o	averaged out the other individual variable for each group
•	68 variables, 180 observations
•	68 variables: activity_number + subject + 33 for mean + 33 for standard deviation

activity_name 
•	A character vector containing activity names
o	Frequency of each activity equals the one of each activity in variable_mean
•	180 components
o	WALKING: 30
o	WALKING_UPSTAIRS: 30
o	WALKING_DOWNSTAIRS: 30
o	SITTING: 30
o	STANDING: 30
o	LAYING: 30

data_set_5
•	A data frame, combination of the data frame of variable_mean and the character vector of activity_name
•	69 variables, 180 observations
•	69 variables: activity_name + activity_number + subject + 33 for mean + 33 for standard deviation

