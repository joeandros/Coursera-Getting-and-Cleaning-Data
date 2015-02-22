The raw data that this script utilizes can be downloaded from the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip this folder, and then make sure that the resultant "UCI HAR Dataset" folder is present in the working directory. The 'run_analysis.R' file can then be run, which cleans up the data and saves two .txt files to the working directory: "tidy_data.txt" and "tidy_data_means.txt".

The "run_analysis.R" file works as follows:
1. All of the raw data files are read in using the read.table() command
2. The test and train datasets are joined using the rbind() command
3. Only the mean and standard deviation measurements are extracted from the raw data
4. The activity names are more cleanly reformatted
5. The variable names are cleaned up using the gsub() command
6. The resultant tidy data set is written to a .txt file, and then only the average of each variable is selected from the first tidy data set, producing "tidy_data_means.txt"