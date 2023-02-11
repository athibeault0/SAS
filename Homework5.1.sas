/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework3.1.sas
Written by: Arielle Thibeault
Date: January 21, 2023

This program is split into 3 parts.

This section of the program (part1)
	1. Reads in the bone score data from the Bone and Joint Research Lab
	2. Creates 4 flag variables for different bone density conditions and creates a variable as the sum of all the flags
	3. Prints out the resulting table
*****/

DATA bonescore1;
infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\Bonescor2.dat';
input singh 1 ccratio 3-5 csi 7-9 calcar 11-12 bone 14-15 dpa 17-21;
	if (singh <= 4) then flag1 = 1;
		else if (singh > 4) AND (singh <= 5) then flag1 = 2;
		else if	(singh > 5) then flag1 = 3; *these three lines assign values for flag1;
	if (ccratio > 0.67) then flag2 = 1;
		else if (ccratio > 0.52) AND (ccratio <= 0.67) then flag2 = 2;
		else if	(ccratio <= 0.52) then flag2 = 3; *these three lines assign values for flag2;
	if (csi <= 0.55) then flag3 = 1;
		else if (csi > 0.55) AND (csi <= 0.65) then flag3 = 2;
		else if	(csi > 0.65) then flag3 = 3; *these three lines assign values for flag3;
	if (calcar <= 6) then flag4 = 1;
		else if (calcar > 6) AND (calcar <= 7) then flag4 = 2;
		else if	(calcar > 7) then flag4 = 3; *these three lines assign values for flag4;
	ourscore = flag1 + flag2 + flag3 + flag4; *the fifth variable, summing up the 4 flags;
RUN;

PROC PRINT data = bonescore1;
	title 'Output dataset: bonescore1';
	var singh ccratio csi calcar bone dpa flag1 flag2 flag3 flag4 ourscore;
RUN;
/***
In the output, we see that even though there are missing values for Obs 4 singh and Obs 15 csi, there are still flag1 and flag3 values.
This is obviosuly incorrect. Since SAS considers missing values to be the lowest value, they are taking on the flag value of whichever corresponds to the lowest-valued condition.
Because of the nature of the variable, this means that these misread values also influence the variable ourscore.
	So for these two variables, we are receiving 2 variable values that are meaningless (flag1 and ourscore for the missing singh, flag3 and ourscore for the missing csi)
***/


/******
This section of the program (part2)
	1. Reads in the bone score data from the Bone and Joint Research Lab
	2. Creates 4 flag variables for different bone density conditions and creates a variable as the sum of all the flags
	3. Adds "correcting" missing value IF-ELSE statements to the flag variable assingments
	4. Prints out the resulting table
*****/
DATA bonescore2;
infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\Bonescor2.dat';
input singh 1 ccratio 3-5 csi 7-9 calcar 11-12 bone 14-15 dpa 17-21;
	if (singh <= 4) then flag1 = 1;
		else if (singh > 4) AND (singh <= 5) then flag1 = 2;
		else if	(singh > 5) then flag1 = 3; 
		else if (singh = .) then flag1 = .; *these four lines assign values for flag1;
	if (ccratio > 0.67) then flag2 = 1;
		else if (ccratio > 0.52) AND (ccratio <= 0.67) then flag2 = 2;
		else if	(ccratio <= 0.52) then flag2 = 3; 
		else if (ccratio = .) then flag2 = .; *these four lines assign values for flag2;
		*I know there aren't any missing ccratio values, but for the sake of completeness;
	if (csi <= 0.55) then flag3 = 1;
		else if (csi > 0.55) AND (csi <= 0.65) then flag3 = 2;
		else if	(csi > 0.65) then flag3 = 3; 
		else if (csi = .) then flag3 = .; *these four lines assign values for flag3;
	if (calcar <= 6) then flag4 = 1;
		else if (calcar > 6) AND (calcar <= 7) then flag4 = 2;
		else if	(calcar > 7) then flag4 = 3; 
		else if (calcar = .) then flag4 = .; *these four lines assign values for flag4;
		*I know there aren't any missing calcar values, but for the sake of completeness;
	ourscore = flag1 + flag2 + flag3 + flag4; *the fifth variable, summing up the 4 flags;
RUN;

PROC PRINT data = bonescore2;
	title 'Output dataset: bonescore2';
	var singh ccratio csi calcar bone dpa flag1 flag2 flag3 flag4 ourscore;
RUN;
/***
Again, we're getting incorrect values here for those same instances of missing values. Why, we added another statement to cover this?
Order is important. SAS moves through the IT-THEN-ELSE statement until it finds a condition that it satifies and then exists the statement.
Because our "if the value is missing" line is at the end, SAS is still reading these values at their "lowest" point before considering that they may be missing and a condition is able to be satisfied before our correction statement.
***/

/******
This section of the program (part3)
	1. Reads in the bone score data from the Bone and Joint Research Lab
	2. Creates 4 flag variables for different bone density conditions and creates a variable as the sum of all the flags
	3. Correctly adds missing value IF-ELSE statements to the flag variable assingments
	4. Prints out the correct resulting table
*****/
DATA bonescore3;
infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\Bonescor2.dat';
input singh 1 ccratio 3-5 csi 7-9 calcar 11-12 bone 14-15 dpa 17-21;
 
	if (singh = .) then flag1 = .; 
		else if (singh <= 4) then flag1 = 1;
		else if (singh > 4) AND (singh <= 5) then flag1 = 2;
		else if	(singh > 5) then flag1 = 3; *these four lines assign values for flag1;
	if (ccratio = .) then flag2 = .; 
		else if (ccratio > 0.67) then flag2 = 1;
		else if (ccratio > 0.52) AND (ccratio <= 0.67) then flag2 = 2;
		else if	(ccratio <= 0.52) then flag2 = 3; *these four lines assign values for flag2;
		*I know there aren't any missing ccratio values, but for the sake of completeness;
	if (csi = .) then flag3 = .; 
		else if (csi <= 0.55) then flag3 = 1;
		else if (csi > 0.55) AND (csi <= 0.65) then flag3 = 2;
		else if	(csi > 0.65) then flag3 = 3; *these four lines assign values for flag3;
	if (calcar = .) then flag4 = .; 
		else if (calcar <= 6) then flag4 = 1;
		else if (calcar > 6) AND (calcar <= 7) then flag4 = 2;
		else if	(calcar > 7) then flag4 = 3; *these four lines assign values for flag4;
		*I know there aren't any missing calcar values, but for the sake of completeness;
	ourscore = flag1 + flag2 + flag3 + flag4; *the fifth variable, summing up the 4 flags;
RUN;

PROC PRINT data = bonescore3;
	title 'Output dataset: bonescore3';
	var singh ccratio csi calcar bone dpa flag1 flag2 flag3 flag4 ourscore;
RUN;
/***
Finally, we got it!
***/
