library(Hmisc)
library(reshape2)
library(dplyr)

#
# Getting and Cleaning Data
# run_analysis.R
# This script loads the data, cleans the text names, and zips the data together into 
# a single data set. It also generates a partial codebook containing feature names and definitions.
#

# Assumes data has already been downloaded and put into directory "data" and unzipped.
# Eg:
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="data/samsung.zip", method="curl")
# unzip("data/samsung.zip", exdir = "data/")
# list.files("data")
# Files are located in various sub directories as specifie by zip file, separated by train and test.

#
# Step 1. Read in the feature names and clean.
#
features <- read.table("data/UCI HAR Dataset/features.txt", 
                       header= FALSE, stringsAsFactors = FALSE)
# Problem:  There are quite a few typos in this document and none of these are 
# valid column names. There are typos, invalid characters, 
# duplicates, and mistaken labelling (ie BodyBody). Fix them all. Note that we 
# will later discard the duplicated variables, so a temporary name is fine
features_valid <- features[,2]

# fix it: I believe from reading the doc that this "angle" variable should use the 'gravityMean' vector 
# like all the others, not 'gravity'. 
features_valid <- gsub("BodyAccMean,gravity", "BodyAccMean,gravityMean", features_valid)
# fix it: There is an extra bracket on another "angle" variable, remove it
features_valid <- gsub("BodyAccJerkMean\\),", "BodyAccJerkMean,", features_valid)
# fix it: remove extra Body in some f variables (by reading features.info this is a wrong label)
features_valid <- gsub("fBodyBody", "fBody", features_valid)

# fix it: use make.names to remove duplicates and all invalid characters
features_valid <- make.names(features_valid, unique = TRUE)
# improve it: remove all those triple dots that make.names() puts on
features_valid <- gsub("\\.\\.\\.", ".", features_valid)
# improve it: remove any double dots at end of name from make.names()
features_valid <- gsub("\\.\\.", "", features_valid)

# Now improve the text. The goal is clarity and consistency. Generally I renamed each column 
# to contain a correct description of its contents, eg 'Acceleration', 'AngularVelocity'. 
# I am not worried about name length as I think clarity is more important; most tools have auto-complete these days.
new_names <- gsub("tBody", "Subject", features_valid) # Consistent with naming each volunteer 'Subject'
new_names <- gsub("fBody", "fSubject", new_names)
new_names <- gsub("AccJerk", "Jerk", new_names)    # Jerk is the name for third derivative of linear acceleration, no need for 'Acc'
new_names <- gsub("GyroJerk", "AngularJerk", new_names) # Angular Jerk is the name for the third derivative of angular velocity (wikipedia)
new_names <- gsub("Acc", "Acceleration", new_names)
new_names <- gsub("Mag", "Magnitude", new_names)
new_names <- gsub("Gyro", "AngularVelocity", new_names)
new_names <- gsub("tGravity", "Gravity", new_names)

# Result: we now have 561 useable, consistent, and very readable column names! 

#
# Step 2. Read in activity labels and prettify them. 
#
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt", 
                              stringsAsFactors = FALSE)
# Problem: they are all upper case with underscores. Hard to read. 'Laying' is incorrect English.
# Prefer: TitleCaseWithNoSpaces. Change 'Laying' to 'LyingDown'.
# fix it: convert to lower case
activity_labels<- tolower(activity_labels$V2)
# fix it: convert 'Laying' to 'LyingDown'
activity_labels <- gsub("laying", "lying_down", activity_labels)
# Remove underscore, capitalize first letter of each word and re-glue:
activity_labels <- sapply(activity_labels, 
                          function(x) {paste0(capitalize(unlist(strsplit(x, "_"))), collapse = "")})
# we don't need 'names' for this vector, but sapply put them on. Take them off. 
names(activity_labels) <- NULL
# Result: six readable, consistent activity names!

#
# Step 3. Read in actitivies, subjects and feature data and combine them. Convert 
# activity numbers to labels along the way. Do both 'train' and 'test' at the same time.
#
data_set_names = list("test", "train")

