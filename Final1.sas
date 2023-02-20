/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Final1.sas
Written by: Arielle Thibeault
Date: February 9, 2023

This program reads data from the penngolf data set into a temporary data set, incorporates a new variable (lngth) which classifies the length of golf courses as Long or Shot, and produces a crosstabulation table of par by lngth with formatting. 
****/
OPTIONS PS = 80 LS = 80 NODATE NONUMBER;
/**Reading in the data set and assigning the lngth variable**/
DATA penngolf;
	set 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\penngolf.sas7bdat';
	if yards <= 6500 then lngth = 1;
		else if yards > 6500 then lngth = 2;
RUN;
/**Setting up the format for lngth**/
PROC FORMAT;
	VALUE lngthfmt 1 = 'Short'
					2 = 'Long';
RUN;
/**Creating the crosstabulation table and printing out the resulting display with formatting**/
PROC FREQ data = penngolf;
	TITLE 'Crosstabulation of Par by Length of Course';
	TABLES par*lngth / NOPERCENT NOCOL OUT = penngolf;
	FORMAT lngth lngthfmt.;
RUN;

