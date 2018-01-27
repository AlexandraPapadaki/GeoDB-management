Create table STUDENT_15_exc2 as (select NR,MR_MS,NAME,GIVEN_NAME,COUNTRY,FIELD,HOBBIES,BODY_HEIGHT from STUDENT_15);
Select * from STUDENT_15_exc2 order by NR;

--Task 1:Rename the following attribute of your student’s table: mr_ms to GENDER
Alter table STUDENT_15_exc2 rename column "MR_MS" to "GENDER";

--Task 2:
--1 Create new table countryCreate a new table country containing the attributes: ID_COUNTRY, COUNTRY,CAPITAL (e.g. 1, ‘Ghana’, ‘Accra’)
Create table country (ID_COUNTRY number,COUNTRY VARCHAR2(30),CAPITAL VARCHAR2(30));
Describe country;

--2 Transfer the content of column COUNTRY from table STUDENT_15 into the new table country and fill the corresponding columns (Use SELECT). 
--Take care and avoid inserting redundant data.
Insert into country(COUNTRY) select distinct COUNTRY from STUDENT_15 where COUNTRY is not null;
Select * from country;

Update country set CAPITAL='Zagreb' where COUNTRY='Croatia';
Update country set CAPITAL='Warsaw' where COUNTRY='Poland';
Update country set CAPITAL='Amman' where COUNTRY='Jordan';
Update country set CAPITAL='Santiago' where COUNTRY='Chile';
Update country set CAPITAL='Islamabad' where COUNTRY='Pakistan';
Update country set CAPITAL='Berlin' where COUNTRY='Germany';
Update country set CAPITAL='Washington, D.C.' where COUNTRY='USA';
Update country set CAPITAL='New Delhi' where COUNTRY='India';
Update country set CAPITAL='Athens' where COUNTRY='Greece';
Update country set CAPITAL='Cairo' where COUNTRY='Egypt';
Update country set CAPITAL='Bejing' where COUNTRY='China, PR';
Update country set CAPITAL='Budapest' where COUNTRY='Hungary';
Update country set CAPITAL='Taipei' where COUNTRY='Taiwan';
Update country set CAPITAL='Jakarta' where COUNTRY='Indonesia';
Update country set CAPITAL='Moscow' where COUNTRY='Russia';
Update country set CAPITAL='Accra' where COUNTRY='Ghana';
Update country set CAPITAL='Tehran' where COUNTRY='Iran';
Update country set CAPITAL='Seoul' where COUNTRY='South Korea';
Update country set CAPITAL='Bangkok' where COUNTRY='Thailand';
Update country set CAPITAL='Ankara' where COUNTRY='Turkey';
Select * from country;

--3 To define a unique identifier create a database object (SEQUENCE) for generating distinct numbers
CREATE SEQUENCE country_seq INCREMENT BY 1
START WITH 1 MINVALUE 1 CACHE 100;
UPDATE country
SET ID_country = country_seq.nextval; 
Select * from country;

--4 Alter the schema of table STUDENT_15_exc by adding a new attribute COUNTRY_ID. 
--Establish the relationship of both tables referencing ID_COUNTRY and COUNTRY_ID (Use SELECT)
Alter table STUDENT_15_EXC2 add COUNTRY_ID number;
Select * from STUDENT_15_EXC2 order by NR;
Update STUDENT_15_EXC2 set COUNTRY_ID=(select ID_COUNTRY from country where STUDENT_15_exc2.COUNTRY=country.COUNTRY);
Select * from STUDENT_15_EXC2 order by NR;

--5 Verify your result and delete column COUNTRY in table STUDENT_15_exc2 if the check has been successful
--The result was verified
Alter table STUDENT_15_EXC2 drop column COUNTRY;
Select * from STUDENT_15_EXC2 order by NR;

