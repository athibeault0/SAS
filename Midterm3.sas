/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Midterm3.sas
Written by: Arielle Thibeault
Date: January 27, 2023

This program accesses the permanent SAS data set question03.sas7bdat in a temporary data set question03, creates three additional variables for analysis and prints out the resulting table. 
*****/
OPTIONS PS = 60 LS = 80 NODATE NONUMBER;
/******
This section sets the existing sas7bdat data set question03 to a temporary SAS data set question03.
Additionally, we add two average variables for the first and second exam scores and the second and third exam scores, and a third new variable to assign status based on the relative improvement/ decline of scores based on the two average comparisons.
*****/
DATA question03;
	set 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\question03.sas7bdat';
	average1 = mean(grade1,grade2);
	average2 = mean(grade2,grade3);
	if (grade1 = . OR grade2 = .) then status = 'incomplete';
		else if (average1 = average2) then status = 'no change';
		else if (average1 < average2) then status = 'improved';
		else if (average1 > average2) then status = 'regressed';
RUN;
/******
This section prints out our obtained data set. Though not specified, I made output customizations to improve layout of the resulting table.
******/
PROC PRINT data = question03 DOUBLE NOOBS LABEL SPLIT = '/';
	TITLE 'Question #3';
	VAR student grade1 grade2 grade3 average1 average2 status;
	LABEL student = 'Student'
			grade1 = 'Exam 1 Grade'
			grade2 = 'Exam 2 Grade'
			grade3 = 'Exam 3 Grade'
			average1 = 'Average Grade / of Exams 1 & 2'
			average2 = 'Average Grade / of Exams 2 & 3'
			status = 'Grade Progression / Status';
RUN;
