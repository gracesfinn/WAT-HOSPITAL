USE WAT_HOSPITAL;

desc patient;

desc doctor;

/* FAQ 1 List all patients in a certain ward - e.g. ER */
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
where docFName like 'Hurley';

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

select count(*) as 'Number of Patients', concat(docFName, ' ', docLName) as "Under the care of:"
from patient join visit
on patient.patientID=visit.patientID
join doctor 
on visit.PPS=doctor.PPS
group by docLName;

/* FAQ 7 Add a new patient */
insert into patient(patientID, fname, lname, street, town, county, contactNo, arriveDate, dischargeDate) values
(
004, 'William', 'Egan', 'Monvoy', 'Tramore', 'Waterford', '051789567', '2019-10-20', null
);

select *
from ward;

select *
from bed;

/* FAQ 8 Assign a new patient to a bed in ward */
insert into bed(bedNumber, bedType, wardID, patientID) values
(
12, "standard", 101, 004
);

select *
from visit;

select *
from doctor;

/* FAQ 8 Assign a new patient to a doctor */

insert into visit(visitID, patientID, PPS, visitDate) values
(
201904, 004, "34567891C", '2019-10-22'
);

select *
from patient
where patientID like 004;

/* FAQ 8 Prescribe a new drug to a patient */

insert prescription(visitID, drugID, dosageDetails) values
(
201904, 4711502, "Sustained-release: 80 mg orally once a day"
);

select * 
from prescription;

/* FAQ 9 Discharge a patient */

