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

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.mean.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.mean.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.std.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.std.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAcceleration.std.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  GravityAcceleration.mean.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.mean.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.mean.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.std.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.std.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAcceleration.std.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  SubjectJerk.mean.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.mean.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.mean.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.std.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.std.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerk.std.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.mean.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.mean.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.mean.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.std.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.std.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocity.std.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.mean.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.mean.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.mean.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.std.X 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the X direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.std.Y 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Y direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerk.std.Z 

The angular jerk in radians per second cubed (derived in time from angular velocity as measured by the phone's gyroscope). Measured in the Z direction. Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.mean 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAccelerationMagnitude.std 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  GravityAccelerationMagnitude.mean 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  GravityAccelerationMagnitude.std 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to Gravity. 
 


####  SubjectJerkMagnitude.mean 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectJerkMagnitude.std 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.mean 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularVelocityMagnitude.std 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.mean 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as mean of the mean value per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  SubjectAngularJerkMagnitude.std 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as mean of the standard deviation per subject, per activity. A time domain variable captured at a constant rate of 50hz. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.mean.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.mean.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.mean.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.std.X 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the X direction. Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.std.Y 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Y direction. Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAcceleration.std.Z 

The tri-axial acceleration in standard g units as measured by the phone's acclerometer. Measured in the Z direction. Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.mean.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.mean.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.mean.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.std.X 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the X direction. Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.std.Y 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Y direction. Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerk.std.Z 

The jerk in standard g units per second (derived in time from linear acceleration as measured by the phone's accelerometer). Measured in the Z direction. Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.mean.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.mean.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.mean.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.std.X 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the X direction. Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.std.Y 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Y direction. Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocity.std.Z 

The tri-axial angular velocity in radians per second as measured by the phone's gyroscope. Measured in the Z direction. Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.mean 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAccelerationMagnitude.std 

The magnitude of the acceleration as measured by the phone's accelerometer, calculated using the Euclidean norm.  Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.mean 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectJerkMagnitude.std 

The magnitude of the jerk (derived in time from acceleration as measured by the phone's acclerometer), calculated using the Euclidean norm.  Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.mean 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularVelocityMagnitude.std 

The magnitude of the angular velocity as measured by the phone's gyroscope, calculated using the Euclidean norm.  Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.mean 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as mean of the mean value per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


####  fSubjectAngularJerkMagnitude.std 

The magnitude of the angular jerk (angular velocity as measured by the phone's gyroscope and derived in time), calculated using the Euclidean norm.  Evaluated as mean of the standard deviation per subject, per activity. A frequency domain variable, the result of a Fast Fourier Transform. Attributed to the human Subject (volunteer). 
 


