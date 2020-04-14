# Modifications
the original data was modified by
- Merging the training and the test sets to create one data set.
- Extracting only the measurements on the mean and standard deviation for each measurement.
- Replacing class label in the data set with descriptive activity name.
- Converting columns names of data set to 'descriptive'.
- Aggregating average of each variable for each activity and each subject.

# Descriptions of tidy data set
## Identififiers
The first two columns below are Identifiers.
- subject: An identifier of the subject who carried out the experiment.
- activity: the Name of the Activity performed by the subject.

## Measurements
Keep orinal features which include string "std" or "mean". 
The name of each measurements modified as descriptive. 
(e.g. "tBodyAcc-mean()-X" -> "tBodyAccMeanX" : removing "-" and "()", replace "mean" to "Mean" respectively.)
Rows were aggregated average for each activity and each subject above.

 [1] "tBodyAccMeanX"                "tBodyAccMeanY"                "tBodyAccMeanZ"                "tBodyAccStdX"                
 [5] "tBodyAccStdY"                 "tBodyAccStdZ"                 "tGravityAccMeanX"             "tGravityAccMeanY"            
 [9] "tGravityAccMeanZ"             "tGravityAccStdX"              "tGravityAccStdY"              "tGravityAccStdZ"             
[13] "tBodyAccJerkMeanX"            "tBodyAccJerkMeanY"            "tBodyAccJerkMeanZ"            "tBodyAccJerkStdX"            
[17] "tBodyAccJerkStdY"             "tBodyAccJerkStdZ"             "tBodyGyroMeanX"               "tBodyGyroMeanY"              
[21] "tBodyGyroMeanZ"               "tBodyGyroStdX"                "tBodyGyroStdY"                "tBodyGyroStdZ"               
[25] "tBodyGyroJerkMeanX"           "tBodyGyroJerkMeanY"           "tBodyGyroJerkMeanZ"           "tBodyGyroJerkStdX"           
[29] "tBodyGyroJerkStdY"            "tBodyGyroJerkStdZ"            "tBodyAccMagMean"              "tBodyAccMagStd"              
[33] "tGravityAccMagMean"           "tGravityAccMagStd"            "tBodyAccJerkMagMean"          "tBodyAccJerkMagStd"          
[37] "tBodyGyroMagMean"             "tBodyGyroMagStd"              "tBodyGyroJerkMagMean"         "tBodyGyroJerkMagStd"         
[41] "fBodyAccMeanX"                "fBodyAccMeanY"                "fBodyAccMeanZ"                "fBodyAccStdX"                
[45] "fBodyAccStdY"                 "fBodyAccStdZ"                 "fBodyAccMeanFreqX"            "fBodyAccMeanFreqY"           
[49] "fBodyAccMeanFreqZ"            "fBodyAccJerkMeanX"            "fBodyAccJerkMeanY"            "fBodyAccJerkMeanZ"           
[53] "fBodyAccJerkStdX"             "fBodyAccJerkStdY"             "fBodyAccJerkStdZ"             "fBodyAccJerkMeanFreqX"       
[57] "fBodyAccJerkMeanFreqY"        "fBodyAccJerkMeanFreqZ"        "fBodyGyroMeanX"               "fBodyGyroMeanY"              
[61] "fBodyGyroMeanZ"               "fBodyGyroStdX"                "fBodyGyroStdY"                "fBodyGyroStdZ"               
[65] "fBodyGyroMeanFreqX"           "fBodyGyroMeanFreqY"           "fBodyGyroMeanFreqZ"           "fBodyAccMagMean"             
[69] "fBodyAccMagStd"               "fBodyAccMagMeanFreq"          "fBodyBodyAccJerkMagMean"      "fBodyBodyAccJerkMagStd"      
[73] "fBodyBodyAccJerkMagMeanFreq"  "fBodyBodyGyroMagMean"         "fBodyBodyGyroMagStd"          "fBodyBodyGyroMagMeanFreq"    
[77] "fBodyBodyGyroJerkMagMean"     "fBodyBodyGyroJerkMagStd"      "fBodyBodyGyroJerkMagMeanFreq"

### Dropped measurements from original data set
Features DO NOT include string either "std" or "mean" in its name.
Number of measurements in original data set was 561.
