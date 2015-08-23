# Codebook
## Getting and Cleaning Data Course Project

This codebook describes the data and the cleaning steps performed on the original data set.

### Original data

The original data were collected from 30 volunteers wearing the Samsung Galaxy S II smartphone, who each performed a series of activities: walking, walking upstairs, walking downstairs, sitting, standing and lying down. The data collected is from the phone's tri-axial accelerometer (with X, Y, Z measurements of linear acceleration) and the phone's gyroscope (also with X, Y, Z measurements of angular velocity).

The original data along with readMe files and other descriptive files can be downloaded from:
[UCI Human Activity Recognition using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

#### Pre-Processing Summary
The original documentation describes the data pre-processing, which has not been altered in this project. It
is summarised below.

The features selected for this data set come from the accelerometer and gyroscope 3-axial raw signals captured at a constant rate of 50 Hz. They were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. They were then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).The acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals.

The magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals. The 'f' prefix denotes frequency domain signals.

### Cleaning the data

The data arrived suitable for a machine learning competition, broken into test and train sets, with variable names, subject (person) IDs and activity definitions all in separate files.

The cleaning involved combining the test and training sets, converting the activity ID to a text description, adding the subject IDs to distinguish people's actions and providing legible names to all variables. 

The end result is a single, wide data frame. 

All variable names were set by me. But a apart from converting the Activity ID to an Activity description, no other data content was changed.

### Cleaning Reasoning

My goal of cleaning this data was to provide clarity and consistency. The original names were hard to read and even a bit confusing (did Acc mean acceleration, or accelerometer?). 

#### Fixing typos and mistakes
From my reading of the documentation it seemed there were a few typos in the source data. For example, "BodyBody" was used on some variables, but was not listed in the source documentation, and in fact made no sense. I decided this was an error and should be a single "Body." One 'angle' variable referred to 'gravity' instead of 'gravityMean'. I again decided this was an error and should be 'gravityMean' as stated in the documentation. Finally I changed activity type 'Laying' to 'Lying Down' which is more natural English. There were a few brackets, commas in the wrong spot too. Each of these fixes is explained with a comment in the source code.

#### Style
My style is to prefer TitleCaseVariables, i.e. no spaces with capitals. I followed this format for both the activity labels and the variable names. The exceptions were the processing method (mean, max, std etc) that I left lower case and separated by a dot and with the direction (X, Y, Z) on the end. For the angle variabls I separated the two vectors by a dot too. I felt this was the most readable arrangement for fairly long variable names.

I was not bothered by long names as I believe clarity and meaning are more important. Most editors
offer editing help (code completion) these days.

#### Time vs frequency
I was not a fan of the 't' and 'f'. In the end I removed 't' from the variable names, but kept the 'f'. The default therefore is that a variable is a time domain variable. The codebook describes each field precisely and states whether each variable is a t or f type.

#### Renaming
I performed several renamings.

First, I realised I would call the volunteer the "Subject", and their column would be the "SubjectId". At that point it made no sense to continue to use "Body" for the variables. Whose body is it? The subject's. I wanted the columns to be consistent. So I renamed all the Body columns to be Subject (eg BodyAcc -> SubjectAcceleration).

