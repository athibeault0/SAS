/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework9.sas
Written by: Arielle Thibeault
Date: February 5, 2023

This program reads the data file into a temporary data set, parks, and creates a summary via REPORT procedure to display details per Region group.
*****/
OPTIONS PS = 60 LS = 90 NODATE NONUMBER;
/**Reading in the data from the dat file**/
DATA parks;
	infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\natparks.dat';
	input ParkName $ 1-21 @23 Type $ @26 Region $ @31 Museums @33 Camping;
	Facil = Museums + Camping;
RUN;
/**Creating and modifying the report output**/
PROC REPORT data = parks NOWINDOWS;
	TITLE 'National Parks';
	COLUMN Region Museums Camping Facil;
	DEFINE Region / group;
	DEFINE Museums / format = 2.0 width = 8 center;
	DEFINE Camping / format = 2.0 width = 8 center;
	DEFINE Facil / 'Facilities' format = 2.0 width = 10 center;
RUN;
