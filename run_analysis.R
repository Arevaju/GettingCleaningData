###Donwload and unzip the file with dataset
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="dataset.zip",method="auto")
unzip_data <- unzip("dataset.zip")
### Read and load training data
trainset <- read.table ("UCI HAR Dataset/train/X_train.txt") 
trainlab <- read.table ("UCI HAR Dataset/train/y_train.txt") 
trainsub <- read.table ("UCI HAR Dataset/train/subject_train.txt") 
### Read and load test data
testset <- read.table ("UCI HAR Dataset/test/X_test.txt") 
testlab <- read.table ("UCI HAR Dataset/test/y_test.txt")
testsub <- read.table ("UCI HAR Dataset/test/subject_test.txt")
##### Variables information with names
varlist <-  read.table ("UCI HAR Dataset/features.txt")
#### Activity labels
labelFilename <- file.path('UCI HAR Dataset', 'activity_labels.txt')
actlabels <- read.table(labelFilename)
#######Give the names to the variables in training and test datasets
names(trainset)= varlist[,2]  
names(testset)= varlist[,2]
###Join Data frame for training and rename Activity and Subject columns
train <- cbind (trainset,trainlab,trainsub)
colnames(train)[562]<-"ActivityCode"
colnames(train)[563]<-"Subject"
###Join Data frame for test rename Activity and Subject columns
test <- cbind (testset,testlab, testsub)
colnames(test)[562]<-"ActivityCode"
colnames(test)[563]<-"Subject"
###Merges the training and the test sets to create one data set.
total<- rbind(train,test)
###Extracts only the measurements on the mean and standard deviation for each measurement
columns <- grep("std()|mean\\()|Activity|Subject",names(total),value=TRUE)
##Creates a dataframe with the selected columns
measures <- subset(total, select = columns)
###Assign labels to the data set with descriptive activity names and give a column name
measureslab <- data.frame(measures, factor(measures$ActivityCode, labels =  actlabels$V2))
colnames(measureslab)[69]<-"ActivityDescription"
##Creates tidy data set with the average of each variable for each activity and each subject. 
tidydata <- ddply(measureslab, .(ActivityCode, ActivityDescription, Subject), numcolwise(mean))
## Write the final tidy dataset
write.table(tidydata, file = "./tidydata.txt", sep="\t")