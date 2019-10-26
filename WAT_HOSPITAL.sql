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

alter table doctor
change COLUMN fName docFName varchar(15),
change COLUMN lName docLName varchar(15);

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

insert into patient(patientID, fname, lname, street, town, county, contactNo, arriveDate, dischargeDate) values
(
005, 'Jessica', 'Cullen', 'Cliff Road', 'Tramore', 'Waterford', '05114567', '2019-10-05', null
),
(
006, 'Sharon', 'Duggan', 'Main Street', 'Dunhill', 'Waterford', '05156896', '2019-10-06', null
),
(
007, 'Rebecca', "O'Neill", 'New Road', 'Tramore', 'Waterford', '051874653', '2019-10-10', null
),
(
008, 'Louise', "Kilcommons", 'Fenor', 'Tramore', 'Waterford', '051390568', '2019-10-12', null
),
(
009, 'Mark', 'Swift', 'Main Street', 'Woodstown', 'Waterford', '051948573', '2019-10-02', null
),
(
010, 'Peter', 'Collins', 'Main Street', 'Kilmeadan', 'Waterford', '051748564', '2019-10-05', null
),
(
011, 'Miriam', 'Nevin', 'Main Street', 'Kilmacthomas', 'Waterford', '051857463', '2019-10-12', null
),
(
012, 'Tim', 'English', 'Main Street', 'Bunmahon', 'Waterford', '051857463', '2019-10-05', null
),
(
013, 'Jan', 'Denton', 'Main Street', 'Dunmore East', 'Waterford', '051657483', '2019-10-10', null
),
(
014, 'Larry', 'Peters', 'Main Street', 'Dungarvan', 'Waterford', '051957483', '2019-10-20', null
),
(
015, 'Adam', 'Schalk', 'Main Street', 'Piltown', 'Waterford', '051657483', '2019-10-20', null
),
(
016, 'Craig', 'McDonald', 'Main Street', 'Kill', 'Waterford', '051765387', '2019-10-20', null
),
(
017, 'Dan', 'Cole', 'Main Street', 'Dungarvan', 'Waterford', '051765387', '2019-10-20', null
),
(
018, 'Bianca', 'Chris', 'Main Street', 'Dungarvan', 'Waterford', '051837282', '2019-10-20', null
),
(
019, 'Megan', 'Morgan', 'Main Street', 'Dunmore East', 'Waterford', '051847382', '2019-10-20', null
),
(
020, 'Tiffany', 'Farrel', 'Main Street', 'Kilmeaden', 'Waterford', '051938475', '2019-10-20', null
);

select *
from patient;





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

insert into doctor(PPS, docFName, docLName, street, town, county, contactNo, hireDate, specialisation) values
(
'74836273E', 'William', 'Duggan', 'Doneraile Drive', 'Tramore', 'Waterford', '051876576', '2019-01-03', 'Emergency Care'
),
(
'74836273E', 'Emer', 'Fine', 'New Town', 'Tramore', 'Waterford', '051873622', '2019-01-03', 'Paediatrics'
);

select *
from doctor;

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
4711501, 'Ellence', 'Johnson&Johnson' 
),
(
4711502, 'Propranolol', 'Pfizer'
),
(
4711503, 'Epidural', 'Bayer'
),
(
4711504, 'Paracetamol', 'Sanofi'
);

insert into prescription(visitID, drugID, dosageDetails)
values
(
201901, 4711504, "Take two every four hours with food"
),
(
201902, 4711503, "0.0625% to 0.1 % bupivacaine with 2-4 mcg/ml fentanyl or 0.4 mcg/ml
sufentanil"
),
(
201903, 4711502, "Immediate-release: 40 mg orally 2 times a day"
);

show tables;

select * 
from bed;

insert into bed(bedNumber, bedType, wardID, patientID) values
(
1011, 'Standard', 101, null
),
(
1012, 'Standard', 101, null
),
(
1013, 'Standard', 101, null
),
(
1014, 'Standard', 101, null
),
(
1015, 'Standard', 101, null
);

insert into bed(bedNumber, bedType, wardID, patientID) values
(
2021, 'Maternity', 202, null
),
(
2022, 'Maternity', 202, null
),
(
2023, 'Maternity', 202, null
),
(
2024, 'Maternity', 202, null
),
(
2025, 'Maternity', 202, null
);

insert into bed(bedNumber, bedType, wardID, patientID) values
(
1021, 'Orthopedic', 102, null
),
(
1022, 'Orthopedic', 102, null
),
(
1023, 'Orthopedic', 102, null
),
(
1024, 'Orthopedic', 102, null
),
(
1025, 'Orthopedic', 102, null
);

insert into bed(bedNumber, bedType, wardID, patientID) values
(
1041, 'Standard', 104, null
),
(
1042, 'Standard', 104, null
),
(
1043, 'Standard', 104, null
),
(
1044, 'Standard', 104, null
),
(
1045, 'Standard', 104, null
);

select * 
from bed;


delete from bed
where bedNumber = 003; 


