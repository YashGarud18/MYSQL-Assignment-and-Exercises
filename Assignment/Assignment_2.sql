-- ---------------------------------------------------------Assignment-2 ----------------------------------------------------
/*                          |            Implement Healthcare System Using Database from Scratch           |                 
							-------------------------------------------------------------------------------
                                             - Name your database Healthcare_System.
                                             - Design 10 Tables with Attributes:
                                             - Each table must have at least 5 attributes with appropriate data types.
                                             - Include 10 records in each table.                                             */
-- ----------------------------------------------------------------------------------------------------------------------------

-- Create a database
create database if not exists Healthcare_System;

-- using the database
use Healthcare_System;


-- create 10 tables.

-- 1. Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15)
);

-- Insert Data 
INSERT INTO Patients (Name, Age, Gender, ContactNumber) VALUES
('John Doe', 30, 'Male', '1234567890'),
('Jane Smith', 25, 'Female', '2345678901'),
('Michael Johnson', 40, 'Male', '3456789012'),
('Emily Davis', 35, 'Female', '4567890123'),
('David Wilson', 50, 'Male', '5678901234'),
('Sophia Martinez', 28, 'Female', '6789012345'),
('James Anderson', 60, 'Male', '7890123456'),
('Olivia Thomas', 22, 'Female', '8901234567'),
('William Taylor', 45, 'Male', '9012345678'),
('Ava White', 55, 'Female', '1234509876');

-- show complete table
SELECT * FROM patients;

-- Truncate Querie
truncate patients;

-- drop tQuerie
drop table patients;


-- 2. Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Specialty VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Insert Data 
INSERT INTO Doctors (Name, Specialty, PhoneNumber, Email) VALUES
('Dr. Smith', 'Cardiologist', '1112223333', 'dr.smith@email.com'),
('Dr. Johnson', 'Dermatologist', '2223334444', 'dr.johnson@email.com'),
('Dr. Brown', 'Neurologist', '3334445555', 'dr.brown@email.com'),
('Dr. Wilson', 'Orthopedic', '4445556666', 'dr.wilson@email.com'),
('Dr. Garcia', 'Pediatrician', '5556667777', 'dr.garcia@email.com'),
('Dr. Martinez', 'Oncologist', '6667778888', 'dr.martinez@email.com'),
('Dr. Anderson', 'General Physician', '7778889999', 'dr.anderson@email.com'),
('Dr. Thomas', 'Surgeon', '8889990000', 'dr.thomas@email.com'),
('Dr. Taylor', 'Psychiatrist', '9990001111', 'dr.taylor@email.com'),
('Dr. White', 'ENT Specialist', '0001112222', 'dr.white@email.com');

-- show complete table
SELECT * FROM Doctors;

-- Truncate Querie
TRUNCATE Doctors;

-- drop tQuerie
DROP TABLE Doctors;


-- 3. Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Insert Data 
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, '2025-02-10', 'Scheduled'),
(2, 2, '2025-02-11', 'Completed'),
(3, 3, '2025-02-12', 'Canceled'),
(4, 4, '2025-02-13', 'Scheduled'),
(5, 5, '2025-02-14', 'Completed'),
(6, 6, '2025-02-15', 'Scheduled'),
(7, 7, '2025-02-16', 'Completed'),
(8, 8, '2025-02-17', 'Scheduled'),
(9, 9, '2025-02-18', 'Canceled'),
(10, 10, '2025-02-19', 'Scheduled');

-- show complete table
SELECT * FROM Appointments;

-- Truncate Querie
TRUNCATE Appointments;

-- drop tQuerie
DROP TABLE Appointments;


-- 4. MedicalRecords Table
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    DateRecorded DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Insert Data 
INSERT INTO MedicalRecords (PatientID, Diagnosis, Treatment, DateRecorded) VALUES
(1, 'Hypertension', 'Medication', '2025-01-10'),
(2, 'Skin Allergy', 'Ointment', '2025-01-11'),
(3, 'Migraine', 'Painkillers', '2025-01-12'),
(4, 'Fracture', 'Plaster', '2025-01-13'),
(5, 'Flu', 'Rest & Fluids', '2025-01-14'),
(6, 'Cancer', 'Chemotherapy', '2025-01-15'),
(7, 'Diabetes', 'Insulin', '2025-01-16'),
(8, 'Appendicitis', 'Surgery', '2025-01-17'),
(9, 'Depression', 'Therapy', '2025-01-18'),
(10, 'Hearing Loss', 'Hearing Aid', '2025-01-19');

-- show complete table
SELECT * FROM MedicalRecords;

-- Truncate Querie
TRUNCATE MedicalRecords;

-- drop tQuerie
DROP TABLE MedicalRecords;


