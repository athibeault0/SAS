/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework12.2.sas
Written by: Arielle Thibeault
Date: February 9, 2023

This program reads in the ICDB back data set and creates a two-way table for the variables sex and ed_level with missing values included.
****/
OPTIONS PS = 60 LS = 80 NODATE NONUMBER;
/**Reading in the data from the sas7bdat file**/
DATA temp;
	set 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\back.sas7bdat';
RUN;
/**Two-way FREQ table**/
PROC FREQ data=temp;
   TABLES sex*ed_level/nopercent nocol missing;
RUN;
