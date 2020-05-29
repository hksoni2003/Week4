# You should create one R script called run_analysis.R that does the following.
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and 
#standard deviation for each measurement.
# 3Uses descriptive activity names to name the activities in the data set
# 4Appropriately labels the data set with descriptive variable names.
# 5From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity 
#and each subject.


## forplay
# Loading dplyr
library(dplyr)
# Download dataset
filename <- "Week4.zip"
# Checking if archieve already exists.
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("Week4")) { 
        unzip(filename) 
}

# Assignment
feat <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
act <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feat$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feat$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Mainplay
# 1.Merges the training and the test sets to create one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Sub <- rbind(sub_train, sub_test)
M_Data <- cbind(Sub, Y, X)

# 2.Extracts only the measurements on the mean and sd for each measurement.
MeanSD <- M_Data %>% select(subject, code, contains("mean"), contains("std"))

# 3Uses descriptive activity names to name the activities in the data set
MeanSD$code <- act[MeanSD$code, 2]

# 4Appropriately labels the data set with descriptive variable names.

names(MeanSD)[2] = "activity"
names(MeanSD)<-gsub("Acc", "Accelerometer", names(MeanSD))
names(MeanSD)<-gsub("Gyro", "Gyroscope", names(MeanSD))
names(MeanSD)<-gsub("BodyBody", "Body", names(MeanSD))
names(MeanSD)<-gsub("Mag", "Magnitude", names(MeanSD))
names(MeanSD)<-gsub("^t", "Time", names(MeanSD))
names(MeanSD)<-gsub("^f", "Frequency", names(MeanSD))
names(MeanSD)<-gsub("tBody", "TimeBody", names(MeanSD))
names(MeanSD)<-gsub("-mean()", "Mean", names(MeanSD), ignore.case = TRUE)
names(MeanSD)<-gsub("-std()", "STD", names(MeanSD), ignore.case = TRUE)
names(MeanSD)<-gsub("-freq()", "Frequency", names(MeanSD), ignore.case = TRUE)
names(MeanSD)<-gsub("angle", "Angle", names(MeanSD))
names(MeanSD)<-gsub("gravity", "Gravity", names(MeanSD))

## 5From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity 
#and each subject.

Sec_Data <- MeanSD %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))
write.table(Sec_Data, "FinalData.txt", row.name=FALSE)

