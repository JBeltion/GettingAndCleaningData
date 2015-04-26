
# Prepare data the Features and Activities to be used in Tidy file
setwd("C:\\__R-DIRECTORY\\__DataScience3\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset")
#All variable names
features <- read.table("features.txt", header = FALSE, sep = "")
#Just the variables for Tidy data
stddev <- features[grepl("std",tolower(features$V2)),]
mean <- features[grepl("mean",tolower(features$V2)),]
extractCols <- rbind(stddev, mean)

activity_labels <- read.table("C:\\__R-DIRECTORY\\__DataScience3\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt")[,2]

#Prepare complete data frame for Test Data
setwd("C:\\__R-DIRECTORY\\__DataScience3\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test")
testDF = read.table("X_test.txt", header = FALSE, sep = "")
colnames(testDF) <- features$V2
testSubject <- read.table("subject_test.txt", header = FALSE, sep = "")
testDF["subject"] <- NA
testDF$subject <- testSubject$V1
testPos <- read.table("y_test.txt", header = FALSE, sep = "")
testDF["position"] <- NA
testDF$position <- testPos$V1

#Prepare complete data frame for Train Data
setwd("C:\\__R-DIRECTORY\\__DataScience3\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train")
trainDF = read.table("X_train.txt", header = FALSE, sep = "")
colnames(trainDF) <- features$V2
trainSubject <- read.table("subject_train.txt", header = FALSE, sep = "")
trainDF["subject"] <- NA
trainDF$subject <- trainSubject$V1
trainPos <- read.table("y_train.txt", header = FALSE, sep = "")
trainDF["position"] <- NA
trainDF$position <- trainPos$V1


# Merge the training and test data sets
mergedDF <- rbind(trainDF, testDF)

#Create DataFrame for position and subject columns to merge with the STD and MEAN columns - Part of creating Tidy Data set
V1 <- c(1, 2)
V2 <- c("position", "subject")
newcols <- data.frame(V1, V2)

#Merge all columns needed just for the Tidy Data set
extractCols3 <- rbind(extractCols,newcols)

#Extract only the required columns for Tidy Data set: STDDEV and MEAN columns
Tidy1 <- mergedDF[,extractCols3$V2]