# read in both activity data sets into list "activities"
activities <- lapply(data_set_names, function(name){
   read.table(paste0("data/UCI HAR Dataset/", name, "/y_", name, ".txt"), 
              stringsAsFactors = FALSE, header = FALSE) 
})

# convert both to a vector of named activites instead of numbers
labelled_Activities <- lapply(activities, function(activity){
    activity_labels[activity$V1]
})

# read in both subject Id files:
subject_ids <- lapply(data_set_names, function(name){
    read.table(paste0("data/UCI HAR Dataset/", name, "/subject_", name, ".txt"), 
               stringsAsFactors = FALSE, header = FALSE)
})

# read in feature data
feature_data <- lapply(data_set_names, function(name){
    read.table(paste0("data/UCI HAR Dataset/", name, "/X_", name, ".txt"), 
               stringsAsFactors = FALSE, header = FALSE)
})

# zip together each column in individual sets
test_data <- cbind(subject_ids[[1]], labelled_Activities[[1]], feature_data[[1]])
train_data <- cbind(subject_ids[[2]], labelled_Activities[[2]], feature_data[[2]])

# put column names on each one (rbind works much better with correct names)
cnames <- c("SubjectId", "ActivityType", new_names)
colnames(test_data) <- cnames
colnames(train_data) <- cnames

# zip test to train
full_data <- rbind(test_data, train_data)

# 
# Result: Data is now cleaned. 'full_data' contains the entire data frame. It is a wide data frame
# with 563 columns and over 10000 rows. The goals of the cleaning have been met: the Subject
# and activity have been added, using labels for activity; the feature variables have 
# been given proper names, and the test and train have been combined.
#

#
# Step 4: Select only the mean and standard deviation for each measurement.
#
# I took this to mean the mean and std dev for each measure, not including meanFreq, and not 
# including 'angle' variables, as they don't have a std dev. 
mean_std_only <- select(full_data, matches("SubjectId|ActivityType|std|mean$|mean\\.", ignore.case = FALSE))

# now shrink and calculate just the mean per activity, per subject.
# use melt to flatten and dcast to expand with correct summary.
# create a long data set of only 4 columns (subject, activity, measurement and value)
mean_std_only_melted <- melt(mean_std_only, id.vars = c("SubjectId", "ActivityType"), 
                             variable.name = "Measurement", value.name="Value")

# cast it back to a wide data set but this time aggregate values by subject,activity using mean
tidy_summary <- dcast(mean_std_only_melted, SubjectId + ActivityType ~ Measurement, fun.aggregate = mean)

# Now tidy_summary is 180 rows, with 2 columns (subject and activity) and 66 feature columns 
# of mean and std only. This is a tidy data set with each variable in its own column, and 
# oneobservation per row. 

# write it out to a file.
write.table(tidy_summary, file="tidy_summary.txt", row.names = FALSE)

# 
# That is all for the cleaning of the data. The remaining code is just how I generated the
# portion of the codebook for the many variable names. 
#

# Code to make partial mark down file containing the definitions of all the features. 
# The other parts of the codebook are written by hand and this part is copied in.

# First import the proper definitions of the functions applied to the features. 
feature_defn <- readLines("data/UCI HAR Dataset/features_info.txt", n = 49)
# need only lines 33-48, leave angle(), we detect that manually.
feature_defn <- feature_defn[33:48]
# remove brackets from definitions
feature_defn <- gsub("\\(\\)", "", feature_defn)
# Split by ':' character. Returns a two element vector: keys are first element x[1] (the short name eg std)
# definitions are second element - x[2], eg "standard deviation". Trim white space. 
feature_defn_keys <- sapply(strsplit(feature_defn, ":"), function(x) {x[1]})  
feature_defn_vals <- sapply(strsplit(feature_defn, ":"), function(x) {tolower(trimws(x[2]))})
# This has mucked up 'energy measure', fix it.
feature_defn_vals[7] <- "energy measure - sum of the squares divided by the number of values"
names(feature_defn_vals) <- feature_defn_keys

