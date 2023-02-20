/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Midterm2.sas
Written by: Arielle Thibeault
Date: January 27, 2023

This program reads in our question02 data via DATALINES, assigns a category variable with different values based on the observation's endwght value. 
*****/
OPTIONS PS = 60 LS = 80 NODATE NONUMBER;

LIBNAME STAT480 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS'; *Library in my desktop folder;
/******
The following DATA step reads the raw data in from the DATALINES statement, as well as assigns a new variable category, into a permanent SAS data set called STAT480.question02.
*****/
DATA STAT480.question02;
	INPUT idno 1-4 name $ 6-13 team $ 15 @17 strtwght @21 endwght;
	if (endwght = .) then category = .; *this line removes the category value for any observations with missing endwght values;
		else if (endwght < 120) then category = 1;
		else if (120 <= endwght < 150) then category = 2;
		else if (150 <= endwght < 180) then category = 3;
		else if (endwght >= 180) then category = 4;
DATALINES;
1023 Shaw     R 189 165
1049 Serrano  Y 145 124
1219 Nance    R 210 192
1246 Sinha    Y 194 177
1078 McKnight R 127 118
1221 Brown    Y 220  .
RUN;
/******
The following PROC step prints the table of data to our specifications. Though not specified, I made output customizations to improve layout of the resulting table.
*****/
PROC PRINT data = STAT480.question02 DOUBLE NOOBS LABEL;
	TITLE 'Question #2';
	VAR idno name team strtwght endwght category;
	LABEL idno = 'ID Number'
			name = 'Last Name'
			team = 'Team Color'
			strtwght = 'Starting Weight (lbs)'
			endwght = 'Ending Weight (lbs)'
			category = 'Category';
RUN;
