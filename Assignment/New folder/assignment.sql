## Step 1: Create a Database
-- Create a new database named HospitalDB.
-- create database HospitalDB;
use HospitalDB;

-- Step 2: Create Tables
-- Patients Table
create table patients(
Patient_ID int auto_increment primary key,
FirstName varchar(30),
LastName varchar(30),
DateOfBirth Date,
Gender varchar(30),
ContactNumber varchar(50),
Address text);
describe patients;

-- Doctors Table:
create Table Doctors( 
Doctor_ID int auto_increment primary key,
FirstName varchar(30),
LastName  varchar(30),
Specialization varchar(30),
ContactNumber varchar(30),
Email varchar(30));
describe Doctors;

-- Appoinments Table
create table Appointments(
AppointmentID integer auto_increment primary key,
Patient_ID int,
Doctor_ID int,
AppointmentDate date,
Diagnosis text,

    foreign key(Patient_ID)
    references Patients(Patient_ID)
     ON DELETE CASCADE
     ON UPDATE CASCADE,
     
    foreign key(Doctor_ID)
    references Doctors(Doctor_ID)
     ON DELETE CASCADE
     ON UPDATE CASCADE
);

describe Appointments;
## Task 2: Modifying the Tables with DDL Commands
-- Step 1: Add a Column
-- 1.Add a column named Email to the Patients table.
alter table Patients add column Email varchar(30);

-- Step 2: Modify the Data Type of a Column
-- 1.Change the datatype of the ContactNumber column in the Doctors table.
alter table Doctors modify column ContactNumber int;
-- Step 3: Drop a Column
-- 1.Remove the Address column from the Patients table.
alter table Patients drop column address;
-- Step 4: Add a Constraint
-- 1.Add a unique constraint to the Email column in the Doctors table.
alter table Doctors modify column Email varchar(30) unique;
-- Step 5: Drop a Constraint
-- 1.Remove the unique constraint from the Email column in the Doctors table.
alter table Doctors  drop constraint Email;
describe Doctors;
-- Step 6: Change the Column Name
-- 1.Rename the Diagnosis column to MedicalDiagnosis in the Appointments table.
alter table Appointments change column Diagnosis MedicalDiagnosis text;
describe Appointments;

## Task 3: Data Manipulation with DML Commands
-- Step 1: Insert Data
-- Insert sample data into the Patients, Doctors, and Appointments tables. (Random)

-- Patients Data
INSERT INTO Patients 
(FirstName, LastName, DateOfBirth, Gender, ContactNumber, email)
VALUES
('Rajesh', 'Sharma', '1990-05-14', 'Male', '9876543210', 'rj0608@gmail.com'),
('Anita', 'Patil', '1985-11-22', 'Female', '9123456780', 'ap@gamil.com'),
('Amit', 'Verma', '1998-02-10', 'Male', '9988776655', 'Av@gamil.com'),
('Sneha', 'Kulkarni', '1992-07-30', 'Female', '9090909090', 'sk@gmail.com'),
('Rahul', 'Mehta', '1988-01-05', 'Male', '9012345678', 'rm@gmail.com');
SELECT * FROM Patients;

-- Doctors Data
INSERT INTO Doctors
(FirstName, LastName, Specialization, ContactNumber, Email)
VALUES
('Amit', 'Sharma', 'Cardiologist', '9876543210', 'amit.sharma@hospital.com'),
('Neha', 'Patil', 'Dermatologist', '9123456789', 'neha.patil@hospital.com'),
('Rahul', 'Verma', 'Orthopedic', '9988776655', 'rahul.verma@hospital.com'),
('Sneha', 'Kulkarni', 'Pediatrician', '9090909090', 'sneha.k@hospital.com'),
('Vikram', 'Mehta', 'Neurologist', '9012345678', 'vikram.mehta@hospital.com');
alter table Doctors modify column ContactNumber varchar(20);
SELECT * FROM Doctors;
describe Doctors;

-- Appoinments Data
INSERT INTO Appointments
(Patient_ID, Doctor_ID, AppointmentDate, MedicalDiagnosis)
VALUES
(1, 1, '2025-01-10', 'High blood pressure'),
(2, 2, '2025-01-12', 'Skin allergy'),
(3, 3, '2025-01-15', 'Knee joint pain'),
(4, 4, '2025-01-18', 'Child fever and cold'),
(5, 5, '2025-01-20', 'Migraine headache');

select * from Appointments;

-- Step 2: Update Data
-- Update the specialization of a doctor in the Doctors table. (up to you)
update doctors 
set Specialization= 'Orthopedic'
where Doctor_id = 1;
select * from doctors;

-- Step 3: Delete Data
-- Delete a patient record from the Patients table.  (up to you)

delete from Patients where Patient_ID = 2;
select * from Patients;

-- Step 4: Select Data
-- Retrieve all data from the Patients, Doctors, and Appointments tables. (individually)
select * from patients;
select * from doctors;
select *  from Appointments;
