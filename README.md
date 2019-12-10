# JHUCourseraGettingAndCleaningData
## Johns Hopkins on Coursera - Getting and Cleaning Data Course, Final Project

### Purpose
The following are excerpts from the project definition:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### R Code
The R code in this project, run_analysis.R, is a function with no inputs that will output a specific tidy dataset as a text file. Here are the steps the code performs:
1. This code will download and extract the data from University of California Irvine Department of Information and Computer Science. ( full files available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
2. It will read the necessary files into R. This includes the test (x_, y_ and subject) and train (x_, y_, and subject) data sets, as well as the features nad activity_labels. The Inertial Signals are not required for this analysis.
3. The dataset columns are then named. This is done first, so that any moving, changing, reordering will not affect the column names.
4. STEP 1 of project requirements: The individual datasets are then combined into a single set ("combined")
5. STEP 2 of project requirements: Only the mean and standard deviation columns are extracted from the dataset. (meanFreq is left out as that is not part of the required data.) The Activity and Subject columns are also included.
6. STEP 3 of project requirements: the "Activity" column is given appropriate names, based on the activity_labels txt file. (This includes values such as "WALKING", "SITTING", "STANDING", etc.)
7. STEP 4 of project requirements: step 4 asks to appropriately label the dataset with descriptive variable names. As listed above in #3, the columns were already named ahead of time.
8. STEP 5 of project requirements: Extract a tidy data set with the average of each variable for each activity and each subject. This is written to a text file with row.name = FALSE, as requested by the project.

### Codebook
For questions on the variable names, please refer to the codebook.
