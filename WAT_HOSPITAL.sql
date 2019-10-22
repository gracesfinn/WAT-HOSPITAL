CREATE DATABASE IF NOT EXISTS WAT_HOSPITAL;

USE WAT_HOSPITAL;

CREATE TABLE IF NOT EXISTS ward
(
wardID int AUTO_INCREMENT,
wardName VARCHAR(20),
wardType VARCHAR(20),
PRIMARY KEY(wardID)
);

CREATE TABLE IF NOT EXISTS patient
(
patientID int AUTO_INCREMENT,
 fName VARCHAR(15), 
 lName VARCHAR(15), 
 street VARCHAR(15),
 town VARCHAR(15),
 county VARCHAR(15),
 contactNo int(40),
 arriveDate DATE,
 dischargeDate DATE,
 PRIMARY KEY (patientID)
);

CREATE TABLE IF NOT EXISTS bed
(
bedNumber int AUTO_INCREMENT,
bedType VARCHAR(20),
wardID INT,
patientID INT,
PRIMARY KEY (bedNumber),
CONSTRAINT FK_wardID FOREIGN KEY(wardID) REFERENCES ward(wardID)
ON UPDATE CASCADE ON DELETE SET NULL,
CONSTRAINT FK_patientID FOREIGN KEY(patientID) REFERENCES patient(patientID) 
ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS doctor
(
 PPS VARCHAR(10),
 fName VARCHAR(15), 
 lName VARCHAR(15), 
 street VARCHAR(15),
 town VARCHAR(15),
 county VARCHAR(15),
 contactNo int(40),
 hireDate DATE,
 specialisation VARCHAR(30),
 PRIMARY KEY(PPS)
);

CREATE TABLE IF NOT EXISTS drug
(
drugID INT AUTO_INCREMENT,
drugName VARCHAR(50),
manufacturer VARCHAR(50),
PRIMARY KEY(drugID)
);

CREATE TABLE IF NOT EXISTS visit
(
visitID INT AUTO_INCREMENT,
patientID int,
PPS VARCHAR(10),
visitDate datetime,
PRIMARY KEY(visitID),
CONSTRAINT FK_patient FOREIGN KEY(patientID) REFERENCES patient(patientID) 
ON UPDATE CASCADE ON DELETE SET NULL,
CONSTRAINT FK_doc FOREIGN KEY(PPS) REFERENCES doctor(PPS) 
ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS prescription
(
visitID int,
drugID int,
dosageDetails VARCHAR(1000),
PRIMARY KEY (visitID, drugID),
CONSTRAINT FK_vis FOREIGN KEY(visitID) REFERENCES visit(visitID),
CONSTRAINT FK_drug FOREIGN KEY(drugID) REFERENCES drug(drugID) 
);

insert into ward(wardID, wardName, wardType) values
(
'101', 'ER', 'Emergency Department'
),
(
'102', 'ICU', 'Intensive Care'
),
(
'103', 'Dialysis Suite', 'Acute Care'
),
(
'104', 'Chemo Suite', 'Oncology'
),
(
'201', 'Pre-Natal', 'Maternity'
),
(
'202', 'Post-Natal', 'Maternity'
);

insert into patient(patientID, fname, lname, street, town, county, contactNo, arriveDate, dischargeDate) values
(
001, 'Jim', 'Smith', 'Church Road', 'Tramore', 'Waterford', '051123456', '2019-10-01', null
),
(
002, 'Jane', 'Smith', 'Church Road', 'Tramore', 'Waterford', '051123456', '2019-10-02', null
),
(
003, 'Ben', 'Power', 'Preist Road', 'Tramore', 'Waterford', '051234567', '2019-10-03', '2019-10-10'
);

insert into bed(bedNumber, bedType, wardID, patientID) values
(
01, 'Standard', 101, 003
),
(
02, 'Maternity', 201, 002
),
(
03, 'Standard', 102, 001
);

insert into doctor(PPS, fname, lname, street, town, county, contactNo, hireDate, specialisation) values
(
'12345678A', 'Aoife', 'Hurley', 'Dunmore Road', 'Dunmore', 'Waterford', '051345677', '2019-01-03', 'Maternity'
),
(
'23456789B', 'Eanna', 'Lowney', 'Ardmore Road', 'Ardmore', 'Waterford', '051456778', '2019-01-01', 'Oncology'
),
(
'34567891C', 'Phillipa', 'Walsh', 'Old Tramore Road', 'Tramore', 'Waterford', '051987463', '2018-10-01', 'Cardiology'
);

alter table doctor
modify COLUMN PPS varchar(10);

alter table doctor
modify COLUMN street varchar(30);

insert into visit(visitID, patientID, PPS, visitDate) values
(
201901, 001, '34567891C', '2019-10-22'
),
(
201902, 002, '12345678A', '2019-10-10'
),
(
201903, 003, '23456789B', '2019-10-14'
);

alter table visit
modify COLUMN PPS varchar(10);

insert into drug(drugID, drugName, manufacturer) values
(
);