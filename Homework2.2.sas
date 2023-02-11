/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework2.2.sas
Written by: Arielle Thibeault
Date: January 14, 2023

This program reads the raw data from the grades.dat into the permanent data set STAT480.HW2_2 and prints the
resulting table.
*****/
LIBNAME STAT480 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS';
 
DATA STAT480.HW2_2;
  infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\grades.dat'; *this indicates where the raw data is;
  input id 1-2 gender $ 3 exam1 4-5 exam2 6-7 hwgrade $ 8; *this line identifies the format of the raw data:
RUN;
 
PROC PRINT data=STAT480.HW2_2;
  title 'Output dataset: STAT480.HW2_2';
RUN;
