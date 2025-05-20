-- create database
CREATE DATABASE StudentsRecords;

-- use database 
USE StudentsRecords;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Departments;


-- 1. Departments Table

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    department_head VARCHAR(100) NOT NULL
);


-- 2. Courses Table

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    credits INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);


-- 3. Students Table

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE
);


-- 4. Enrollments Table

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    UNIQUE(student_id, course_id)
);


-- 5. Grades Table

CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    grade_value CHAR(1) NOT NULL CHECK (grade_value IN ('A', 'B', 'C', 'D', 'E', 'F')),
    grade_date DATE NOT NULL,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);


-- Insert Sample Data into tables

-- Departments
INSERT INTO Departments (department_name, department_head) VALUES
('Computer Science', 'Dr. Moses Otieno'),
('Mathematics', 'Dr. Mary Wanjiru'),
('Engineering', 'Prof. John Njoroge'),
('Business', 'Dr. Grace Achieng'),
('Education', 'Prof. Samuel Mwangi'),
('Arts', 'Dr. Lillian Muthoni'),
('Health Sciences', 'Dr. Peter Ouma');

-- Courses
INSERT INTO Courses (course_name, course_code, credits, department_id) VALUES
('Introduction to Programming', 'CS101', 3, 1),
('Calculus I', 'MTH102', 4, 2),
('Mechanical Systems', 'ENG205', 3, 3),
('Principles of Marketing', 'BUS210', 3, 4),
('Curriculum Development', 'EDU115', 2, 5),
('Creative Writing', 'ART220', 3, 6),
('Anatomy & Physiology', 'HSC101', 4, 7),
('Database Systems', 'CS202', 3, 1),
('Statistics', 'MTH202', 3, 2);

-- Students
INSERT INTO Students (first_name, last_name, gender, date_of_birth, email, phone_number) VALUES
('Brian', 'Odhiambo', 'Male', '2000-03-12', 'brian.odhiambo@example.com', '+254712345001'),
('Faith', 'Wambui', 'Female', '1999-07-25', 'faith.wambui@example.com', '+254712345002'),
('Kevin', 'Mutiso', 'Male', '2001-01-05', 'kevin.mutiso@example.com', '+254712345003'),
('Alice', 'Njoki', 'Female', '2002-11-18', 'alice.njoki@example.com', '+254712345004'),
('James', 'Mwangi', 'Male', '2000-05-22', 'james.mwangi@example.com', '+254712345005'),
('Mercy', 'Atieno', 'Female', '1999-08-09', 'mercy.atieno@example.com', '+254712345006'),
('John', 'Kamau', 'Male', '2001-06-30', 'john.kamau@example.com', '+254712345007'),
('Cynthia', 'Chebet', 'Female', '2000-04-14', 'cynthia.chebet@example.com', '+254712345008'),
('Eric', 'Njuguna', 'Male', '2002-02-17', 'eric.njuguna@example.com', '+254712345009'),
('Beatrice', 'Wanjiku', 'Female', '2001-12-01', 'beatrice.wanjiku@example.com', '+254712345010'),
('Victor', 'Omollo', 'Male', '2003-01-29', 'victor.omollo@example.com', '+254712345011'),
('Janet', 'Akinyi', 'Female', '2002-10-11', 'janet.akinyi@example.com', '+254712345012'),
('Daniel', 'Kiptoo', 'Male', '2000-09-04', 'daniel.kiptoo@example.com', '+254712345013'),
('Diana', 'Wairimu', 'Female', '1999-11-30', 'diana.wairimu@example.com', '+254712345014'),
('Stephen', 'Otieno', 'Male', '2001-03-21', 'stephen.otieno@example.com', '+254712345015');

-- Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-01-10'),
(1, 8, '2023-01-10'),
(2, 2, '2023-01-12'),
(3, 3, '2023-01-15'),
(4, 1, '2023-01-17'),
(5, 4, '2023-01-19'),
(6, 5, '2023-01-20'),
(7, 6, '2023-01-22'),
(8, 7, '2023-01-25'),
(9, 9, '2023-01-27'),
(10, 1, '2023-02-01'),
(11, 2, '2023-02-02'),
(12, 3, '2023-02-04'),
(13, 4, '2023-02-05'),
(14, 5, '2023-02-06'),
(15, 6, '2023-02-07');

-- Grades
INSERT INTO Grades (enrollment_id, grade_value, grade_date) VALUES
(1, 'A', '2023-05-15'),
(2, 'B', '2023-05-15'),
(3, 'A', '2023-05-20'),
(4, 'C', '2023-05-22'),
(5, 'B', '2023-05-25'),
(6, 'A', '2023-05-28'),
(7, 'D', '2023-06-01'),
(8, 'B', '2023-06-03'),
(9, 'C', '2023-06-05'),
(10, 'A', '2023-06-07'),
(11, 'B', '2023-06-10'),
(12, 'A', '2023-06-12'),
(13, 'C', '2023-06-14'),
(14, 'B', '2023-06-16'),
(15, 'A', '2023-06-18');
