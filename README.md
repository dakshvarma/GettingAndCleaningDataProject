GettingAndCleaningDataProject
=============================
- This document describes how to use run_analysis.R
- Requires plyr installed
- First change the working directory to the UCI HAR Dataset folder
- This folder should contain the features.txt file and train and test folders
- Source run_analysis.R
- The script reads in the features.txt files for the headers for the data
- Training and test data is read in
- The headings from features.txt are applied as column names
- The two data sets are merged
- The columns with mean and std dev are used to create the summary data set
- The output file is tidyData.txt