--2.1.Calculation of the distance of points from origin
Select IDPOINT, sqrt(power(X,2)+power(Y,2)) as DISTANCE from POINT;
--2.2.Calculation of length and sort by that
Alter table EDGE add (LENGTH number(5,2));
Update EDGE set LENGTH= (sqrt(power(((select X from POINT where POINT.IDPOINT=EDGE.POINTID1)-(select X from POINT where POINT.IDPOINT=EDGE.POINTID2)),2)+  
power(((select Y from POINT where POINT.IDPOINT=EDGE.POINTID1)-(select Y from POINT where POINT.IDPOINT=EDGE.POINTID2)),2)));
Select IDEDGE,LENGTH from EDGE order by LENGTH ;
--2.3.Calculation of circumference of each property, ordering by properties` ID
Select IDPROPERTY, sum(LENGTH) as circumference from PROPERTY join (select IDPOLYGON,LENGTH from POLYGON join POLYGONEDGE 
on POLYGONEDGE.POLYGONID=POLYGON.IDPOLYGON join EDGE on EDGE.IDEDGE=POLYGONEDGE.EDGEID) on IDPOLYGON=POLYGONID 
group by IDPROPERTY order by IDPROPERTY;
--2.4.Person who owns the most properties. Properties and owners in descending order
Select NAME,GIVENNAME,NO_OF_PROPERTIES from PERSON join (select PERSONID,count(PERSONID) as NO_OF_PROPERTIES from PROPERTYPERSON group by PERSONID)
on PERSONID=IDPERSON order by NO_OF_PROPERTIES desc;
