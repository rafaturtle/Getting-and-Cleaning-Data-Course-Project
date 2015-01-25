# Getting and Cleaning Data Course Project

## run_analysis Script description

The script loads all the relevant data and merges bit by bit in order to get a final complete picture of the data.

Once the whole data is merged, it is then melted and aggregated to calculate the means of all variables.

Step 1 - Merge training and test data to create 1 dataset
Step 2 - Extract only the measurements on the mean and standard deviation for each measurement
Step 3 - Uses descriptive activity names to name the activities in the data set
Step 4 - Appropriately labels the data set with descriptive variable names
Step 5 - From the data step in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject


### load the data into datasets
        The script follows the steps:
        
        load activity Labels
        load test data
        rename columns by using a created function that loops through the columns renaming them
        filter out undesired columns using SELECT
        load subject data and using cbind merge with the test data
        
        load activity data        
        bind activity data
        
        merge activity labels
        
        
        load train data
        rename columns
        filter out undesired columns
        bind subject data with train data
        load train activity
        merge activity labels
        
        melt the data by the Activity_Label and Subject ids, and all means and std as mearures.
        
        generate result data set using acast