# Below here are a series of functions used to output text. In RStudio these functions need to be defined
# before they are called. The code that calls these functions is below them all.

# Function to work out time or frequency for a given variable. 
getDomain <- function(codeWord) {
    if (grepl("^[f]", codeWord))  {
        "A frequency domain variable, the result of a Fast Fourier Transform."
    } 
    else  {
        "A time domain variable captured at a constant rate of 50hz."
    }
}

# Works out who/what the acceleration is attributed to (human subject or gravity)
getAttributedTo <- function(codeWord) {
    if (grepl("angle", codeWord)) return()
    
    if (grepl("Gravity", codeWord)) {
        "Attributed to Gravity." 
    }
    else if (grepl("Subject", codeWord)) {
        "Attributed to the human Subject (volunteer)."
    }
    else {
        "Attributed To: Nothing"
    }
    
}

# Works out the basic description of the feature. Note order of matching is important so we 
# move from most specific description to least specific solution.
getWhat <- function(codeWord){
    if (grepl("angle", codeWord)) {
        "The angle between the two vectors. Each of these additional vectors was obtained by averaging the signals in a signal window sample."
    }
    else if (grepl("AccelerationMagnitude", codeWord)){
        "The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm."
    }
    else if (grepl("Acceleration", codeWord)) {
        "The tri-axial acceleration as measured by the phone's acclerometer."
    }
    else if (grepl("AngularJerkMagnitude", codeWord)) {
        "The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm."
    }
    else if (grepl("AngularJerk", codeWord)) {
        "The angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm."
    }
    else if (grepl("JerkMagnitude", codeWord)){
        "The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm."
    }
    else if (grepl("Jerk", codeWord)){
        "The jerk (derived in time from linear acceleration as measured by the phone's accelerometer)."
    }
    else if (grepl("AngularVelocityMagnitude", codeWord)) {
        "The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm."
    }
    else if (grepl("AngularVelocity", codeWord)) {
        "The tri-axial angular velocity in radians per second as measured by the phone's gyroscope."
    }
    else {
        "Unknown What"
    }
}

getProcessing<- function(codeWord){
    # need to check every item in feature_defn_vals to see which matches.
    # check in reverse order so we avoid finding mean when we really have meanFreq.
    for (i in length(feature_defn_vals):1){
        if (grepl(feature_defn_keys[i], codeWord)) {
            # output the method:
            return(paste0("Evaluated as ", feature_defn_vals[i], "."))
        }
    }
}

getAxialDirection <- function(codeWord){
    if (grepl("angle", codeWord)) {
        return()
    }
    else if (grepl("X", codeWord)){
        "Measured in the X direction."
    }
    else if (grepl("Y", codeWord)) {
        "Measured in the Y direction."
    }
    else if (grepl("Z", codeWord)){
        "Measured in the Z direction."
    }
    else {
        return()
    }
}

# For a code word (feature) will generate the required descriptive text.
makeDefn <- function(codeWord) {
    paste( getWhat(codeWord), 
           getAxialDirection(codeWord), 
           getProcessing(codeWord), 
           getDomain(codeWord), 
           getAttributedTo(codeWord), "\n"
    )
}

# 
# Here is the code that calls all the above functions. 
#
# First remove last version of the generated file. 
file.remove("partialCodebook.md")
# Create a data frame to hold our feature name and definiton. 
new_df <- data.frame('codeword' = new_names)
# call makeDefn to construct a unique definition for each code word. (See functions above). 
definitions <- sapply(new_df$codeword, makeDefn)
new_df$definitions <- definitions

# write out each feature variable and its definition to a file, using markdown syntax.. 
for (i in 1:nrow(new_df)) {
    write(paste("#### ",as.character(new_df$codeword[i]), "\n"), "partialCodebook.md", append = TRUE)
    write(paste(new_df$definitions[i], "\n\n"), "partialCodebook.md", append = TRUE)
}


