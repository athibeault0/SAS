/******
C:\Users\arielle.thibeault\Desktop\STAT 480\Homework9.sas
Written by: Arielle Thibeault
Date: February 5, 2023

This program reads in the ICDB Background Data Set, takes a seubset of variables, defines specific formats for the remaining variables, prints the subject picture, and prints a Frequency table for the remaining 5 variables.
*****/
OPTIONS PS = 60 LS = 80 NODATE NONUMBER;
/**Reading in the data from the sas7bdat file**/
DATA temp;
	set 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\back.sas7bdat';
	drop v_type v_date b_date sex ethnic relig ed_level emp_st job_chng income;
RUN;
/**Below we set up the formatting for state using the state_cd data set**/
DATA states;
	set 'C:\Users\arielle.thibeault\Desktop\STAT 480\SAS\state_cd.sas7bdat' (rename = (code = start name=label));
	fmtname = 'stat2fmt';
RUN;
 
PROC FORMAT cntlin=states;
RUN;
/**Below we set up the formatting for subj, race, mar, and r_id**/
PROC FORMAT;
	PICTURE subjpix LOW-HIGH = '00-00000' (prefix='#');

	VALUE countryfmt 1 = 'United States'
                  	2 = 'Canada'
                 	3 = 'Mexico'
                  	other = 'Other';
                  
	VALUE racefmt 3 = 'Black'
               	4 = 'White'
               	other = 'Other';
				*1 = 'Aleut, Eskimo or American Indian';
				*2 = 'Asian or Pacific Islander';
				*The above two lines are potential formats to the race values but the prompt specifically said White, Black, and Other so I left them in comment form;	
               
	VALUE marfmt 1 = 'Married'
             	2 = 'Living with a Partner'
             	3 = 'Separated'
             	4 = 'Divorced'
             	5 = 'Widowed'
             	6 = 'Never Married';
            
	PICTURE r_idpix LOW-HIGH = '9999';
RUN;
/**Printing out the first 10 subjects of the data set**/
PROC PRINT data = temp (OBS = 10);
	VAR subj;
RUN;
/**Frequency Count tables for state**/
PROC FREQ data = temp;
  TITLE 'Freqency Count for STATE (stat2fmt)';
  FORMAT state stat2fmt.;
  TABLE state;
RUN;
/**Frequency Count tables for country**/
PROC FREQ data = temp;
TITLE 'Frequency Count for Country';
FORMAT country countryfmt.;
TABLE country;
RUN;
/**Frequency Count tables for race**/
PROC FREQ data = temp;
TITLE 'Frequency Count for Race';
FORMAT race racefmt.;
TABLE race;
RUN;
/**Frequency Count tables for marital status**/
PROC FREQ data = temp;
TITLE 'Frequency Count for Marital Status';
FORMAT mar_st marfmt.;
TABLE mar_st;
RUN;
/**Frequency Count tables for r_id**/
PROC FREQ data = temp;
TITLE 'Frequency Count for R_ID';
FORMAT r_id r_idpix.;
TABLE r_id;
RUN;
/**A display of all the formats in our catalog**/
PROC FORMAT FMTLIB PAGE;
   TITLE 'Selected Formats from TEMP Catalog';
   SELECT subjpix states countryfmt racefmt marfmt r_idpix;
RUN;

