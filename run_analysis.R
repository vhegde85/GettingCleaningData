#Load Libraries 
library(dplyr)
library(reshape2)

## Download, unzip if not available ###########
fname <- "data.zip"
#Download
if (!file.exists(fname)){
fURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fURL, fname)
}  
# Unzip
if (!file.exists("UCI HAR Dataset")) { 
unzip(fname) 
}

###### Load all datasets############
# Load train data
setwd("C:/Users/61310358/Documents/GettingCleaningData/Project/data")
trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/y_train.txt")
trainSub <- read.table("train/subject_train.txt")
# Load test data
testX <- read.table("test/X_test.txt")
testY <- read.table("test/y_test.txt")
testSub <- read.table("test/subject_test.txt")
# Load features dataset
ft <- read.table("features.txt")
# Load activity labels dataset
aLab <- read.table("activity_labels.txt")

#### Join operations ########### 
joinX <- rbind(trainX,testX)
joinY <- rbind(trainY,testY)
joinSub <- rbind(trainSub,testSub)

###### Tidy operations #########
# Column name transformations 
names(aLab) = c("activityId","activityName")
names(joinX) = ft[[2]]
names(joinY) = c("activityId")
names(joinSub) = c("sub")

# Extract mean, sd; Merge, factorize and deduplicate
sd <- grep("std",ft[[2]])
mean <- grep("mean",ft[[2]])
meanSd <- unique(c(sd, mean))
subJoinX <- joinX[meanSd] # Subset joined data for mean and sd

# Replace column Ids 
act <- merge(aLab,joinY,"activityId")
subJoinX$act <- act[[2]]
subJoinX$sub <- joinSub[[1]]
str(subJoinX)

# Improve readbility
names(subJoinX) <- gsub("\\(\\)","",names(subJoinX))
names(subJoinX) <- gsub("-","",names(subJoinX))

# Create the second output file needed
tidy1 <- subJoinX
tidy2 <- aggregate(subJoinX, by=list(act = subJoinX$act, sub=subJoinX$sub), mean)

# write outputs
write.table(tidy1, "tidy_data_1.txt")
write.table(tidy2, "tidy_data_2.txt")