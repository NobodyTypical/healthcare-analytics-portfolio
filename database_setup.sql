-- ==============================================================================
-- NEMS Clinical Analytics Portfolio - Database Setup Script
-- ==============================================================================

-- 1. DROP EXISTING TABLES
DROP TABLE IF EXISTS lab_results;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS doctors;

-- ==============================================================================
-- 2. CREATE TABLES
-- ==============================================================================

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    specialty VARCHAR(50),
    fte_percentage INT
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    dob DATE,
    gender VARCHAR(1),
    insurance VARCHAR(50),
    pcp_id INT,
    FOREIGN KEY (pcp_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE appointments (
    appt_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATE,
    status VARCHAR(20),
    visit_type VARCHAR(20),
    diagnosis_code VARCHAR(10),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE lab_results (
    lab_id INT PRIMARY KEY,
    patient_id INT,
    date DATE,
    test_name VARCHAR(50),
    result FLOAT,
    normal_range VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- ==============================================================================
-- 3. INSERT DATA
-- ==============================================================================

-- Insert Doctors
INSERT INTO doctors (doctor_id, name, department, specialty, fte_percentage) VALUES
(201, 'Dr. Green', 'Cardiology', 'Adult Cardio', 100),
(202, 'Dr. White', 'Oncology', 'Radiation Onc', 80),
(203, 'Dr. Black', 'Neurology', 'Neuro Specialist', 90),
(204, 'Dr. Blue', 'Pediatrics', 'Pediatric Care', 100),
(205, 'Dr. Red', 'Cardiology', 'Interventional Cardio', 70),
(206, 'Dr. Yellow', 'Oncology', 'Medical Onc', 85),
(207, 'Dr. Purple', 'Neurology', 'Neuro Specialist', 95),
(208, 'Dr. Orange', 'Pediatrics', 'Pediatric Care', 100),
(209, 'Dr. Brown', 'Dermatology', 'Dermatology', 60),
(210, 'Dr. Gray', 'General Med', 'Primary Care', 100);

-- Insert Patients
INSERT INTO patients (patient_id, name, dob, gender, insurance, pcp_id) VALUES
(1, 'John Doe', '1991-05-14', 'M', 'Medicare', 210), (2, 'Jane Smith', '1974-08-22', 'F', 'Private', 210),
(3, 'Bob Brown', '1982-11-03', 'M', 'Medicaid', 210), (4, 'Alice Green', '1997-02-15', 'F', 'Private', 210),
(5, 'Mike Johnson', '1966-07-08', 'M', 'Medicare', 210), (6, 'Emma Wilson', '1986-09-12', 'F', 'Private', 210),
(7, 'David Lee', '1971-12-01', 'M', 'Medicaid', 210), (8, 'Olivia Davis', '1993-04-18', 'F', 'Private', 210),
(9, 'Chris Martin', '1979-06-25', 'M', 'Medicare', 210), (10, 'Sophia Clark', '1988-03-30', 'F', 'Private', 208),
(11, 'Daniel Hall', '1976-10-14', 'M', 'Medicare', 210), (12, 'Grace Allen', '1998-01-05', 'F', 'Private', 210),
(13, 'Ethan Young', '1984-05-19', 'M', 'Medicaid', 210), (14, 'Lily King', '1990-08-27', 'F', 'Private', 210),
(15, 'Jacob Wright', '1965-02-11', 'M', 'Medicare', 210), (16, 'Mia Scott', '1987-11-22', 'F', 'Private', 210),
(17, 'Ryan Adams', '1981-07-04', 'M', 'Medicaid', 210), (18, 'Ava Baker', '1992-09-16', 'F', 'Private', 210),
(19, 'Nathan Perez', '1978-12-29', 'M', 'Medicare', 210), (20, 'Chloe Rivera', '1995-03-08', 'F', 'Private', 210),
(21, 'Samuel Price', '1973-06-15', 'M', 'Medicaid', 210), (22, 'Zoe Rogers', '2000-01-20', 'F', 'Private', 210),
(23, 'Luke Patterson', '1989-10-02', 'M', 'Medicare', 210), (24, 'Ella Cooper', '1985-04-12', 'F', 'Private', 210),
(25, 'Benjamin Reed', '1970-08-05', 'M', 'Medicaid', 210), (26, 'Hannah Bailey', '1996-11-17', 'F', 'Private', 210),
(27, 'Logan Kelly', '1977-02-28', 'M', 'Medicare', 210), (28, 'Scarlett Morgan', '1991-07-09', 'F', 'Private', 210),
(29, 'Jack Howard', '1983-09-21', 'M', 'Medicaid', 210), (30, 'Victoria Ward', '1994-12-04', 'F', 'Private', 208),
(31, 'Dylan Cox', '1980-03-15', 'M', 'Medicare', 210), (32, 'Natalie Diaz', '1999-06-26', 'F', 'Private', 210),
(33, 'Aaron Foster', '1972-10-08', 'M', 'Medicaid', 210), (34, 'Leah Graham', '1993-01-19', 'F', 'Private', 210),
(35, 'Christian James', '1968-05-30', 'M', 'Medicare', 210), (36, 'Madison Bell', '1997-08-11', 'F', 'Private', 210),
(37, 'Isaac Torres', '1975-11-24', 'M', 'Medicaid', 210), (38, 'Ruby Kelly', '1990-02-06', 'F', 'Private', 210),
(39, 'Anthony Simmons', '1981-07-18', 'M', 'Medicare', 210), (40, 'Isabella Long', '1987-09-29', 'F', 'Private', 208),
(41, 'Gabriel Hughes', '1979-12-10', 'M', 'Medicaid', 210), (42, 'Layla Price', '1998-04-23', 'F', 'Private', 210),
(43, 'Matthew Cox', '1976-06-03', 'M', 'Medicare', 210), (44, 'Aria Flores', '1995-10-15', 'F', 'Private', 210),
(45, 'Nathaniel Wood', '1971-01-27', 'M', 'Medicaid', 210), (46, 'Chloe Gray', '1993-05-09', 'F', 'Private', 210),
(47, 'Caleb Bennett', '1982-08-20', 'M', 'Medicare', 210), (48, 'Nora Sanders', '1991-11-01', 'F', 'Private', 210),
(49, 'Christian Russell', '1974-03-14', 'M', 'Medicaid', 210), (50, 'Zoe Coleman', '1996-06-25', 'F', 'Private', 210);

-- Insert Appointments
INSERT INTO appointments (appt_id, patient_id, doctor_id, date, status, visit_type, diagnosis_code) VALUES
(101, 1, 201, '2026-01-02', 'Show', 'New', 'I10'), (102, 2, 202, '2026-01-03', 'No-Show', 'Follow-up', 'C50'),
(103, 3, 203, '2026-01-04', 'Show', 'New', 'G43'), (104, 4, 205, '2026-01-05', 'Show', 'Follow-up', 'I10'),
(105, 5, 206, '2026-01-06', 'No-Show', 'New', 'C34'), (106, 6, 204, '2026-01-07', 'Show', 'New', 'Z00.129'),
(107, 7, 207, '2026-01-08', 'No-Show', 'Follow-up', 'G20'), (108, 8, 201, '2026-01-09', 'Show', 'New', 'I50.9'),
(109, 9, 202, '2026-01-10', 'Show', 'New', 'C18'), (110, 10, 208, '2026-01-11', 'No-Show', 'Follow-up', 'J45'),
(111, 1, 205, '2026-01-12', 'Show', 'Follow-up', 'I10'), (112, 11, 206, '2026-01-13', 'No-Show', 'New', 'C61'),
(113, 12, 203, '2026-01-14', 'Show', 'New', 'G35'), (114, 13, 201, '2026-01-15', 'Show', 'Follow-up', 'I11.9'),
(115, 14, 204, '2026-01-16', 'No-Show', 'New', 'Z00.129'), (116, 15, 202, '2026-01-17', 'Show', 'Follow-up', 'C50'),
(117, 16, 205, '2026-01-18', 'Show', 'New', 'I10'), (118, 17, 207, '2026-01-19', 'No-Show', 'Follow-up', 'G40.9'),
(119, 18, 208, '2026-01-20', 'Show', 'New', 'J45'), (120, 19, 201, '2026-01-21', 'Show', 'Follow-up', 'I50.9'),
(121, 20, 209, '2026-01-22', 'Show', 'New', 'L40.0'), (122, 21, 210, '2026-01-23', 'Show', 'New', 'E11.9'),
(123, 22, 204, '2026-01-24', 'No-Show', 'Follow-up', 'Z00.129'), (124, 23, 202, '2026-01-25', 'Show', 'New', 'C34'),
(125, 24, 206, '2026-01-26', 'Show', 'Follow-up', 'C18'), (126, 25, 203, '2026-01-27', 'Show', 'New', 'G43'),
(127, 26, 209, '2026-01-28', 'No-Show', 'New', 'L70.0'), (128, 27, 210, '2026-01-29', 'Show', 'Follow-up', 'E11.9'),
(129, 28, 205, '2026-01-30', 'Show', 'New', 'I10'), (130, 29, 201, '2026-01-31', 'No-Show', 'Follow-up', 'I50.9'),
(131, 30, 208, '2026-02-01', 'Show', 'New', 'J01.90'), (132, 31, 207, '2026-02-02', 'Show', 'Follow-up', 'G20'),
(133, 32, 202, '2026-02-03', 'No-Show', 'New', 'C50'), (134, 33, 210, '2026-02-04', 'Show', 'New', 'I10'),
(135, 34, 209, '2026-02-05', 'Show', 'Follow-up', 'L40.0'), (136, 35, 201, '2026-02-06', 'Show', 'New', 'I11.9'),
(137, 36, 204, '2026-02-07', 'Show', 'New', 'Z00.129'), (138, 37, 203, '2026-02-08', 'No-Show', 'Follow-up', 'G35'),
(139, 38, 206, '2026-02-09', 'Show', 'Follow-up', 'C61'), (140, 39, 205, '2026-02-10', 'Show', 'New', 'I10'),
(141, 40, 208, '2026-02-11', 'No-Show', 'Follow-up', 'J45'), (142, 41, 210, '2026-02-12', 'Show', 'New', 'E11.9'),
(143, 42, 209, '2026-02-13', 'Show', 'New', 'L70.0'), (144, 43, 201, '2026-02-14', 'Show', 'Follow-up', 'I50.9'),
(145, 44, 204, '2026-02-15', 'Show', 'New', 'Z00.129'), (146, 45, 203, '2026-02-16', 'No-Show', 'New', 'G40.9'),
(147, 46, 202, '2026-02-17', 'Show', 'Follow-up', 'C18'), (148, 47, 205, '2026-02-18', 'Show', 'New', 'I10'),
(149, 48, 208, '2026-02-19', 'No-Show', 'Follow-up', 'J01.90'), (150, 49, 210, '2026-02-20', 'Show', 'New', 'E11.9'),
(151, 50, 201, '2026-02-21', 'Show', 'Follow-up', 'I11.9'), (152, 1, 201, '2026-02-22', 'Show', 'Follow-up', 'I10'),
(153, 5, 206, '2026-02-23', 'Show', 'Follow-up', 'C34'), (154, 10, 208, '2026-02-24', 'Show', 'New', 'J45'),
(155, 15, 202, '2026-02-25', 'Show', 'New', 'C50'), (156, 20, 209, '2026-02-26', 'No-Show', 'Follow-up', 'L40.0'),
(157, 25, 203, '2026-02-27', 'Show', 'Follow-up', 'G43'), (158, 30, 208, '2026-02-28', 'Show', 'Follow-up', 'J01.90'),
(159, 35, 201, '2026-03-01', 'Show', 'Follow-up', 'I11.9'), (160, 40, 208, '2026-03-02', 'Show', 'New', 'J45');

-- Insert Lab Results
INSERT INTO lab_results (lab_id, patient_id, date, test_name, result, normal_range) VALUES
(301, 1, '2026-01-02', 'Cholesterol', 210, '125-200'), (302, 2, '2026-01-03', 'Hemoglobin', 13.5, '12-16'),
(303, 3, '2026-01-04', 'Blood Glucose', 95, '70-99'), (304, 4, '2026-01-05', 'Cholesterol', 180, '125-200'),
(305, 5, '2026-01-06', 'Hemoglobin', 11.5, '12-16'), (306, 6, '2026-01-07', 'Blood Glucose', 102, '70-99'),
(307, 7, '2026-01-08', 'Cholesterol', 220, '125-200'), (308, 8, '2026-01-09', 'Hemoglobin', 14, '12-16'),
(309, 9, '2026-01-10', 'Blood Glucose', 89, '70-99'), (310, 10, '2026-01-11', 'Cholesterol', 195, '125-200'),
(311, 11, '2026-01-12', 'Hemoglobin', 12.5, '12-16'), (312, 12, '2026-01-13', 'Blood Glucose', 100, '70-99'),
(313, 13, '2026-01-14', 'Cholesterol', 185, '125-200'), (314, 14, '2026-01-15', 'Hemoglobin', 13, '12-16'),
(315, 15, '2026-01-16', 'Blood Glucose', 110, '70-99'), (316, 16, '2026-01-17', 'Cholesterol', 205, '125-200'),
(317, 17, '2026-01-18', 'Hemoglobin', 14.2, '12-16'), (318, 18, '2026-01-19', 'Blood Glucose', 92, '70-99'),
(319, 19, '2026-01-20', 'Cholesterol', 175, '125-200'), (320, 20, '2026-01-21', 'Hemoglobin', 12.1, '12-16'),
(321, 21, '2026-01-22', 'Blood Glucose', 105, '70-99'), (322, 22, '2026-01-23', 'Cholesterol', 190, '125-200'),
(323, 23, '2026-01-24', 'Hemoglobin', 13.8, '12-16'), (324, 24, '2026-01-25', 'Blood Glucose', 85, '70-99'),
(325, 25, '2026-01-26', 'Cholesterol', 230, '125-200'), (326, 26, '2026-01-27', 'Hemoglobin', 14.5, '12-16'),
(327, 27, '2026-01-28', 'Blood Glucose', 98, '70-99'), (328, 28, '2026-01-29', 'Cholesterol', 198, '125-200'),
(329, 29, '2026-01-30', 'Hemoglobin', 11.2, '12-16'), (330, 30, '2026-01-31', 'Blood Glucose', 101, '70-99'),
(331, 31, '2026-02-01', 'Cholesterol', 215, '125-200'), (332, 32, '2026-02-02', 'Hemoglobin', 13.1, '12-16'),
(333, 33, '2026-02-03', 'Blood Glucose', 90, '70-99'), (334, 34, '2026-02-04', 'Cholesterol', 182, '125-200'),
(335, 35, '2026-02-05', 'Hemoglobin', 12.8, '12-16'), (336, 36, '2026-02-06', 'Blood Glucose', 115, '70-99'),
(337, 37, '2026-02-07', 'Cholesterol', 240, '125-200'), (338, 38, '2026-02-08', 'Hemoglobin', 14.9, '12-16'),
(339, 39, '2026-02-09', 'Blood Glucose', 88, '70-99'), (340, 40, '2026-02-10', 'Cholesterol', 202, '125-200'),
(341, 41, '2026-02-11', 'Hemoglobin', 13.3, '12-16'), (342, 42, '2026-02-12', 'Blood Glucose', 96, '70-99'),
(343, 43, '2026-02-13', 'Cholesterol', 178, '125-200'), (344, 44, '2026-02-14', 'Hemoglobin', 12.4, '12-16'),
(345, 45, '2026-02-15', 'Blood Glucose', 108, '70-99'), (346, 46, '2026-02-16', 'Cholesterol', 192, '125-200'),
(347, 47, '2026-02-17', 'Hemoglobin', 14.1, '12-16'), (348, 48, '2026-02-18', 'Blood Glucose', 94, '70-99'),
(349, 49, '2026-02-19', 'Cholesterol', 225, '125-200'), (350, 50, '2026-02-20', 'Hemoglobin', 13.9, '12-16');
