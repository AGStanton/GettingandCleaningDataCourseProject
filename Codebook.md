==================================================================
Getting and Cleaning Data
Coursera Data Science Specialization
Course Project
Codebook
==================================================================
In the final output of the R script, there are 180 rows and 88 variables.

2 of these variables are special in that they were not in the original 
data set. There are:
	
	"activityType" : whether the individual was 
		1 : WALKING
		2 : WALKING_UPSTAIRS
		3 : WALKING_DOWNSTAIRS
		4 : SITTING
		5 : STANDING
		6 : LAYING
		
	and "subjectID" : the ID of the individual the measurements were recorded from
==================================================================
Each other variable name is comprised of various components, which when combined
fully describe what the variable is. Below, each of these components
will be explained so that one may correctly interpret any of the variable names.

t : in the time domain
f : in the frequency domain
Body : with relation to the body of the individual
Gravity : with relation to the force of gravity
Acc : acceleration
Jerk : the time derivative of acceleration
Gyro : with relation to the gyroscope
Mag : magnitude
mean: Mean value
std: Standard deviation
mad: Median absolute deviation 
max: Largest value in array
min: Smallest value in array
sma: Signal magnitude area
energy: Energy measure. Sum of the squares divided by the number of values. 
iqr: Interquartile range 
entropy: Signal entropy
arCoeff: Autorregresion coefficients with Burg order equal to 4
correlation: correlation coefficient between two signals
maxInds: index of the frequency component with largest magnitude
meanFreq: Weighted average of the frequency components to obtain a mean frequency
skewness: skewness of the frequency domain signal 
kurtosis: kurtosis of the frequency domain signal 
bandsEnergy: Energy of a frequency interval within the 64 bins of the FFT of each window.
angle: Angle between to vectors.

==================================================================
Here is a snippet from the outputted table of step 5, showing 10 rows and 9 columns of a data table containing 180 rows and 88 columns:

   activityType subjectID tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX tBodyAccStdY tBodyAccStdZ tGravityAccMeanX
1        LAYING         1     0.2215982   -0.04051395    -0.1132036   -0.9280565   -0.8368274   -0.8260614       -0.2488818
2        LAYING         2     0.2813734   -0.01815874    -0.1072456   -0.9740595   -0.9802774   -0.9842333       -0.5097542
3        LAYING         3     0.2755169   -0.01895568    -0.1013005   -0.9827766   -0.9620575   -0.9636910       -0.2417585
4        LAYING         4     0.2635592   -0.01500318    -0.1106882   -0.9541937   -0.9417140   -0.9626673       -0.4206647
5        LAYING         5     0.2783343   -0.01830421    -0.1079376   -0.9659345   -0.9692956   -0.9685625       -0.4834706
6        LAYING         6     0.2486565   -0.01025292    -0.1331196   -0.9340494   -0.9246448   -0.9252161       -0.4767099
7        LAYING         7     0.2501767   -0.02044115    -0.1013610   -0.9365136   -0.9262627   -0.9529784       -0.5028143
8        LAYING         8     0.2612543   -0.02122817    -0.1022454   -0.9430412   -0.9348912   -0.9324915       -0.4059300
9        LAYING         9     0.2591955   -0.02052682    -0.1075497   -0.9423331   -0.9162928   -0.9407073       -0.5802528
10       LAYING        10     0.2802306   -0.02429448    -0.1171686   -0.9682837   -0.9464543   -0.9594715       -0.4530697
..          ...       ...           ...           ...           ...          ...          ...          ...              ...
======================================
As you can see, the data has been tidied considerably. But what does this mean, exactly?

Note that 
	1) Each column contains just one variable, and
	2) Each row records just one observation.
	
Also, the column names have been tidied. Efforts were made to keep the names both short and readable.
Therefore, the primary strategy in tidying column names was to remove superfluous characters,
such as parentheses and dashes.

Formatting the data in this way makes it much more understandable, 
and future analysis would be considerably easier.