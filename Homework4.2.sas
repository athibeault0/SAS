/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework3.1.sas
Written by: Arielle Thibeault
Date: January 21, 2023

This program demonstrates the use of arethmetic operations in variable creation with
five example variables and prints the restulting table.

*****/
OPTIONS PS = 58 LS 80; *page size = 58, line size = 80;

DATA temp;
  input @1 abc 2. @4 def 1. @6 ghi 1. @8 jkl 1.;
  one = abc + def - ghi + jkl;
  two = (abc + def) - (ghi + jkl);
  three = abc + jkl + (def - ghi);
  four = abc + jkl + def/ghi;
  five = (abc + def)/(ghi + jkl);
  DATALINES;
10 5 2 4
  ;
RUN;

PROC PRINT data = temp;
    title 'Output dataset: temp';
RUN;
