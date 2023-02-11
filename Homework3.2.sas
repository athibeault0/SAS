/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework3.2.sas
Written by: Arielle Thibeault
Date: January 20, 2023

This program reads the data set rats.dat into a temporary data set rats and adjusts formats to print
a readable table of the dataset.

*****/
OPTIONS PS = 56 LS = 78 CENTER NODATE; *page size = 56, line size = 78, centered output, and no date/ time printed;

DATA rats;
  infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\rats.dat'; *this indicates where the raw data is;
  input @1 rat 
+1 dob anydtdte9.
+1 disease anydtdte9.
+1 death anydtdte8.
@32 group $;
FORMAT death mmddyy8. dob date9. disease date9.; *This formats our output to be readable;
RUN;
 
PROC PRINT data=rats;
  title 'Output dataset: rats';
RUN;
