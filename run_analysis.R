


#Step 1 - Merge training and test data to create 1 dataset
#Step 2 - Extract only the measurements on the mean and standard deviation for each measurement
#Step 3 - Uses descriptive activity names to name the activities in the data set
#Step 4 - Appropriately labels the data set with descriptive variable names
#Step 5 - From the data step in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject


# load the data into datasets

loadAndCleanData <- function(){
        
        #load activity Labels
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
        names(activity_labels)[1] <- "Activity_ID"
        names(activity_labels)[2] <- "Activity_Label"
        
        #load test data
        x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        #rename columns
        x_test <- renameColumns(x_test)
        #filter out undesired columns
        x_test <- select(x_test,-starts_with("V"))
        #load subject data
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
        names(subject_test)[1] <- "Subject"
        #bind the test data with subject data
        x_test <- cbind(x_test,subject_test)
        #load activity data
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        names(y_test)[1] <- "Activity_ID"
        #bind activity data
        x_test <- cbind(y_test,x_test)
        
        #merge activity labels
        x_test <- merge(x_test,activity_labels,sort = FALSE)
        
        #load train data
        x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
        #rename columns
        x_train <- renameColumns(x_train)
        #filter out undesired columns
        x_train <- select(x_train,-starts_with("V"))
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        names(subject_train)[1] <- "Subject"
        # bind subject data with train data
        x_train <- cbind(x_train,subject_train)
        #load train activity
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
        names(y_train)[1] <- "Activity_ID"
        x_train <- cbind(y_train,x_train)
        #merge activity labels
        x_train <- merge(x_train,activity_labels,sort = FALSE)

        x_test$type <- factor("Test")
        x_train$type <- factor("Train")
        x_merged <- rbind(x_train,x_test)
        
        x_melted <- melt(x_merged,id=c("Activity_Label","Subject"),measure.vars = names(x_merged)[2:80])
        
        result <- acast(x_melted, Activity_Label + Subject ~ variable,mean)
        
        result
}

renameColumns <- function(df){

        featureNames <- read.table("UCI HAR Dataset/features.txt")
        
        #loop through column names
        for(i in 1:nrow(featureNames)) {
                
                colName <- as.character(featureNames[i,2]);
                
                #Only change columns for mean and std
                if ((grepl("std",colName) | grepl("mean",colName))){
                        colName <- gsub("\\(\\)",".",colName)
                        colName <- gsub("-",".",colName)
                        
                        names(df)[i] <- colName       
                        
                }
                }
        
        df
}



