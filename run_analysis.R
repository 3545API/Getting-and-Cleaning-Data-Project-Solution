# run_analysis.R
# Goal: perform data analysis for Coursera getting and cleaning data project
#===========================================================================



# read source files into R
#=========================

## set working directory to project folder
setwd("/Users/jia/Desktop/Coursera/Getting and Cleaning Data/project/UCI HAR Dataset")
## read activity_labels.txt into df activity 
activity <- read.table("./activity_labels.txt", stringsAsFactors = FALSE, col.names = c("activity_number", "activity_name"))
## read features.txt, the list of 561 features, into df variable
variable <- read.table("./features.txt", stringsAsFactors = FALSE)
variable <- variable[,2]


## set working directory to the training sets
setwd("/Users/jia/Desktop/Coursera/Getting and Cleaning Data/project/UCI HAR Dataset/train")
## read the training sets
subject_train <- read.table("./subject_train.txt", col.names = "subject")
label_train <- read.table("./y_train.txt", col.names = "activity_number")
data_set_train <- read.table("./X_train.txt", col.names = variable)
## combine training label, subject and data into df data_set_train
data_set_train <- cbind(label_train, subject_train, data_set_train)


## set working directory to the test sets
setwd("/Users/jia/Desktop/Coursera/Getting and Cleaning Data/project/UCI HAR Dataset/test")
## read the test sets
subject_test <- read.table("./subject_test.txt", col.names = "subject")
label_test <- read.table("./y_test.txt", col.names = "activity_number")
data_set_test <- read.table("./X_test.txt", col.names = variable)
## combine test label, subject and data into df data_set_test
data_set_test <- cbind(label_test, subject_test, data_set_test)



# perform 5 tasks
#================

# task 1: merges the training and the test sets to create one data set.
data_set_1 <- rbind(data_set_train, data_set_test) 


# task 2: extracts only the measurements on the mean and standard deviation for each measurement.
## extract "mean" and "std" from variable names, and then report location/column numbers
colnames <- colnames(data_set_1)
col_mean_std <- grep("mean\\.|std", colnames)
## generate data_set_2 for task 2
data_set_2 <- data_set_1[ , c(1, 2, col_mean_std)]


# task 3: uses descriptive activity names to name the activities in the data set
## find out frequency of 6 activities in data_set_2
activity_frequency <- ftable(data_set_2[,1])
## generate a data frame of activity number and activity name matches dimension of data_set_2 and frequency of 6 activities in data_set_2
activity_description <- activity[rep(seq(nrow(activity)), activity_frequency),]
## arrange data_set_2 and activity_description based on activity_number
library(dplyr)
data_set_2 <- arrange(data_set_2, activity_number)
activity_description <- arrange(activity_description, activity_number)
activity_description <- activity_description[,2]
## generate data_set_3 for task 3
data_set_3 <- cbind(activity_description, data_set_2)


# task 4: appropriately labels the data set with descriptive variable names. # completed the task on lines 24 and 34
## arrange data_set_3 based on activity_number and subject
data_set_4 <- arrange(data_set_3, activity_number, subject)


# task 5: from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## for each activity and each subject, calculate average of each variable
variable_mean <- select(data_set_4, -1) %>% group_by(activity_number, subject) %>% summarise_each(funs(mean))
## assign activity name to each activity number in df variable_mean
activity_name <- vector(mode = "character", length = length(variable_mean$activity_number))
for (i in 1: length(activity$activity_number)) {
  for (j in 1: length(variable_mean$activity_number)) {
    if (variable_mean$activity_number[j] == activity$activity_number[i]) {
      activity_name[j] <- activity$activity_name[i]
    }
  }
}
## generate data_set_5 for task 5
data_set_5 <- cbind(activity_name, variable_mean)



## write data_set_5 into tidy_data.txt
#=====================================

setwd("/Users/jia/Desktop/Coursera/Getting and Cleaning Data/project/Getting and Cleaning Data Project Solution")
write.table(data_set_5, "./tidy_data.txt", row.names = FALSE, sep = ",")

