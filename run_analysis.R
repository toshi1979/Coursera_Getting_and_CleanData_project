# --- download data from web
zFileDir <-"./zfile"
zFileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zFileName <- "file.zip"
zFilePath <- paste0(zFileDir,"/",zFileName)
dataDir <- "./data"

# skip download if it already exists
if (!file.exists(zFileDir)) {
  message("downloading zip file...")
  dir.create(zFileDir)
  download.file(url = zFileUrl, destfile = zFilePath)
}

# skip unzip if it already exist
if (!file.exists(dataDir)) {
  message("uncompressing zip file...")
  dir.create(dataDir)
  unzip(zipfile = zFilePath, exdir = dataDir)
  message("done..")
}
# --- load relevant data set

# read train data set
message("loading training data...")
x_train <- read.table(paste0(dataDir, "/UCI HAR Dataset/train/X_train.txt"))
y_train <- read.table(paste0(dataDir, "/UCI HAR Dataset/train/Y_train.txt"))
s_train <- read.table(paste0(dataDir, "/UCI HAR Dataset/train/subject_train.txt"))

# read test data set
message("loading test data...")
x_test <- read.table(paste0(dataDir, "/UCI HAR Dataset/test/X_test.txt"))
y_test <- read.table(paste0(dataDir, "/UCI HAR Dataset/test/Y_test.txt"))
s_test <- read.table(paste0(dataDir, "/UCI HAR Dataset/test/subject_test.txt"))

# read features table
message("loading features data...")
features <- read.table(paste0(dataDir, "/UCI HAR Dataset/features.txt"))

# read activity labels
message("loading activity labels data...")
a_label <- read.table(paste0(dataDir, "/UCI HAR Dataset/activity_labels.txt"))

# --- merge train and test data to create one data set

message("creating data set...")

# assign column names for each data
colnames(x_train) <- features[,2]
colnames(x_test) <- features[,2]
subname <- "subject"
actname <- "actId"
colnames(s_train) <- subname
colnames(s_test) <- subname
colnames(y_train) <- actname
colnames(y_test) <- actname
colnames(a_label) <- c(actname,"activity")

# make one data set for each data type
train_data <- cbind(s_train,y_train,x_train)
test_data <- cbind(s_test,y_test,x_test)

# combine train and test data
merge_data <- rbind(train_data,test_data)

# select columns which contains "std" or "mean" in its name
col_names <- colnames(merge_data)
selected_cols <- (grepl(actname , col_names) | grepl(subname , col_names) 
         | grepl("mean" , col_names) | grepl("std" , col_names))
selected_merge_data <- merge_data[ , selected_cols]

# change variable's name as descriptive
col_names <- colnames(selected_merge_data)
col_names <- gsub("-mean", "Mean", col_names)
col_names <- gsub("-std", "Std", col_names)
col_names <- gsub("[-()]", "", col_names)
colnames(selected_merge_data) <- col_names

# add descriptive activity name
withActNames <- merge(a_label,selected_merge_data,by=actname)
withActNames <- withActNames[,colnames(withActNames) != actname]

# --- create & save tidy data

# compute mean of each variable per combination of subId x activity
message("computing mean...")
tidy_data <- aggregate(. ~subject + activity, withActNames, mean)

# formatting
tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity),]

# save to file
message("dumping to file...")
write.table(tidy_data, "tidy_dataset.txt", row.name=FALSE)

