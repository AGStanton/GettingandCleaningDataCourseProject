library(dplyr)

# read in all text data files
test <- read.table("./test/X_test.txt")
train <- read.table("./train/X_train.txt")
testActivity <- read.table("./test/y_test.txt")[,1]
trainActivity <- read.table("./train/y_train.txt")[,1]
testSubjectID <- read.table("./test/subject_test.txt")[,1]
trainSubjectID <- read.table("./train/subject_train.txt")[,1]

# replace activity numbers with descriptions
for (i in 1:length(testActivity)) {
        if (testActivity[i] == 1) {
                testActivity[i] <- "WALKING"
        } else if (testActivity[i] == 2) {
                testActivity[i] <- "WALKING_UPSTAIRS"
        } else if (testActivity[i] == 3) {
                testActivity[i] <- "WALKING_DOWNSTAIRS"
        } else if (testActivity[i] == 4) {
                testActivity[i] <- "SITTING"
        } else if (testActivity[i] == 5) {
                testActivity[i] <- "STANDING"
        } else if (testActivity[i] == 6) {
                testActivity[i] <- "LAYING"
        }
}

for (i in 1:length(trainActivity)) {
        if (trainActivity[i] == 1) {
                trainActivity[i] <- "WALKING"
        } else if (trainActivity[i] == 2) {
                trainActivity[i] <- "WALKING_UPSTAIRS"
        } else if (trainActivity[i] == 3) {
                trainActivity[i] <- "WALKING_DOWNSTAIRS"
        } else if (trainActivity[i] == 4) {
                trainActivity[i] <- "SITTING"
        } else if (trainActivity[i] == 5) {
                trainActivity[i] <- "STANDING"
        } else if (trainActivity[i] == 6) {
                trainActivity[i] <- "LAYING"
        }
}

# read in variable names as vector
features <- read.table("./features.txt")
features <- features[,2]

# set the column names 
colnames(test) <- features
colnames(train) <- features

# bind columns to test and train tables for data set origin, type of activity, and subject ID
test$activityType <- testActivity
train$activityType <- trainActivity
test$subjectID <- testSubjectID
train$subjectID <- trainSubjectID

# merge the test and train tables into one narrow table
merged <- rbind(test, train)

# specify just the columns having to do with mean or standard deviation
meanAndStdColumns <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z",
                 "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z",
                 "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z",
                 "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z",
                 "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", 
                 "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", 
                 "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z",                  
                 "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z",
                 "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z",               
                 "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z",
                 "tBodyAccMag-mean()", "tBodyAccMag-std()",
                 "tGravityAccMag-mean()", "tGravityAccMag-std()",
                 "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()",
                 "tBodyGyroMag-mean()", "tBodyGyroMag-std()",
                 "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()",
                 "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", 
                 "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z",
                 "fBodyAcc-meanFreq()-X", "fBodyAcc-meanFreq()-Y", "fBodyAcc-meanFreq()-Z",
                 "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z",                
                 "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z",
                 "fBodyAccJerk-meanFreq()-X", "fBodyAccJerk-meanFreq()-Y", "fBodyAccJerk-meanFreq()-Z",
                 "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z",                  
                 "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z",
                 "fBodyGyro-meanFreq()-X", "fBodyGyro-meanFreq()-Y", "fBodyGyro-meanFreq()-Z",
                 "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyAccMag-meanFreq()",
                 "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyAccJerkMag-meanFreq()",
                 "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroMag-meanFreq()",
                 "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()", "fBodyBodyGyroJerkMag-meanFreq()",
                 "angle(tBodyAccMean,gravity)", "angle(tBodyAccJerkMean),gravityMean)", "angle(tBodyGyroMean,gravityMean)",     
                 "angle(tBodyGyroJerkMean,gravityMean)", "angle(X,gravityMean)", "angle(Y,gravityMean)", 
                 "angle(Z,gravityMean)")

otherColumns <- c("activityType", "subjectID")
keepColumns <- c(meanAndStdColumns, otherColumns)

