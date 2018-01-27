DESCRIBE STUDENT_15;
Select * from STUDENT_15;
Select NAME,GIVEN_NAME,MR_MS from STUDENT_15;
Select * from STUDENT_15 ORDER BY NAME;
Select * from STUDENT_15 ORDER BY COUNTRY,BODY_HEIGHT;
Select  NAME,GIVEN_NAME,COUNTRY from STUDENT_15 WHERE MR_MS='Ms.' or MR_MS='Ms';
Select NAME,GIVEN_NAME from STUDENT_15 where GIVEN_NAME LIKE '%a%';
Select NAME,GIVEN_NAME from STUDENT_15 WHERE NAME like '%o%' and NAME between 'F' and 'P';
Select NAME,GIVEN_NAME from STUDENT_15 WHERE NAME like '%o%' and NAME >= 'F' and NAME <= 'P';
Select AVG(BODY_HEIGHT) as AVG_HEIGHT, MIN(BODY_HEIGHT) as MIN_HEIGHT, MAX(BODY_HEIGHT) as MAX_HEIGHT from STUDENT_15 WHERE BODY_HEIGHT is not null and BODY_HEIGHT < 30317; 
commit;
--3.1 Update the records where hobby or body height values contain NULL values
Update STUDENT_15 set HOBBIES='Piano, Gymnastics' where HOBBIES is null and NR=36;
Update STUDENT_15 set BODY_HEIGHT=186 where BODY_HEIGHT is null and NR=36;
Update STUDENT_15 set BODY_HEIGHT=164 where BODY_HEIGHT is null and NR=13;
Update STUDENT_15 set BODY_HEIGHT=174 where BODY_HEIGHT is null and NR=1; 
Update STUDENT_15 set BODY_HEIGHT=165 where BODY_HEIGHT is null;
Update STUDENT_15 set HOBBIES = 'Mountain bike' where HOBBIES is null;

--3.2 Correct the height value that is stored in cm units and store it in m
Alter table STUDENT_15 add (bodyheight NUMBER(10 ,2));
Update STUDENT_15 set bodyheight=BODY_HEIGHT/100;

--3.3 Add a new student not listed in the table
Insert into STUDENT_15 (NR, MR_MS, NAME, GIVEN_NAME, COUNTRY, FIELD, HOBBIES, BODY_HEIGHT, bodyheight) values ('42', 'Mr.', 'Polegubic', 'Dino', 'Croatia', 'Geodesy and Geoinformation', 'Water polo, Football', '197', '1,97');
Select * from STUDENT_15 order by NR;

--3.4 Count how many male students are taller than 1.75m and less than 1.85m
Select count(mr_ms) as cnt from STUDENT_15 where (MR_MS='Mr.' or MR_MS='Mr') and bodyheight>1.75 and BODYHEIGHT<1.85;

--3.5 Display the female students’ names and heights in feet and select those who are shorter than 1.70m
Alter table STUDENT_15 add(body_height_feet number (10,2));
Update STUDENT_15 set body_height_feet=bodyheight*3.28;
Select NAME,body_height_feet from STUDENT_15 where (MR_MS='Ms.' or MR_MS='Ms') and bodyheight<1.70;

--3.6 List all students who are not borne in Germany (names and nationalities)
Select NAME,COUNTRY from STUDENT_15 where COUNTRY<>'Germany';

--3.7 Generate a statistic containing students’ nationalities and its frequencies. Use the frequency as first and the alphabetic order as second sort criteria
Select country, count (country) as COUNTRY_freq from STUDENT_15 group by COUNTRY order by COUNTRY_freq, COUNTRY;

--3.8 Create a new table f_students_15 (attributes: name, givenname, field)and insert the female students using the STUDENT_15 table
Create table f_students_15 as (select NAME,GIVEN_NAME,FIELD from STUDENT_15 where MR_MS='Ms.' or MR_MS='Ms');
Select * from f_students_15;

Select * from STUDENT_15 order by NR;





