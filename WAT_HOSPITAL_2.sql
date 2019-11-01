USE WAT_HOSPITAL; 

desc patient;

desc doctor;

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

/* FAQ 3 Show the names of all patients under a certain doctors care */

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

select concat(docFName, ' ', docLName) as "Doctor's Name", concat(fName, ' ', lName) as "Patient's Name",  wardName as "Ward", bedNumber as "Bed Number"
from ward join bed
on ward.wardID=bed.wardID
join patient 
on patient.patientID=bed.patientID
join visit
on patient.patientId=visit.patientId
join doctor
on visit.PPS=doctor.PPS
where docLname like "Duggan";

select * from visit order by pps;
select * from doctor;
select * from patient;

update doctor
set PPS = "47362818F"
where docLName = "Fine";

select *
from visit;
select *
from doctor;
select *
from patient;

/* FAQ 4 Show the number of current patients on each ward */

select count(*) as 'Number of Patients', wardName as "Name of Ward", wardType as "Department"
from patient join bed
on patient.patientID=bed.patientID
join ward
on ward.wardID=bed.wardID
where dischargeDate is null
group by wardName;

/* FAQ 5 Show the list of drug precriptions for each patients */

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

/* FAQ 6 Show the number patients assigned to each doctor */




/* FAQ 7 Add a new patient */
insert into patient(patientID, fname, lname, street, town, county, contactNo, arriveDate, dischargeDate) values
(
21, 'William', 'Egan', 'Monvoy', 'Tramore', 'Waterford', '051789567', '2019-10-20', null
);

select *
from ward;

select *
from bed;
select *
from patient;

/* FAQ 8 Assign a new patient to a bed in ward */
update bed
set patientId= 18
where bedNumber=2025;

select *
from visit;

select *
from doctor;

select * from patient;


/* FAQ 8 Assign a new patient to a doctor */

insert into visit(visitID, patientID, PPS, visitDate) values
(
201905, 8, "74836273E", '2019-10-'
);

insert into visit(visitID, patientID, PPS, visitDate) values
(
201906, 18, "12345678A", '2019-10-20'
);

insert into visit(visitID, patientID, PPS, visitDate) values
(
201907, 6, "12345678A", '2019-10-06'
);

insert into visit(visitID, patientID, PPS, visitDate) values
(
201910, 16, "34567891C", '2019-10-20'
),
(
201908, 12, "34567891C", '2019-10-05'
),
(
201909, 20, "34567891C", '2019-10-20'
);

insert into visit(visitID, patientID, PPS, visitDate) values
(
201911, 9, "23456789B", '2019-10-02'
),
(
201912, 13, "23456789B", '2019-10-10'
),
(
201913, 12, "23456789B", '2019-10-05'
),
(
201914, 11, "23456789B", '2019-10-12'
);

insert into visit(visitID, patientID, PPS, visitDate) values
(
201911, 9, "23456789B", '2019-10-02'
),
(
201912, 13, "23456789B", '2019-10-10'
),
(
201913, 12, "23456789B", '2019-10-05'
),
(
201914, 11, "23456789B", '2019-10-12'
);

insert into visit(visitID, patientID, PPS, visitDate) values
(
201915, 10, "74836273E", '2019-10-05'
),
(
201916, 14, "74836273E", '2019-10-20'
),
(
201917, 15, "74836273E", '2019-10-20'
),
(
201918, 19, "74836273E", '2019-10-20'
);

insert into visit(visitID, patientID, PPS, visitDate) values
(
201919, 5, "47362818F", '2019-10-05'
),
(
201920, 7, "47362818F", '2019-10-10'
),

(
201922, 17, "12345678D", '2019-10-20'
);


select * from visit order by patientId;

delete from visit 
where visitId= 201908;

select *
from patient;
select *
from doctor;

/* FAQ 8 Prescribe a new drug to a patient */

insert prescription(visitID, drugID, dosageDetails) values
(
201904, 4711502, "Sustained-release: 80 mg orally once a day"
);

select * 
from prescription;

/* FAQ 9 Discharge a patient */
update patient
set dischargeDate = "2019-10-26"
where patientID = 002;

select *
from patient
where patientID like 003;

/* FAQ 10 Add a new doctor to staff */

insert into doctor(PPS, docFName, docLName, street, town, county, contactNo, hireDate, specialisation) values
(
'12345678D', 'Mary', 'Kelly', 'Main Street', 'Dungarvan', 'Waterford', '051323456', '2019-10-23', 'Radiology'
);

select *
from doctor;

/* FAQ 11 Change the specialisation of a current memeber of staff */
update doctor
set specialisation = 'Urology'
where PPS = "12345678D";

select *
from doctor
where docLName like "Kelly";



/* ------------Indexes------------*/

create index docName 
on doctor(docFname, docLname);

show index from doctor;

alter table doctor drop index docName;

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
is updated in teh prescription table*/


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

select *
from patient;

update patient
set dischargeDate = "2019-10-26"
where patientID = 002;

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

select *
from dosage_change;

select *
from prescription;

update prescription
set dosageDetails = "Take two every four hours with food and water"
where visitID = 201901;




