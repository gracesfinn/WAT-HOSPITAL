USE WAT_HOSPITAL; 

/*---------Frequently Asked Questions-------*/

/* FAQ 1 - List all patients in a certain ward - e.g. ER */

select concat(fName, ' ', lName) as "Name", wardName as "Ward", bedNumber as "Bed Number"
from patient join bed
on patient.patientID=bed.patientID
join ward
on ward.wardID=bed.wardID
where wardName like 'ER'
order by lname;

/* FAQ 2 Search for all current patients staying in hospital */

select concat(fName, ' ', lName) as "Name", wardName as "Ward", bedNumber as "Bed Number", arriveDate as "Date of Admission"
from patient join bed
on patient.patientID=bed.patientID
join ward
on ward.wardID=bed.wardID
where dischargeDate is null;

/* FAQ 3 Show the number of patients under each doctors care */

select count(*) as 'Number of Patients', concat(docFName, ' ', docLName) as "Under the care of:"
from visit join patient
on patient.patientID=visit.patientID
join doctor 
on visit.PPS=doctor.PPS
group by docLName;

/* FAQ 4 Show the names of all patients under a certain doctors care */

select concat(docFName, ' ', docLName) as "Doctor's Name", concat(fName, ' ', lName) as "Patient's Name", wardName as "Ward", bedNumber as "Bed Number", arriveDate as "Date of Admission"
from ward join bed
on ward.wardID=bed.wardID
join patient 
on patient.patientID=bed.patientID
join visit
on patient.patientID=visit.patientID
join doctor
on visit.PPS=doctor.PPS
where docLName like 'Duggan'
group by fname;

/* FAQ 4 Show the number of current patients on each ward */

select count(*) as 'Number of Patients', wardName as "Name of Ward", wardType as "Department"
from patient join bed
on patient.patientID=bed.patientID
join ward
on ward.wardID=bed.wardID
where dischargeDate is null
group by wardName;

/* FAQ 5 Show number of empty bed in each ward */

select count(*) as "Number of Empty Bed", wardName as "Name of Ward", wardType as "Department"
from bed join ward
on ward.wardID=bed.wardID
where patientID is null
group by wardName;

/* FAQ 6 Show the list of drug precriptions for each patients */

select concat(fName, ' ', lName) as "Patient's Name", drugName as "Name of Drug", dosageDetails as "Recommended Dosage", concat(docFName, ' ', docLName) as "Prescribed By"
from patient join visit
on patient.patientID=visit.patientID
join doctor 
on visit.PPS=doctor.PPS
join prescription
on visit.visitID=prescription.visitID
join drug
on prescription.drugID=drug.drugID
group by drugName;


/* FAQ 7 Add a new patient */
insert into patient( fname, lname, street, town, county, contactNo, arriveDate, dischargeDate) values
(
'Billy', 'Powell', 'Monvoy', 'Tramore', 'Waterford', '051789567', now() , null
);

select *
from patient
where lname like "Powell"; /* Unsures new patient has been added */ 


/* FAQ 8 Assign a new patient to a bed in ward */
select bedNumber, wardName
from bed join ward
on bed.wardId=ward.wardId
where patientId is null; /*Shows which beds are free*/

update bed
set patientId= (select patientID from patient order by patientID desc limit 1)   /* Auto inserts new patient ID */
where bedNumber= 1022 ; /* Insert empty bed number */

select patientID
from bed
where bedNumber=1022; /*Check if the bed has been updated*/

/* FAQ 9 Assign a new patient to a doctor */
select * from visit;
select * from doctor;

insert into visit( patientID, PPS, visitDate) values
(
(select patientID from patient order by patientID desc limit 1), "12345678D", now()
);

select *
from visit;


/* FAQ 10 Prescribe a new drug to a patient */

select * from visit;
select * from drug;
insert prescription(visitID, drugID, dosageDetails) values
(
201904, 4711502, "Sustained-release: 80 mg orally once a day"
);

select * 
from prescription;

/* FAQ 11 Discharge a patient */

update patient
set dischargeDate = "2019-10-26"
where patientID = 002;

select *
from patient
where patientID like 002;

/* FAQ 12 Add a new doctor to staff */

insert into doctor(PPS, docFName, docLName, street, town, county, contactNo, hireDate, specialisation) values
(
'12345678D', 'Mary', 'Kelly', 'Main Street', 'Dungarvan', 'Waterford', '051323456', '2019-10-23', 'Radiology'
);

select *
from doctor;

/* FAQ 13 Change the specialisation of a current memeber of staff */
update doctor
set specialisation = 'Urology'
where PPS = "12345678D";

select *
from doctor
where docLName like "Kelly";



/* ------------Indexes------------*/

create index docName 
on doctor(docFname, docLname);

select *
from doctor;

show index from doctor;

alter table doctor drop index idx_docName;

create index idx_patName on 
patient(fname, lname);

show index from patient;


create index idx_addmissionDate 
on patient(arriveDate desc);

create index idx_wardName 
on ward(wardName);

/* -----Creation of users and granting of privilages------ */

create user headAdmin identified by 'head';

create user juniorAdmin identified by 'junior';

grant all on wat_hospital.* 
to headAdmin with grant option;

grant insert, update, select 
on ward 
to juniorAdmin;

grant insert, update, select, delete
on patient 
to juniorAdmin;

show grants for juniorAdmin;

revoke delete
on patient
from juniorAdmin;

grant insert, update, select 
on bed 
to juniorAdmin;

grant select on wat_hospital.* 
to juniorAdmin;


create user headPharm identified by 'headPharm';

grant insert, update, select, delete 
on drug 
to headPharm;

grant insert, update, select, delete 
on prescription 
to headPharm;

grant select on wat_hospital.* 
to headPharm;

show grants for headPharm;

select user, host from mysql.user;


/* ----------Triggers-----------*/
/* Two triggers below. The first tiggers the table dischargedPatient, this updates when the discharge
date in the patient table is updated.
The second trigger adds the old dosage details to the table dosage change when the dosage
is updated in the prescription table*/


create table dischargedPatient(
dischargeDate date Primary Key,
patientID int not null,
fname varChar(15),
lname varChar(15)
);

select *
from dischargedPatient;

Delimiter $$
	create trigger after_patient_discharged
    after update on patient
    for each row
begin
	insert into dischargedPatient
    set
    dischargeDate = now(),
    patientID = old.patientID,
    fname= old.fname,
    lname = old.lname;
end $$
delimiter ;

select *
from patient;

update patient
set dischargeDate = "2019-10-29"
where patientID = 003;

select *
from dischargedPatient;

Delimiter $$
	create trigger drug_dosage_history
    after update on prescription
    for each row
begin
	insert into dosage_change
    set
    visitID= old.visitID,
    drugID=old.visitID,
    dosageDetails=old.dosageDetails,
    changeDate=now(),
    action = 'changed';
end $$
delimiter ;

select *
from dosage_change;

select *
from prescription;

update prescription
set dosageDetails = "Take two every four hours with food and water"
where visitID = 201901;




