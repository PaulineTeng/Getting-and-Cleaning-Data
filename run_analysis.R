run_analysis <- function() {
  library(data.table)
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, dest="data.zip", mode="wb") 
  unzip ("data.zip")
  
  data1 <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"),read.table("UCI HAR Dataset/test/subject_test.txt"))
  names(data1) <- "subject"
  
  data2 <- rbind(read.table("UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=FALSE),read.table("UCI HAR Dataset/test/Y_test.txt",stringsAsFactors=FALSE))
  activity <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
  data2 <- merge(data2, activity, by.x="V1", by.y="V1", all.x=TRUE)
  names(data2) <- c("activity","activity.desc")
  
  data3 <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"),read.table("UCI HAR Dataset/test/X_test.txt"))
  feature <- read.table("UCI HAR Dataset/features.txt")
  name <- as.vector(feature$V2)
  name <- gsub(",",".",name,fixed=TRUE)
  name <- gsub("()","",name,fixed=TRUE)
  name <- gsub("(",".",name,fixed=TRUE)
  name <- gsub(")","",name,fixed=TRUE)
  name <- gsub("-",".",name,fixed=TRUE)
  name <- gsub("mean","Mean",name,fixed=TRUE)
  name <- gsub("std","Std",name,fixed=TRUE)
  names(data3) <- name
  
  data <- data.table(subject=data1$subject, activity=data2$activity.desc, data3[,grep("Mean|Std", name)])
  output <- data[, lapply(.SD,mean), by=list(subject,activity)]
  
  write.table(output, file="Run Analysis Result.txt",row.name=FALSE,col.names = TRUE)
}