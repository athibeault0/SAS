/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Final2.sas
Written by: Arielle Thibeault
Date: February 9, 2023

This program reads a data file into a permanent sas data set question02, creates a change variable capturing the change in a student's pre- and posttest score, performing the MEANS procedure to calculate summary statistics for each teacher, and printing the resulting table in a desired format.
****/
OPTIONS PS = 80 LS = 80 NODATE NONUMBER;

/**Setting the library location**/
LIBNAME stat480 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS';
/**Reading in the data set and creating the change variable**/
DATA stat480.question02;
	infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\question02.dat';
	input subj 1-2 gender $ 3 teacher $ 4-8 age 9-10 pretest 11-12 posttest 13-14;
		change = posttest - pretest;
RUN;
/**Pre-sorting our data by teacher for the desired output**/
PROC SORT data = stat480.question02;
	BY teacher;
RUN;
/**Creating but not printing the MEANS data set and avgchng, medchng variables for future use**/
PROC MEANS data = stat480.question02 maxdec = 1 mean median NOPRINT;
	VAR change;
	BY teacher;
	OUTPUT OUT = mnteach
		mean = avgchng
		median = medchng;
RUN;
/**Printing out the resulting table from the MEANS procedure with the desired output**/
PROC PRINT data = mnteach NOOBS;
	VAR teacher avgchng medchng;
	TITLE 'Average Scores by Teacher';
RUN;