-- 5. Billing Table
CREATE TABLE Billing (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    TotalAmount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    BillingDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Insert Data 
INSERT INTO Billing (PatientID, TotalAmount, PaymentStatus, BillingDate) VALUES
(1, 500.00, 'Paid', '2025-01-10'),
(2, 300.50, 'Pending', '2025-01-11'),
(3, 750.75, 'Paid', '2025-01-12'),
(4, 200.25, 'Pending', '2025-01-13'),
(5, 100.00, 'Paid', '2025-01-14'),
(6, 1200.00, 'Pending', '2025-01-15'),
(7, 350.99, 'Paid', '2025-01-16'),
(8, 950.00, 'Pending', '2025-01-17'),
(9, 400.00, 'Paid', '2025-01-18'),
(10, 600.75, 'Pending', '2025-01-19');

-- show complete table
SELECT * FROM Billing;

-- Truncate Querie
TRUNCATE Billing;

-- drop tQuerie
DROP TABLE Billing;


-- 6. Nurses Table
CREATE TABLE Nurses (
    NurseID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Department VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Shift VARCHAR(20)
);

-- Insert Data 
INSERT INTO Nurses (Name, Department, PhoneNumber, Shift) VALUES
('Nurse Anna', 'Cardiology', '1111111111', 'Day'),
('Nurse Bella', 'Dermatology', '2222222222', 'Night'),
('Nurse Charlie', 'Neurology', '3333333333', 'Day'),
('Nurse Daniel', 'Orthopedic', '4444444444', 'Night'),
('Nurse Ella', 'Pediatrics', '5555555555', 'Day'),
('Nurse Fiona', 'Oncology', '6666666666', 'Night'),
('Nurse George', 'General', '7777777777', 'Day'),
('Nurse Hannah', 'Surgery', '8888888888', 'Night'),
('Nurse Ian', 'Psychiatry', '9999999999', 'Day'),
('Nurse Julia', 'ENT', '0000000000', 'Night');

-- show complete table
SELECT * FROM Nurses;

-- Truncate Querie
TRUNCATE Nurses;

-- drop tQuerie
DROP TABLE Nurses;


-- 7. Rooms Table
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber VARCHAR(10),
    Type VARCHAR(50),
    Status VARCHAR(20),
    ChargesPerDay DECIMAL(10,2)
);

-- Insert Data 
INSERT INTO Rooms (RoomNumber, Type, Status, ChargesPerDay) VALUES
('101', 'ICU', 'Occupied', 500.00),
('102', 'General', 'Available', 100.00),
('103', 'Private', 'Occupied', 300.00),
('104', 'VIP', 'Available', 800.00),
('105', 'ICU', 'Occupied', 500.00),
('106', 'General', 'Available', 100.00),
('107', 'Private', 'Occupied', 300.00),
('108', 'VIP', 'Available', 800.00),
('109', 'ICU', 'Occupied', 500.00),
('110', 'General', 'Available', 100.00);

-- show complete table
SELECT * FROM Rooms;

-- Truncate Querie
TRUNCATE Rooms;

-- drop tQuerie
DROP TABLE Rooms;


-- 8. Prescriptions Table
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    Medication VARCHAR(255),
    Dosage VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Insert Data 
INSERT INTO Prescriptions (PatientID, DoctorID, Medication, Dosage) VALUES
(1, 1, 'Aspirin', '1 tablet daily'),
(2, 2, 'Cetirizine', '1 tablet at night'),
(3, 3, 'Ibuprofen', '2 tablets daily'),
(4, 4, 'Calcium', '1 tablet daily'),
(5, 5, 'Paracetamol', '1 tablet every 6 hours'),
(6, 6, 'Insulin', '10 units daily'),
(7, 7, 'Metformin', '2 tablets daily'),
(8, 8, 'Antibiotic', '1 capsule every 8 hours'),
(9, 9, 'Vitamin D', '1 tablet daily'),
(10, 10, 'Antidepressant', '1 tablet in the morning');

-- show complete table
SELECT * FROM Prescriptions;

-- Truncate Querie
TRUNCATE Prescriptions;

-- drop tQuerie
DROP TABLE Prescriptions;


-- 9. Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Department VARCHAR(50),
    ContactNumber VARCHAR(15)
);

-- Insert Data
INSERT INTO Staff (Name, Role, Department, ContactNumber) VALUES
('Alice Brown', 'Receptionist', 'Front Desk', '1231231234'),
('Bob Green', 'Technician', 'Radiology', '2342342345'),
('Charlie Black', 'Lab Assistant', 'Pathology', '3453453456'),
('Diana White', 'Pharmacist', 'Pharmacy', '4564564567'),
('Ethan King', 'Security', 'Security', '5675675678'),
('Fiona Adams', 'Accountant', 'Billing', '6786786789'),
('George Hall', 'Cleaner', 'Maintenance', '7897897890'),
('Hannah Scott', 'HR Manager', 'HR', '8908908901'),
('Ian Clark', 'Admin', 'Administration', '9019019012'),
('Julia Lewis', 'IT Support', 'IT', '1239876543');

-- show complete table
SELECT * FROM Staff;

-- Truncate Querie
TRUNCATE Staff;

-- drop tQuerie
DROP TABLE Staff;


-- 10. Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    ContactPerson VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT
);

-- Insert Data 
INSERT INTO Suppliers (Name, ContactPerson, PhoneNumber, Email, Address) VALUES
('MediSupplies', 'Tom Reed', '5551234567', 'tom@medisupplies.com', '123 Main St'),
('HealthEquip', 'Linda Ray', '5552345678', 'linda@healthequip.com', '456 Park Ave'),
('PharmaGoods', 'Kevin Lee', '5553456789', 'kevin@pharmagoods.com', '789 Elm St'),
('ThumsMedicin', 'Om desai', '2254456789', 'om@pharma.com', '002 Ginger St'),
('Agorigoods', 'Alix brat', '54879456789', 'alix@goods.com', 'Near OldMonk shop');

-- show complete table
SELECT * FROM Suppliers;

-- Truncate Querie
TRUNCATE Suppliers;

-- drop tQuerie
DROP TABLE Suppliers;



#--------------- Queries --------------#
-- Alter Queries
-- 1. Add a new column
ALTER TABLE patients
ADD COLUMN Age int;

-- 2. Change datatype of specific column
alter table suppliers
modify Address varchar(100);

-- 3. Add unique constraint
ALTER TABLE suppliers
ADD CONSTRAINT email unique (Email);


-- update Queries
-- 1.Update specifc column
update patients
set age = 18
where patientId in (2,4);

-- 2.update Dosage
update Prescriptions
set Dosage = 'after 1hr in night'
where patientID = 5;


-- Rename queries
