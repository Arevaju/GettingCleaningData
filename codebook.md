# this file describes the purpose of run_analysis.R 


the file run_analysis.R takes the data from the UCIHAR Dataset and processes it (details below). The file needs to changed such that the "yourPath" variable specifices where the UCIHAR Dataset variables have been downloaded and uncompressed to. The path specification system is consistent with linux operating systems. 

The UCIHAR Dataset is the described as following from the source[1]:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. Check the README.txt* file for further details about this dataset.



run_analysis.R works by downloading and unzipping the file in your favourite working directory. Then it reads all the files from test and training sets, loading in variable names and appropriately name the R variables' columns and rows. The Test and Train datasets are merged into a single dataframe of  (observations) x (variables), where each observation is one of the 10299 data points captured in the appropriate study[2], and each of the column is one of the variables measured. The script proceeds creating a reduced version of the dataset containing only the mean and standard deviation values for each measurement. Then it assigns labels to the data set with descriptive activity name. The final part of the script creates a tidy dataset with the average of each variable for each activity and each subject and writes a txt file with the result of this process (tidydata.txt).

[1] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


