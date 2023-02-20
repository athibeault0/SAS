/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework11.sas
Written by: Arielle Thibeault
Date: February 8, 2023

This program reads in the ICDB backhem data set, creates 4 new summarizing variables, and produces two reports to display the data using the MEANS statement and various formatting techniques to achieve the desired outputs.
*****/
OPTIONS PS = 60 LS = 80 NODATE NONUMBER;
/**Reading in the data from the sas7bdat file**/
DATA temp;
	set 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\backhem.sas7bdat';
	if race = . then delete; *removes any missing race values;
RUN;
/**Format for race variable**/
PROC FORMAT;
	VALUE racefmt 1 = 'AmIndian'
	2 = 'Asian'
	3 = 'Black'
	4 = 'Caucasian'
	5 = 'Multi-racial'
	6 = 'Other';
RUN;
/**Initial printed summary data set with added vairables**/
PROC MEANS data = temp maxdec = 2 mean std min max;
	VAR mcv;
	CLASS race;
	OUTPUT OUT = summary /**outputs our desired summary data set**/
		min = minmcv
		max = maxmcv
		N = n
		median = medmcv;
	FORMAT race racefmt.;	
RUN;
/**Secondary set of procedures to get our final output.
   We do this section separately because the previously desired report format works best with the CLASS sorting and to achieve a 'no total row' for our future output, we need to use the SORT then BY statements**/
PROC SORT data = temp out = temp1;
   BY race;
RUN;
PROC MEANS data = temp1 maxdec = 2 mean std min max NOPRINT;
	VAR mcv;
	BY race;
	OUTPUT OUT = summary /**again, outputs our desired summary data set**/
		min = minmcv
		max = maxmcv
		N = n
		median = medmcv;
	FORMAT race racefmt.;	
RUN;
/**Final printed summary data set with formatting**/
PROC PRINT data = summary NOOBS LABEL SPLIT = '/';
	VAR race minmcv medmcv maxmcv n;
	TITLE 'The summary data set';
	LABEL race = 'Race'
			minmcv = 'Minimum/MCV'
			medmcv = 'Median/MCV'
			maxmcv = 'Maximum/MCV'
			n = 'Sample/Size';
RUN;
