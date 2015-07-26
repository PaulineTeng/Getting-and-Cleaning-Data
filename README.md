# Run Analysis

## Input Data
The raw dataset is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For this analysis, the below files are extracted and analyzed.

	\UCI HAR Dataset\test\X_test.txt

	\UCI HAR Dataset\test\y_test.txt

	\UCI HAR Dataset\test\subject_test.txt

	\UCI HAR Dataset\train\X_train.txt

	\UCI HAR Dataset\train\y_train.txt

	\UCI HAR Dataset\train\subject_train.txt

	\UCI HAR Dataset\features.txt

####X_test.txt and X_train.txt
These files are the training sets and contain observation of 561 features.

####y_test.txt and y_train.txt
These are the training labels and contain 1 variable.

####subject_test.txt & subject_train.txt
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

####features.txt
List of all features.

####activity_labels.txt
Links the class labels with their activity name.


## Processing Steps
Step 1: Download file from the website and unzip it.

Step 2: Read subject_train.txt and subject_test.txt into data1 and assign the column name as "subject".

Step 3: Read y_train.txt, y_test.txt into data2.

Step 4: Read activity_labels.txt and match the labels with the training activities of data2.

Step 5: Read X_train.txt, X_test.txt into data3.

Step 6: Read feature.txt and rename the features for easier reading.

Step 7: Assign feature as the column names of data3.

Step 8: Combine data from data1, activity labels of data2 and features with mean and std values of data3.

Step 9: Calculate the average of the selected features by subject and activity. Then save as Run Analysis Result.txt in working directory.


