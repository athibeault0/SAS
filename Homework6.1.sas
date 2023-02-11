/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework3.1.sas
Written by: Arielle Thibeault
Date: January 26, 2023

This program imports data from the kidsbooks text file, calculates an addition price per page variable, formats the data, and produces a stylized PRINT table of our key data. 
*****/
OPTIONS LS = 80 PS = 38 NODATE NONUMBER;
/***
This section reads in our raw data
**/
DATA kidsbooks;
	infile 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\kidsbooks.txt';
	input  Title $ 1-20 Author $ 22-40 Publisher $ 43 - 58 @61 Pubdate MMDDYY10. @72 Price 5.2 @79 Pages;
		Priceper = Price/Pages;
RUN;
/***
This section creates a different data set of our original that allows us to sort the data by descening prices
**/
PROC SORT data = kidsbooks out = srt_kidsbooks;
	BY descending Price;
RUN; 
/***
This section yields our final table with the stylized output
**/
PROC PRINT data = srt_kidsbooks LABEL;
	TITLE 'Popular Books for Children';
	FOOTNOTE 'Price obtained from Amazon.com';
	VAR Author Price Pages Priceper 
		Publisher Pubdate;
	LABEL Pages = 'No. of Pages'
		Priceper = 'Price Per Page'
		Publisher = 'Publisher'
		Pubdate = 'Publication Date';
	FORMAT Priceper 4.2 Pubdate date9.;
	ID Title;	
	WHERE Priceper > 0.30;
		SUM Price;
RUN;
