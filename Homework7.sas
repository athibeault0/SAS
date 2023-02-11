DATA grades;
	input student $ 1-5 g1 7-9 g2 11-13;
	avg = (g1+g2)/2;
	DATALINES;
Smith 100 9O
Jones  84 86
Black  95 75
White  90  .
;
RUN;
PROC PRINT data = grades;
RUN;
