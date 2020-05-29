---
title: "CodeBook"
author: "Harshit Kumar Soni, Ph.D."
date: "5/29/2020"
output: html_document
---


# Week4

## Peer-graded Assignment: Getting and Cleaning Data Course Project
# Data Set Introduction:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

## Details of Data

Data Set Characteristics: | Number of Instances: | Area:
--------------------------|----------------------|------
Multivariate, Time-Series |10299 | Computer 

Attribute Characteristics: | Number of Attributes: | Date Donated
---------------------------|-----------------------|-------------
N/A | 561 | 2012-12-10



Associated Tasks: | Missing Values?
------------------|----------------	
Classification, Clustering | N/A
	
## Operations Performed and details of codes


##    Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

## Assign each data to variables

**feat**: this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

**act**:This dataset contains the list of activities performed when the corresponding measurements were taken and its codes (labels)

**sub_test** :This database contains test data of 9/30 volunteer test subjects

**x_test**:This database contains recorded features test data

**y_test** : This database ontains test data of activities’code labels

**sub_train**: This database contains train data of 21/30 volunteer subjects

**x_train**: This database contains recorded features train data

**y_train** : This database contains train data of activities’code labels

##    Merges the training and the test sets to create one data set

**X** (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function

**Y** (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function

**Sub** (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function

**M_Data** (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

##    Extracts only the measurements on the mean and standard deviation for each measurement

**MeanSD** (10299 rows, 88 columns) is created by subsetting M_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

##    Uses descriptive activity names to name the activities in the data set

Entire numbers in code column of the **MeanSD** replaced with corresponding activity taken from second column of the activities variable

##    Appropriately labels the data set with descriptive variable names

1. code column in MeanSD renamed into activities

2. All Acc in column’s name replaced by Accelerometer

3. All Gyro in column’s name replaced by Gyroscope

4. All BodyBody in column’s name replaced by Body

5. All Mag in column’s name replaced by Magnitude

6. All start with character f in column’s name replaced by Frequency

7. All start with character t in column’s name replaced by Time

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

**Sec_Data** (180 rows, 88 columns) is created by sumarizing MeanSD taking the means of each variable for each activity and each subject, after groupped by subject and activity.

## Export FinalData 

final data is exported into **FinalData.txt** file.


### Relevant Papers:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz. Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care. Volume 19, Issue 9. May 2013

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223.

Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Català. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.