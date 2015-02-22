## Assume the "UCI HAR Dataset" folder is in the working directory

## Loads in data files
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
testlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
training <- read.table("./UCI HAR Dataset/train/X_train.txt")
traininglabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainingsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Merges data files by row
mergedata <- rbind(test, training)
mergelabels <- rbind(testlabels, traininglabels)
mergesubject <- rbind(testsubject, trainingsubject)

## Selects only measurements of mean and std
MeanStd <- grep("mean\\(\\)|std\\(\\)", features[,2])
mergedata <- mergedata[,MeanStd]
names(mergedata) <- features[MeanStd, 2]

## Reformat activity names
activity[, 2] <- gsub("_", " ", activity[, 2])
activity[, 2] <- tolower(activity[,2])
activitylabel <- activity[mergelabels[, 1], 2]
mergelabels[, 1] <- activitylabel
names(mergelabels) <- "activity"

## label dataset with features variable names
names(mergesubject) <- "subject"
data <- cbind(mergesubject, mergelabels, mergedata)

## clean up variable names
names(data)[3:68] <- gsub("\\(\\)", "", names(data[3:68]))
names(data)[3:68] <- gsub("-", " ", names(data[3:68]))
names(data)[3:68] <- gsub("mean", "Mean", names(data[3:68]))
names(data)[3:68] <- gsub("std", "Standard Deviation", names(data[3:68]))
names(data)[3:68] <- gsub("tBodyAcc", "Body Acceleration", names(data[3:68]))
names(data)[3:68] <- gsub("tGravityAcc", "Gravity Acceleration", names(data[3:68]))
names(data)[3:68] <- gsub("tBodyGyro", "Body Gyro", names(data[3:68]))
names(data)[3:68] <- gsub("tBodyGyro", "Body Gyro Jerk", names(data[3:68]))
names(data)[3:68] <- gsub("AccelerationMag", "Acceleration Magnitude", names(data[3:68]))
names(data)[3:68] <- gsub("AccelerationJerkMag", "Acceleration Jerk Magnitude", names(data[3:68]))
names(data)[3:68] <- gsub("GyroMag", "Gyro Magnitude", names(data[3:68]))
names(data)[3:68] <- gsub("GyroJerkMag", "Gyro Jerk Magnitude", names(data[3:68]))
names(data)[3:68] <- gsub("fBodyAcc", "FFT Body Acceleration", names(data[3:68]))
names(data)[3:68] <- gsub("fBodyAccJerk", "FFT Body Acceleration Jerk", names(data[3:68]))
names(data)[3:68] <- gsub("fBodyGyro", "FFT Body Gyro", names(data[3:68]))
names(data)[3:68] <- gsub("fBodyBodyAccJerkMag", "FFT Body Body Acceleration Jerk Magnitude", names(data[3:68]))
names(data)[3:68] <- gsub("fBodyBodyGyro", "FFT Body Body Gyro", names(data[3:68]))

write.table(data, "tidy_data.txt", row.name = FALSE)


## Second data set with only averages
names(data)
## Proper means columns selected by visual inspection from old tidy data set
newdata <- data[,c(1,2,33:42,61:68)]

write.table(newdata, "tidy_data_means.txt", row.name = FALSE)
