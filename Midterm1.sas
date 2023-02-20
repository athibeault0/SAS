/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Midterm1.sas
Written by: Arielle Thibeault
Date: January 27, 2023

This program demonstrates our ability to customize SAS output using several features in the PRINT procedure for our data set question01.
*****/
OPTIONS PS = 58 LS = 80 NODATE NONUMBER; *Note, centered output is the default;
/******
The following DATA step reads the data file into a temporary SAS data set called question01.
*****/
DATA question01;
	infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\question01.dat';
	input name $ 1-18 @20 holes @23 par yardage $ 26-30 @32 fees 6.2;
	yardnum = input(yardage, comma5.); *since we read in yardage as a character variable, here we convert it to the numeric form we want;
RUN;
/******
The following PROC step prints the table of data to our specifications.
*****/
PROC PRINT data = question01 DOUBLE NOOBS SPLIT = '/';
	FORMAT fees dollar7.2 yardnum comma5.;
	TITLE 'Question #1';
	VAR name par holes yardnum fees;
	LABEL name = 'Golf Course'
		par = 'Par'
		holes = 'No. of / holes'	
		yardnum = 'Yardage'
		fees = 'Greens / Fees';
RUN;
