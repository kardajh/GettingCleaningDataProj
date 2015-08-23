# GettingCleaningDataProj
The project submission for the Getting and Cleaning Data course. 

This repo contains
* This README file which describes each file and its contents
* a script file run_analysis.R, which will clean the variable names, and clip together the test and train data
* a code book CodeBook.md, which describes the origin of the data, the cleaning of the data that I performed, and gives a definition for each variable. 

### run_analysis.R

This file 
1. reads in the feature labels and cleans them. This includes fixing typos and mistakes (according to my
reading of the documenation.). It also renames each variable following a logical naming convention.
2. reads in the activity labels and cleans them. This mainly is formatting.
3. reads in the test and train data sets and merges them with the subject identifier and the activity labels, then combines the two data sets.
4. Selects only the mean and standard deviation for each measurement. It calculates a tidy data set containing the mean per subject, per activity of each measurement. There are 180 rows (30 subjects x 6 activities) in 
this data set.
5. Contains code to output the variable name section of the CodeBook with descriptions.

### CodeBook.md

This file explains the source of the data, the original pre-processing performed, and the cleaning steps I took and why. 
It includes the definitions of all variables. 
