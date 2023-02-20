/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Final3.sas
Written by: Arielle Thibeault
Date: February 10, 2023

This program assigns a study's Gender, Group, Score, and Birthdate data into a permanent data set and utilizes two methods (REPORT procedure and PRINT procedure) to create data summary visualizations.
****/
OPTIONS PS = 80 LS = 60 NODATE NONUMBER;

LIBNAME stat480 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS';
/**Assigning the data set**/
DATA stat480.question03;
	INPUT Gender $ 1 Grp $ 3 Score 5-6 BirthDate $ 8-17;
DATALINES;
M A 20 03/07/1947
M A 30 10/11/1964
M A 40 11/13/1954
M A 20 04/01/1941
M A 50 08/19/1962
M B 70 08/13/1964
M B 80 05/22/1961
M B 90 11/04/1939
M C 90 02/16/1959
M C 90 03/17/1952
M C 80 07/04/1956
M C 90 10/19/1946
F A 25 06/10/1954
F A 30 04/04/1950
F A 45 07/31/1942
F A 30 05/26/1948
F A 65 12/25/1960
F A 72 01/01/1953
F B 70 09/09/1963
F B 90 02/14/1955
F B 90 04/11/1945
F B 80 05/23/1958
F B 85 06/15/1939
F C 20 08/01/1956
F C 20 11/11/1961
F C 30 03/03/1943
RUN;
/**Using the report procedure to generate a summary of observations by Gender, Group, and Average Score per group**/
PROC REPORT data = stat480.question03 HEADLINE Split = '/';
	COLUMN Gender Grp Score;
	TITLE 'Average Score by Gender and Group';
	DEFINE Gender /group width = 6 spacing = 4 center;
	DEFINE Grp / group 'Group' width = 5 spacing = 4 center;
	DEFINE Score / mean 'Average/Score' width = 7 format = 4.1 center;
RUN;
/**Printing the filtered results for Females in group C**/
PROC PRINT data = stat480.question03 NOOBS;
	TITLE 'Scores for Female Subjects in Group C';
	VAR BirthDate Score;
	WHERE Gender = 'F' and Grp = 'C';
RUN;

