#set working directory
#workingFolder <- 'C:/Users/dvarma/Google Drive/Study/Data Science - Johns Hopkins/3-Getting and Cleaning Data/Project/UCI HAR Dataset'
#setwd(workingFolder)

#read in column names
features <- read.table(file='features.txt')
features <- features$V2

#read in training data
train <- read.table(file='./train/X_train.txt')
colnames(train) <- features
train$subject <- as.numeric(unlist(read.table(file='train/subject_train.txt')))
train$activity <- as.numeric(unlist(read.table(file='train/y_train.txt')))

#read in test data
test <- read.table(file='./test/X_test.txt')
colnames(test) <- features
test$subject <- as.numeric(unlist(read.table(file='test/subject_test.txt')))
test$activity <- as.numeric(unlist(read.table(file='test/y_test.txt')))

#combine them
combined <- rbind(test,train)

#the columns we were intersted in
columnsOfConcern <- c('tBodyAcc-mean()-X',
'tBodyAcc-mean()-Y',
'tBodyAcc-mean()-Z',
'tBodyAcc-std()-X',
'tBodyAcc-std()-Y',
'tBodyAcc-std()-Z',
'tGravityAcc-mean()-X',
'tGravityAcc-mean()-Y',
'tGravityAcc-mean()-Z',
'tGravityAcc-std()-X',
'tGravityAcc-std()-Y',
'tGravityAcc-std()-Z',
'tBodyAccJerk-mean()-X',
'tBodyAccJerk-mean()-Y',
'tBodyAccJerk-mean()-Z',
'tBodyAccJerk-std()-X',
'tBodyAccJerk-std()-Y',
'tBodyAccJerk-std()-Z',
'tBodyGyro-mean()-X',
'tBodyGyro-mean()-Y',
'tBodyGyro-mean()-Z',
'tBodyGyro-std()-X',
'tBodyGyro-std()-Y',
'tBodyGyro-std()-Z',
'tBodyGyroJerk-mean()-X',
'tBodyGyroJerk-mean()-Y',
'tBodyGyroJerk-mean()-Z',
'tBodyGyroJerk-std()-X',
'tBodyGyroJerk-std()-Y',
'tBodyGyroJerk-std()-Z',
'tBodyAccMag-mean()',
'tBodyAccMag-std()',
'tGravityAccMag-mean()',
'tGravityAccMag-std()',
'tBodyAccJerkMag-mean()',
'tBodyAccJerkMag-std()',
'tBodyGyroMag-mean()',
'tBodyGyroMag-std()',
'tBodyGyroJerkMag-mean()',
'tBodyGyroJerkMag-std()',
'fBodyAcc-mean()-X',
'fBodyAcc-mean()-Y',
'fBodyAcc-mean()-Z',
'fBodyAcc-std()-X',
'fBodyAcc-std()-Y',
'fBodyAcc-std()-Z',
'fBodyAccJerk-mean()-X',
'fBodyAccJerk-mean()-Y',
'fBodyAccJerk-mean()-Z',
'fBodyAccJerk-std()-X',
'fBodyAccJerk-std()-Y',
'fBodyGyro-mean()-X',
'fBodyGyro-mean()-Y',
'fBodyGyro-mean()-Z',
'fBodyGyro-std()-X',
'fBodyGyro-std()-Y',
'fBodyGyro-std()-Z',
'fBodyAccMag-mean()',
'fBodyAccMag-std()',
'fBodyBodyAccJerkMag-mean()',
'fBodyBodyAccJerkMag-std()',
'fBodyBodyGyroMag-mean()',
'fBodyBodyGyroMag-std()',
'fBodyBodyGyroJerkMag-mean()',
'fBodyBodyGyroJerkMag-std()',
'subject',
'activity')

#throw everything else out
combined <- combined[,columnsOfConcern]

#appropriately name activities
activities <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')
names(activities) <- 1:6
combined$activity <- activities[combined$activity]

#create a tidy data set with the means
library(plyr)
summaryDataSet <- ddply(combined,c('subject','activity'),numcolwise(mean))

#save the tidy data set
write.table(summaryDataSet,file = 'tidyData.txt',row.names = FALSE)

