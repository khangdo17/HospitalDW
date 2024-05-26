use HospitalBillDWFinal
go



CREATE TABLE DimDate (
  DATE_KEY int identity(1,1) primary key, 
  DATE datetime NOT NULL,
  YEAR int NOT NULL,
  MONTH int NOT NULL,
  DAY int NOT NULL
);

CREATE TABLE DimDoctor (
  DOCTER_KEY int identity(1,1) primary key,
  DOCTOR_ID  int NOT NULL,
  DOCTOR_NAME nvarchar(255),
  DEPARTMENT nvarchar(255)
);

CREATE TABLE DimPatient (
  PATIENT_KEY int identity(1,1) primary key,
  PATIENT_ID  float  NOT NULL,
  NAME_UPPER nvarchar(255),
  DOB datetime2(7),
  AGE tinyint,
  SEX nvarchar(50),
  ADDRESS nvarchar(255),
  PROVINCE nvarchar(255),
  PATIENT_CREATION_DATE datetime2(7)
);

CREATE TABLE DimService (
  SERVICE_KEY int identity(1,1) primary key,
  ITEM_CODE  nvarchar(50) NOT NULL,
  ITEM varchar(Max),
  ITEM_GROUP nvarchar(255),
  ITEM_TYPE nvarchar(255)
);

CREATE TABLE DimClinic (
  CLINIC_KEY int identity(1,1),
  CLINIC_CODE nvarchar(255) NOT NULL PRIMARY KEY,
  CLINIC_NAME nvarchar(255)
);

CREATE TABLE FactSale (
  DATE_KEY datetime,
  DOCTOR_ID int,
  PATIENT_ID int,
  ITEM_CODE  nvarchar(50),
  CLINIC_CODE nvarchar(255),
  NET_SALE decimal(10,2),
  GROSS_SALE decimal(10,2),
  QUANTITY int,
  STATUS nvarchar(10),

);


ALTER TABLE FactSale
ADD CONSTRAINT FK_FactSale_DateKey FOREIGN KEY (DATE_KEY) REFERENCES DimDate(DATE_KEY)

ALTER TABLE FactSale
ADD CONSTRAINT FK_FactSale_DoctorId FOREIGN KEY (DOCTOR_KEY) REFERENCES DimDoctor(DOCTOR_KEY)

ALTER TABLE FactSale
ADD CONSTRAINT FK_FactSale_PatientId FOREIGN KEY (PATIENT_KEY) REFERENCES DimPatient(PATIENT_KEY)

ALTER TABLE FactSale
ADD CONSTRAINT FK_FactSale_ItemCode FOREIGN KEY (SERVICE_KEY) REFERENCES DimService(SERVICE_KEY)

ALTER TABLE FactSale
ADD CONSTRAINT FK_FactSale_ClinicCode FOREIGN KEY (CLINIC_KEY) REFERENCES DimClinic(CLINIC_KEY)