newMerged <- merged[, keepColumns]

# change column names to something more readable
newColNames <- c("tBodyAccMeanX", "tBodyAccMeanY", "tBodyAccMeanZ",
                       "tBodyAccStdX", "tBodyAccStdY", "tBodyAccStdZ",
                       "tGravityAccMeanX", "tGravityAccMeanY", "tGravityAccMeanZ",
                       "tGravityAccStdX", "tGravityAccStdY", "tGravityAccStdZ",
                       "tBodyAccJerkMeanX", "tBodyAccJerkMeanY", "tBodyAccJerkMeanZ", 
                       "tBodyAccJerkStdX", "tBodyAccJerkStdY", "tBodyAccJerkStdZ", 
                       "tBodyGyroMeanX", "tBodyGyroMeanY", "tBodyGyroMeanZ",                  
                       "tBodyGyroStdX", "tBodyGyroStdY", "tBodyGyroStdZ",
                       "tBodyGyroJerkMeanX", "tBodyGyroJerkMeanY", "tBodyGyroJerkMeanZ",               
                       "tBodyGyroJerkStdX", "tBodyGyroJerkStdY", "tBodyGyroJerkStdZ",
                       "tBodyAccMagMean", "tBodyAccMagStd",
                       "tGravityAccMagMean", "tGravityAccMagStd",
                       "tBodyAccJerkMagMean", "tBodyAccJerkMagStd",
                       "tBodyGyroMagMean", "tBodyGyroMagStd",
                       "tBodyGyroJerkMagMean", "tBodyGyroJerkMagStd",
                       "fBodyAccMeanX", "fBodyAccMeanY", "fBodyAccMeanZ", 
                       "fBodyAccStdX", "fBodyAccStdY", "fBodyAccStdZ",
                       "fBodyAccMeanFreqX", "fBodyAccMeanFreqY", "fBodyAccMeanFreqZ",
                       "fBodyAccJerkMeanX", "fBodyAccJerkMeanY", "fBodyAccJerkMeanZ",                
                       "fBodyAccJerkStdX", "fBodyAccJerkStdY", "fBodyAccJerkStdZ",
                       "fBodyAccJerkMeanFreqX", "fBodyAccJerkMeanFreqY", "fBodyAccJerkMeanFreqZ",
                       "fBodyGyroMeanX", "fBodyGyroMeanY", "fBodyGyroMeanZ",                  
                       "fBodyGyroStdX", "fBodyGyroStdY", "fBodyGyroStdZ",
                       "fBodyGyroMeanFreqX", "fBodyGyroMeanFreqY", "fBodyGyroMeanFreqZ",
                       "fBodyAccMagMean", "fBodyAccMagStd", "fBodyAccMagMeanFreq",
                       "fBodyBodyAccJerkMagMean", "fBodyBodyAccJerkMagStd", "fBodyBodyAccJerkMagMeanFreq",
                       "fBodyBodyGyroMagMean", "fBodyBodyGyroMagStd", "fBodyBodyGyroMagMeanFreq",
                       "fBodyBodyGyroJerkMagMean", "fBodyBodyGyroJerkMagStd", "fBodyBodyGyroJerkMagMeanFreq",
                       "angle(tBodyAccMean,gravity)", "angle(tBodyAccJerkMean),gravityMean)", "angle(tBodyGyroMean,gravityMean)",     
                       "angle(tBodyGyroJerkMean,gravityMean)", "angle(X,gravityMean)", "angle(Y,gravityMean)", 
                       "angle(Z,gravityMean)",
                       "activityType", "subjectID")

colnames(newMerged) <- newColNames

# I need to group by subject and activity and take mean of variables

# convert to dplyr table, group the data by both activity and subject (i.e. subject #1 walking)
tblMerged <- tbl_df(newMerged)
grouped <- group_by(tblMerged, activityType, subjectID)

# get the mean of each variable
group_summarized <- summarise_each(grouped, funs(mean))

group_summarized

