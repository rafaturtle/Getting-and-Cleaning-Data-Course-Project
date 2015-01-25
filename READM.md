
# Getting and Cleaning Data Course Project

## run_analysis Script description

This repo contains the run_analysis.R script file that goes through the data prepare and transform it in order to achieve an average of all
means and standard deviations by Subject by Activity.


The script loads all the relevant data and merges bit by bit in order to get a final complete picture of the data.

Once the whole data is merged, it is then melted and aggregated to calculate the means of all variables.

Step 1 - Merge training and test data to create 1 dataset
Step 2 - Extract only the measurements on the mean and standard deviation for each measurement
Step 3 - Uses descriptive activity names to name the activities in the data set
Step 4 - Appropriately labels the data set with descriptive variable names
Step 5 - From the data step in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject


