--QAP 2: SQL & PostgreSQL Mastery
--Problem 1: University Course Enrollment System
--Author: Chelsea Slade (Mayne)
--Due: October 14, 2024

--Create Tables
--Students
CREATE TABLE students (
    id int NOT NULL AUTO_INCREMENT,
    first_name varchar(100),
    last_name varchar(100),
    email varchar (150),
    school_enrollment_date DATE
    PRIMARY KEY (id)
);

--Professors
CREATE TABLE professors (
    id int NOT NULL AUTO_INCREMENT,
    first_name varchar(100),
    last_name varchar(100),
    department varchar(100)
    PRIMARY KEY (id)
);

--Courses
CREATE TABLE courses (
    id int NOT NULL AUTO_INCREMENT,
    course_name varchar(100),
    course_description varchar(300),
    professor_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);

--Enrollments
CREATE TABLE enrollments (
    student_id int,
    course_id int,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id)
);

--Insert Data 

--Retrieve full names of all students in Physics 101

--Retrieve list of all courses + full prof name of respective teacher

--Retrieve all courses that have students enrolled

--Update Student Email

--Remove a Student from Course