/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework12.3.sas
Written by: Arielle Thibeault
Date: February 9, 2023

This program reads in the ICDB background data set into the temporary data set summary, uses the FREQ procedue to capture summary statistics for each combination of sex and mar_st and prints the data set in a simple PRINT procedure with formatting.
****/
OPTIONS PS = 60 LS = 80 NODATE NONUMBER;
/**Reading in the data from the sas7bdat file**/
DATA summary;
	set 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\back.sas7bdat';
RUN;
/**Setting up but not printing the two-way Frequency Table. This output saves over the current "summary" data set**/
PROC FREQ data=summary;
	TABLE sex*mar_st/list out=summary NOCUM NOPRINT SPARSE;
RUN;
/**Setting up formatting for the variables sex and mar_st**/
PROC FORMAT;
	VALUE sexfmt 1 = 'Male'
				2 = 'Female';

	VALUE marfmt 1 = 'Married'
				2 = 'Partner'
				3 = 'Separated'
				4 = 'Divorced'
				5 = 'Widowed'
				6 = 'Never';
RUN;
/**Printing the new summary data set with formatting**/
PROC PRINT data=summary;
	TITLE 'Summary data set';
	FORMAT sex sexfmt.;
	FORMAT mar_st marfmt.;
RUN;
