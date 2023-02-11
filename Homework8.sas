/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework8.sas
Written by: Arielle Thibeault
Date: February 3, 2023

This program is an edited version of the provided Program from Hannah Highbaum, with a number of functional errors corrected.

In the below, I was able to find 18 corrections, 24 if you include individual value errors.
*****/
OPTIONS PS = 58 LS = 80 NODATE NONUMBER; *there was a missing semicolon here, NODATE was misspelled, and LS was an invalid value;

DATA sales; *I removed the 37 f's here so the data set name was valid;
INPUT weekof $ Store $ Mon Tues Wed Thur Fri; *INPUT was spelled incorrectly, and I changed weekof to character;
	AvgSales = (Mon + Tues + Wed + Thur + Fri)/5; *fixed the Thur and the average calculation; 	
length Group $7; *I changed this value to 7 but I don't think this is actually needed anymore;
label weekof = 'Date'; *there was a matching quotation missing here and label was misspelled;
if AvgSales = '.' then Group = 'N/A'; 
	else if AvgSales LE 605 then Group = 'Low';
	else if 605 LT AvgSales LE 750 then Group = 'Average'; 
	else if AvgSales GT 750 then Group = 'High'; *I spread all these if/ else statements out for readability;
	*Above, 750 had a sneaky O for a 0, which was corrected;
if Store = 110 then region = 'South'; 
	else if Store = 111 then region = 'South';
	else if Store = 112 then region = 'North';
	else if Store = 113 then region = 'North';
	else if Store = 114 then region = 'North'; *I spread all these if/ else statements out for readability;
	*Also, for the above line, I added missing quote pairs around North;
drop Mon Tues Wed Thur Fri; 
*I added a missing semicolon below;
DATALINES;
10/12/07 110 412 532 641 701 802
10/12/07 111 478 567 699 789 821
10/12/07 112 399 501 650 712 812
10/12/07 113 421 532 698 756 872
10/12/07 114 401 510 612 721 899
17/12/07 110 710 725 789 721 799
17/12/07 111 689 701 729 703 721
17/12/07 112 899 812 802 738 712
17/12/07 113 700 712 748 765 801
17/12/07 114 699 799 899 608    
24/12/07 110 377 377 377 377 377
24/12/07 110 340 333 321 401 490
24/12/07 111 801 793 721 763 798
24/12/07 112 598 798 684 502 412
24/12/07 113 980 921 832 812 849
24/12/07 114 798 709 721 799 724
31/12/07 110 487 321 399 312 321
31/12/07 111 501 532 598 581 601
31/12/07 112 598 512 540 523 549
31/12/07 113 601 625 674 698 601
31/12/07 114 900 805 700 601 811
;
*In the above table, I corrected the store name in the first line to be the numeric "110" instead of "11O";
*I also added the 11th line since it was missing, I arbitrarily chose each day's value to be 377 so they would satisfy the average;
RUN; 
PROC PRINT data = sales label; *removed the back slash here;
TITLE 'Sales Data'; *this was added;
RUN;
