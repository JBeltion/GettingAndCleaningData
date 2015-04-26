****RunAnalysis. R Script Creation**

Input files: For use with both Test and Train data
--------------------------------------------------
 1. activity_labels.txt - The mapping the position sampled code to textual descriptions
 2. features.txt  - This contains the variable names for the data contained in each of the Test and Train files

Input files: Test and Train specific files
------------------------------------------

 1. subject_train.txt - This file contains the numbered identities of subjects (people) involved in the tests. This contains a number for each observation row in the X_[test|train].txt file
 2. X_train.txt X_test.txt - These contain the observations statistics (measurements) for all subjects and activities
 3. Y_train.txt, Y_test.txt - This file contains the numbered identities of activities involved in the tests. This contains a 6 value set (1-6) for each subject row in the X_[test|train].txt file

Processing
------------------------------------------
The script carries out the following task types:

 1. Reads in each of the files
 2. Adds the "feature" headings for both sets of data files
 3. Replaces the coded "activities" with their textual description
 4. And generates averages for mean and standard measurement variables
 5. Creates a separate data set with these averages and writes these to an output file.



