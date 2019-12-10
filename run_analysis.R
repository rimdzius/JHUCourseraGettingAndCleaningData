run_analysis <- function () {

## This program is the course project for Johns Hopkins "Getting and Cleaning Data" course on Coursera.
## This function will obtain, clean and tidy the data obtained from 30 subjects using Samsung Galaxy S smart phones.
## There are 5 steps, listed below, on which this data will be cleaned and tidied.

#######################################################################
## READ IN DATA

    ## packages required to run this code:
    require(dplyr)
    
    ## Check if zip file exists in project folder. If not, download it.
    if(!file.exists("data.zip")) {
        courseDataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        destFile <- "data.zip"
        download.file(courseDataURL, destFile)
    }
    
    ## Unzip data file in project folder, if not there already.
    if(!file.exists("UCI HAR Dataset")) {
        unzip(destFile)
    }
    
    ## Read the raw data
    X_test <- read.table("UCI HAR Dataset\\test\\X_test.txt", stringsAsFactors = FALSE)
    y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt", stringsAsFactors = FALSE)
    subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
    X_train <- read.table("UCI HAR Dataset\\train\\X_train.txt", stringsAsFactors = FALSE)
    y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt", stringsAsFactors = FALSE)
    subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
    features <- read.table("UCI HAR Dataset\\features.txt", stringsAsFactors = FALSE)
    activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt", stringsAsFactors = FALSE)


#######################################################################
## ASSIGNMENT STEPS


    #######################################################################
    ## STEP 1: Merges the training and the test sets to create one data set.
        ## Rename columns per features file. Thsi is actually part of STEP 4.
        colnames(X_test) <- features[,2]
        colnames(X_train) <- features[,2]
        colnames(subject_test) <- "Subject"
        colnames(subject_train) <- "Subject"
        colnames(y_test) <- "Activity"
        colnames(y_train) <- "Activity"
        
        ## Combine the test data with the subject and activities, and the training set as well
        test_combined <- cbind(subject_test, y_test, X_test)
        train_combined <- cbind(subject_train, y_train, X_train)
          
        ## Merge the two sets
        combined <- rbind(test_combined, train_combined)
    
    
    #######################################################################
    ## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.
        ## extractsonly the "Subject", "Activity", "mean()" and "std()" columns. Excludes the "meanFreq() columns.
        extracted <- cbind(Subject=as.factor(combined$Subject),
                           Activity=combined$Activity,
                           combined[, (grepl("std()",colnames(combined)) | 
                                         grepl("mean()",colnames(combined))) & 
                                          !(grepl("meanFreq()",colnames(combined)))])
    
    
    #######################################################################
    ## STEP 3: Uses descriptive activity names to name the activities in the data set
        for(i in 1:length(activity_labels[,1])) {
          extracted$Activity <- sub(activity_labels[[1]][i], activity_labels[[2]][i], extracted$Activity)
        }
        extracted$Activity <- as.factor(extracted$Activity)
    
    
    #######################################################################
    ## STEP 4: Appropriately labels the data set with descriptive variable names.
        ## See the colname() functions in STEP 1.
        ## The naming was completed first so that any changes to the data, column ordering, etc. during processing did not affect the names.
        ## The labels from the dataset are descriptive, and can be understood once you read the codebook.
        
    
    #######################################################################
    ## STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        tidy_data <- extracted %>%
                  group_by(Activity, Subject) %>%
                  summarize_all(funs(mean))
        write.table(tidy_data, file="tidy_data.txt", row.name = FALSE)
    
    

}