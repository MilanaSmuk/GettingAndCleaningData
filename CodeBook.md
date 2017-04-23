# Getting and Cleaning Data Course Project
# Codebook

## About original data set

### Data Set Information

Original data set can be found here:


I refer you to read the README and features.txt files from original dataset to get a closer view about entire dataset.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. 
4. Its activity label. 
5. An identifier of the subject who carried out the experiment.

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws


## About tidy data

Tidy data is contained in tidy_data.txt file as a space separated. 
Criteria for tiding original data set are more explained in README.md file 

### Variables

Each row contains 79 measurements for every Subject and Activity

#### Subject 
Subject ID, integer in a range 1-30

#### Activity

Activities preformed by a Subject. They are self-explained:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING



All measurements are normalised and bounded within [-1,1].

Prior to normalisation, acceleration measurements (variables containing Accelerometer) were made in g's (9.81 m.s?²) and gyroscope measurements (variables containing Gyroscope) were made in radians per second (rad.s?¹).

Magnitudes of three-dimensional signals (variables containing Magnitude) were calculated using the Euclidean norm.

The measurements are classified in two domains:
1. Time Signals (prefixed by "Time")
2. Frequency Signals (prefixed by "Frequency")

### Transformations 

1. Train and Test sets are merge into one data set; 
2. From new data set were extracted only those measurements containig average (mean) and standard deviation (std);
3. Activity identifiers, originally numbers from 1 to 6 are changed with corresponding explanatory activity names;
4. Variable names were replaced with more descriptive names (i.e prefix t -> Time, pefix f -> Frequency, Acc -> Accelerometer, Gyro -> Gyroscope, Mag -> Magnitude, BodyBody -> Body). Special caracters are removed as well;
5. From the data set in step 4, the final data set was created with the mean of each activity for each subject.
