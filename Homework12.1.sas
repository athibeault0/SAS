/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework12.1.sas
Written by: Arielle Thibeault
Date: February 9, 2023

This program reads in the back data set and produces a one-way frequency table with the cumulative frequency and the cumulative percent statistics removed.
****/
OPTIONS PS = 60 LS = 80 NODATE NONUMBER;
/**Reading in the data from the sas7bdat file**/
DATA temp;
	set 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\back.sas7bdat';
RUN;

PROC FREQ data = temp;
    TABLES ed_level/NOCUM;
RUN;
