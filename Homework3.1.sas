/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework3.1.sas
Written by: Arielle Thibeault
Date: January 19, 2023

This program demonstrates how to use list input and the DATALINES statment to read and print the data
set saved into the permanent SAS data set. The program also prints the descriptor information about the
newly established data.

*****/
OPTIONS LS = 80 CENTER; 
*Note, the output will be centered by default but I added it above to be clear;

LIBNAME STAT480 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS'; *Library in my desktop folder;

DATA STAT480.HW3;
  input townname $ townnum month year lowtemp hightemp; *Note, townname is the only character variable;
  DATALINES;
Kane   20 12 2005 12 25
Ambler 22 12 2005  8 20
Kane   20 01 2006 13 32
Oakey  32 12 2005 30 50
Oakey  32 01 2006 25 45
Ambler 22 01 2006 15 28
  ;
RUN;
 
PROC PRINT data=STAT480.HW3;
  title 'Output dataset: HW3';
RUN;

PROC CONTENTS data=STAT480.HW3;
RUN;
