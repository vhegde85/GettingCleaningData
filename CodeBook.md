Data Science Specialization
Getting and Cleaning Data 
Final Course Project

Source Data Details
Source: The UCI Machine Learning Repository

Citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

Steps

1. Download Source Data if not available in the directory, Unzip it 

2. Read the following data sets 

	subject_train.txt
	
	X_train.txt
	
	Y_train.txt
	
	subject_test.txt
	
	X_test.txt
	
	Y_test.txt
	
	features.txt
	
	activity_labels.txt

3. Merge all datasets using rbind

4. Extract only mean and standard deviation for all measurements 

5. Tidy variable naming: Use descriptive names to label the various activities in the data

6. Write the output data set

7. Create the aggregated version of the dataset

