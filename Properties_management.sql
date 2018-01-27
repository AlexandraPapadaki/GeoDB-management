drop table Property_SDO;

CREATE TABLE Property_SDO (
  idProperty_SDO NUMBER PRIMARY KEY,
  description VARCHAR2(50),
  geom SDO_GEOMETRY
);

INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (1, 'Property_Sergio', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,3), sdo_ordinate_array (0,0, 20,20)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (2, 'Property_Sophie', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,3), sdo_ordinate_array (20,0, 40,30)));  
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (3, 'Property_Peter', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,3), sdo_ordinate_array (0,20, 20,30)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (4, 'Property_Salar', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,1, 11,2003,1), sdo_ordinate_array (40,0, 80,0, 80,30, 40,30, 40,0, 50,10, 50,20, 75,20, 75,10, 50,10)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (5, 'Building', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,3), sdo_ordinate_array (50,10, 75,20)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (6, 'Main_Road', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,3), sdo_ordinate_array (0,30, 40,40)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (7, 'Field_road', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,3), sdo_ordinate_array (40,30, 80,40)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (8, 'Property_Mark', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,3), sdo_ordinate_array (0,40, 10,60)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (9, 'Property_Alexandra', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,3), sdo_ordinate_array (10,40, 30,60)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (10, 'Property_Tri', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1003,3), sdo_ordinate_array (30,40, 40,60)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (11, 'Property_no_owner', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1005,2, 1,2,1, 9,2,2,  15,1003,4, 21,1005,2, 21,2,2, 25,2,1), SDO_ORDINATE_ARRAY(64,60, 40,60, 40,40, 80,40, 80,44, 68.686,48.686, 64,60, 67,52, 69,50, 71,52, 80,50, 72.928,52.928, 70,60, 80,60, 80,50)));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (12, 'Tree', sdo_geometry (2001, null, sdo_point_type (23,18,null), null, null));
INSERT INTO Property_SDO (idProperty_SDO,description,geom)VALUES (13, 'River', sdo_geometry (2003, null, null, sdo_elem_info_array (1,1005,4, 1,2,2, 5,2,1, 7,2,2, 11,2,1, 15,2003,4), SDO_ORDINATE_ARRAY(80,44, 68.686,48.686, 64,60, 70,60, 72.928,52.928, 80,50, 80,44, 67,52, 69,50, 71,52)));

INSERT INTO USER_SDO_GEOM_METADATA 
VALUES ('Property_SDO','geom', MDSYS.SDO_DIM_ARRAY(
	MDSYS.SDO_DIM_ELEMENT ('X', -10, 100, 0.05),
	MDSYS.SDO_DIM_ELEMENT ('Y', -10, 100, 0.05)
	),
	NULL
);
commit;

--a. Calculate the circumference for each property and display the result ordered by the properties' ID
Select idProperty_SDO,description, SDO_GEOM.SDO_LENGTH(geom, 0.001) as CIRCUMFERENCE from Property_SDO order by idProperty_SDO ;
--b.Calculate the area for each property and display the result in descending order complemented by the properties’ ID
Select idProperty_SDO,description, SDO_GEOM.SDO_AREA(geom, 0.001)as AREA from Property_SDO order by AREA DESC;
--c.Calculate the distance from property 3 to all other properties, display the result and the property’s ID, ordered by distance
Select idProperty_SDO,description, SDO_GEOM.SDO_DISTANCE((Select geom from Property_SDO where description='Property_Peter'),geom,0.005) as PROP_DISTANCE 
from Property_SDO where description<>'Property_Peter' order by PROP_DISTANCE;
