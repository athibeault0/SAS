/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework9.sas
Written by: Arielle Thibeault
Date: February 5, 2023

This program reads in the ICDB Background Data Set, formats some of the variables based on their data forms, and creates a summary report of the findings.
*****/
OPTIONS PS = 60 LS = 80 NODATE NONUMBER;
/**Reading in the data from the sas7bdat file and setting up income placeholder variables for each type**/
DATA temp;
	set 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\analysis.sas7bdat';
RUN;
/**Setting up the formatting for both variables**/
PROC FORMAT;
	VALUE sexfmt 1 = 'Male'
				2 = 'Female';

	VALUE incomefmt 1 = 'LT $30,000'
					2 = 'GE $30,000';
RUN;
/**Setting up and formatting the report**/
PROC REPORT data = temp NOWINDOWS HEADLINE SPLIT = '*';
    TITLE 'ICDB Study Pain Score';
	COLUMN sex income purg_1;
	DEFINE sex / group 'Gender' FORMAT = sexfmt.;
	DEFINE income / across 'Household Income' FORMAT = incomefmt.;
	DEFINE purg_1 /  mean FORMAT = 5.3 'Pain Score'; *here we're using the average pain score per gender/ sex group;
RUN;
