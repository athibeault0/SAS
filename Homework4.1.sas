/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework3.2.sas
Written by: Arielle Thibeault
Date: January 21, 2023

This program 
	1. Reads the data set dietdata.dat into a temporary data set dietdata
	2. Adds three new calculated variables: bmi_init, bmi_final, bmi_diff
	3. Prints the resulting table

*****/
OPTIONS PS = 58 LS = 80;

DATA dietdata;
	infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\dietdata.dat'; *this indicates where the raw data is;
	input subj $ 1-3 height $ 4-5 wt_init 6-8 wt_final 9-11;
	PUT height=; *converts height from character to numeric;
	bmi_init = wt_init/(height**2)*(1/2.2)*(1/0.0254**2); *numeric variable added;
	bmi_final = wt_final/(height**2)*(1/2.2)*(1/0.0254**2); *numeric variable added;
	bmi_diff = bmi_final - bmi_init; *numeric variable added;
RUN;

PROC PRINT data = dietdata;
title 'Output dataset: Dietdata';
RUN;
