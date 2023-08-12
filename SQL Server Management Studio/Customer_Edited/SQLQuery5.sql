SELECT * FROM Customer

WHERE Gender_Code = 'MISS.'

INSERT INTO CUSTOMER 
(CUST_NAME,Gender_Code,ADDRESS1,CITY,STATE,COUNTRY_CODE,POSTAL_CODE,POSTAL_CODE_PLUS4,ADDRESS2,EMAIL_ADDRESS,PHONE_NUMBER,CREDITCARD_TYPE, LOCALITY)

VALUES('CHUKWU GIFT', 'MISS.', 'BAAR ROAD', 'YENAGOA', 'ABIA', 'NG',655017, 1, 'OJO ROAD', 'GIFTED85@GMAIL.COM', 09222415237, 'MASTERCARD', 'EPIE');


INSERT INTO CUSTOMER 
(CUST_NAME,Gender_Code,ADDRESS1,CITY,STATE,COUNTRY_CODE,POSTAL_CODE,POSTAL_CODE_PLUS4,ADDRESS2,EMAIL_ADDRESS,PHONE_NUMBER,CREDITCARD_TYPE, LOCALITY)

VALUES('AMADI GRACE', 'MISS.', 'COLOURS BAAR ROAD', 'ABA', 'ABIA', 'NG',556017, 1, 'ESTATE ROAD', 'AMA85@GMAIL.COM', 08012415237, 'DINNER', 'HAERVAR');

-- Being Unique is Good

delete from Customer
where CUST_NAME between 'chukwu grace' and  'Amadi grace';


USE master
GO
CREATE DATABASE RecoverDeletedRecord;
GO
USE RecoverDeletedRecord;
GO
Create Table [Customer] (

[CUST_NAME] varchar,[Gender_Code] varchar,ADDRESS1 varchar,CITY varchar,STATE varchar,COUNTRY_CODE varchar,
POSTAL_CODE varchar,POSTAL_CODE_PLUS4 varchar,ADDRESS2 varchar,EMAIL_ADDRESS varchar,
PHONE_NUMBER varchar,CREDITCARD_TYPE varchar, LOCALITY varchar
 
 )

 use RecoverDeletedRecord;

 Go
 Insert into Customer Default Values;
 Go 100;

 insert into Customer (CUST_NAME, Gender_Code)

 values ('Amarachi', 'Female')

 Use RecoverDeletedRecord
 GO
 Delete Customer
 WHERE CUST_NAME < xxxxx10
 GO
  SELECT * FROM Customer