I labelled each variable according to the data they held, not the source they came from (so accleration instead of Accelerometer and angular velocity instead of Gyroscope).
Additionally, jerk always refers to linear acceleration jerk, and angular jerk is used to refer to the second derivative of angular velocity [https://en.wikipedia.org/wiki/Jerk_(physics)](https://en.wikipedia.org/wiki/Jerk_(physics)). So I used those names, intending them to be complete in themselves (so SubjectJerk is always the jerk on the subject derived from linear acceleration, and I don't need to repeat 'acceleration'.)

The codebook specifies the sensor used to detect each variable. 

### Original License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


### Definitions of each Variable

####  SubjectId

The unique identifier of the human volunteer (subject) who performed the six activities. There were 30 volunteers, so the ids range from 1 - 30.


####  ActivityType

The description of the activity that the volunteer performed. They wore the phone on a belt while performing these activites, and the data were later manually labelled. There are 6 activity types and each volunteer did them all. The activity types are Walking, walking upstairs, walking downstairs, sitting, lying down, and standing.

####  SubjectAcceleration.mean.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.mean.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.mean.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.std.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.std.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.std.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.mad.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.mad.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.mad.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.max.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.max.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.max.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.min.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.min.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.min.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.sma 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.energy.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.energy.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.energy.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.iqr.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.iqr.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.iqr.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.entropy.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.entropy.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.entropy.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.X.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.X.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.X.3 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.X.4 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.Y.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.Y.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.Y.3 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.Y.4 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.Z.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.Z.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.Z.3 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.arCoeff.Z.4 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.correlation.X.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.correlation.X.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.correlation.Y.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  GravityAcceleration.mean.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.mean.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.mean.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.std.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.std.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.std.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.mad.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.mad.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.mad.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.max.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.max.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.max.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.min.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.min.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.min.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.sma 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.energy.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.energy.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.energy.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.iqr.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.iqr.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.iqr.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.entropy.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.entropy.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.entropy.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.X.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.X.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.X.3 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.X.4 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.Y.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.Y.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.Y.3 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.Y.4 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.Z.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.Z.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.Z.3 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.arCoeff.Z.4 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.correlation.X.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.correlation.X.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.correlation.Y.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  SubjectJerk.mean.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.mean.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.mean.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.std.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.std.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.std.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.mad.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.mad.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.mad.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.max.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.max.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.max.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.min.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.min.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.min.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.sma 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.energy.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.energy.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.energy.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.iqr.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.iqr.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.iqr.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.entropy.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.entropy.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.entropy.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.X.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.X.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.X.3 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.X.4 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.Y.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.Y.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.Y.3 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.Y.4 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.Z.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.Z.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.Z.3 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.arCoeff.Z.4 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.correlation.X.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.correlation.X.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.correlation.Y.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.mean.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.mean.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.mean.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.std.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.std.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.std.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.mad.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.mad.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.mad.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.max.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.max.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.max.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.min.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.min.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.min.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.sma 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.energy.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.energy.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.energy.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.iqr.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.iqr.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.iqr.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.entropy.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.entropy.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.entropy.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.X.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.X.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.X.3 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.X.4 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.Y.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.Y.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.Y.3 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.Y.4 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.Z.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.Z.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.Z.3 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.arCoeff.Z.4 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.correlation.X.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.correlation.X.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.correlation.Y.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.mean.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.mean.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.mean.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.std.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.std.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.std.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.mad.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.mad.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.mad.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.max.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.max.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.max.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.min.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.min.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.min.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.sma 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope).  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.energy.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.energy.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.energy.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.iqr.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.iqr.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.iqr.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.entropy.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.entropy.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.entropy.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.X.1 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.X.2 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.X.3 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.X.4 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.Y.1 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.Y.2 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.Y.3 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.Y.4 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.Z.1 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.Z.2 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.Z.3 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.arCoeff.Z.4 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.correlation.X.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.correlation.X.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.correlation.Y.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as correlation coefficient between two signals. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.mean 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.std 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.mad 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.max 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.min 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.sma 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.energy 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.iqr 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.entropy 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.arCoeff1 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.arCoeff2 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.arCoeff3 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.arCoeff4 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  GravityAccelerationMagnitude.mean 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.std 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.mad 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.max 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.min 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.sma 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.energy 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.iqr 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.entropy 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.arCoeff1 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.arCoeff2 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.arCoeff3 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.arCoeff4 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  SubjectJerkMagnitude.mean 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.std 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.mad 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.max 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.min 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.sma 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.energy 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.iqr 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.entropy 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.arCoeff1 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.arCoeff2 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.arCoeff3 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.arCoeff4 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.mean 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.std 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.mad 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.max 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.min 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.sma 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.energy 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.iqr 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.entropy 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.arCoeff1 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.arCoeff2 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.arCoeff3 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.arCoeff4 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.mean 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as mean value. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.std 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as standard deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.mad 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as median absolute deviation. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.max 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as largest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.min 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as smallest value in array. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.sma 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as signal magnitude area. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.energy 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as energy measure - sum of the squares divided by the number of values. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.iqr 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as interquartile range. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.entropy 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as signal entropy. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.arCoeff1 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.arCoeff2 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.arCoeff3 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.arCoeff4 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as autorregresion coefficients with burg order equal to 4. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.mean.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.mean.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.mean.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.std.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.std.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.std.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.mad.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.mad.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.mad.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.max.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.max.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.max.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.min.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.min.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.min.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.sma 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as signal magnitude area. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.energy.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.energy.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.energy.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.iqr.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.iqr.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.iqr.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.entropy.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.entropy.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.entropy.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.maxInds.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.maxInds.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.maxInds.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.meanFreq.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.meanFreq.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.meanFreq.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.skewness.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.kurtosis.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.skewness.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.kurtosis.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.skewness.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.kurtosis.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.1.8 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.9.16 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.17.24 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.25.32 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.33.40 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.41.48 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.49.56 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.57.64 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.1.16 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.17.32 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.33.48 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.49.64 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.1.24 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.25.48 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.1.8.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.9.16.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.17.24.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.25.32.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.33.40.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.41.48.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.49.56.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.57.64.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.1.16.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.17.32.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.33.48.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.49.64.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.1.24.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.25.48.1 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.1.8.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.9.16.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.17.24.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.25.32.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.33.40.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.41.48.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.49.56.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.57.64.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.1.16.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.17.32.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.33.48.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.49.64.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.1.24.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.bandsEnergy.25.48.2 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.mean.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.mean.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.mean.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.std.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.std.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.std.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.mad.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.mad.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.mad.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.max.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.max.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.max.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.min.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.min.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.min.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.sma 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as signal magnitude area. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.energy.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.energy.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.energy.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.iqr.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.iqr.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.iqr.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.entropy.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.entropy.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.entropy.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.maxInds.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.maxInds.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.maxInds.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.meanFreq.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.meanFreq.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.meanFreq.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.skewness.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.kurtosis.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.skewness.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.kurtosis.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.skewness.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.kurtosis.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.1.8 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.9.16 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.17.24 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.25.32 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.33.40 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.41.48 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.49.56 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.57.64 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.1.16 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.17.32 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.33.48 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.49.64 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.1.24 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.25.48 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.1.8.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.9.16.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.17.24.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.25.32.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.33.40.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.41.48.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.49.56.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.57.64.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.1.16.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.17.32.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.33.48.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.49.64.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.1.24.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.25.48.1 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.1.8.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.9.16.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.17.24.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.25.32.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.33.40.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.41.48.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.49.56.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.57.64.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.1.16.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.17.32.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.33.48.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.49.64.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.1.24.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.bandsEnergy.25.48.2 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer).  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.mean.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.mean.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.mean.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.std.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.std.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.std.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.mad.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.mad.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.mad.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.max.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.max.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.max.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.min.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.min.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.min.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.sma 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as signal magnitude area. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.energy.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.energy.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.energy.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.iqr.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.iqr.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.iqr.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.entropy.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.entropy.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.entropy.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.maxInds.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.maxInds.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.maxInds.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.meanFreq.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.meanFreq.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.meanFreq.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.skewness.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.kurtosis.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.skewness.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.kurtosis.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.skewness.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.kurtosis.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.1.8 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.9.16 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.17.24 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.25.32 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.33.40 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.41.48 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.49.56 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.57.64 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.1.16 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.17.32 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.33.48 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.49.64 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.1.24 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.25.48 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.1.8.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.9.16.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.17.24.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.25.32.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.33.40.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.41.48.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.49.56.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.57.64.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.1.16.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.17.32.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.33.48.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.49.64.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.1.24.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.25.48.1 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.1.8.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.9.16.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.17.24.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.25.32.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.33.40.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.41.48.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.49.56.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.57.64.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.1.16.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.17.32.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.33.48.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.49.64.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.1.24.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.bandsEnergy.25.48.2 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope.  Evaluated as energy of a frequency interval within the 64 bins of the fft of each window.. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.mean 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.std 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.mad 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.max 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.min 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.sma 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as signal magnitude area. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.energy 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.iqr 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.entropy 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.maxInds 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.meanFreq 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.skewness 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.kurtosis 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.mean 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.std 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.mad 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.max 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.min 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.sma 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as signal magnitude area. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.energy 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.iqr 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.entropy 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.maxInds 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.meanFreq 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.skewness 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.kurtosis 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.mean 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.std 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.mad 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.max 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.min 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.sma 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as signal magnitude area. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.energy 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.iqr 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.entropy 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.maxInds 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.meanFreq 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.skewness 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.kurtosis 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.mean 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as mean value. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.std 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as standard deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.mad 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as median absolute deviation. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.max 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as largest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.min 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as smallest value in array. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.sma 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as signal magnitude area. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.energy 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as energy measure - sum of the squares divided by the number of values. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.iqr 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as interquartile range. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.entropy 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as signal entropy. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.maxInds 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as index of the frequency component with largest magnitude. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.meanFreq 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as weighted average of the frequency components to obtain a mean frequency. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.skewness 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as skewness of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.kurtosis 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as kurtosis of the frequency domain signal. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  angle.SubjectAccelerationMean.gravityMean. 

The angle in radians between the two vectors. Each of these additional vectors was obtained by averaging the signals in a signal window sample.   A time domain variable captured at a constant rate of 50hz.  
 


####  angle.SubjectJerkMean.gravityMean. 

The angle in radians between the two vectors. Each of these additional vectors was obtained by averaging the signals in a signal window sample.   A time domain variable captured at a constant rate of 50hz.  
 


####  angle.SubjectAngularVelocityMean.gravityMean. 

The angle in radians between the two vectors. Each of these additional vectors was obtained by averaging the signals in a signal window sample.   A time domain variable captured at a constant rate of 50hz.  
 


####  angle.SubjectAngularJerkMean.gravityMean. 

The angle in radians between the two vectors. Each of these additional vectors was obtained by averaging the signals in a signal window sample.   A time domain variable captured at a constant rate of 50hz.  
 


####  angle.X.gravityMean. 

The angle in radians between the two vectors. Each of these additional vectors was obtained by averaging the signals in a signal window sample.   A time domain variable captured at a constant rate of 50hz.  
 


####  angle.Y.gravityMean. 

The angle in radians between the two vectors. Each of these additional vectors was obtained by averaging the signals in a signal window sample.   A time domain variable captured at a constant rate of 50hz.  
 


####  angle.Z.gravityMean. 

The angle in radians between the two vectors. Each of these additional vectors was obtained by averaging the signals in a signal window sample.   A time domain variable captured at a constant rate of 50hz.  
 


