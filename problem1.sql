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
INSERT INTO students (first_name, last_name, email, school_enrollment_date)
VALUES 
('Emily', 'Henderson', 'emily.henderson@example.com', '2024-09-04'),
('Michael', 'Dawson', 'michael.dawson@example.com', '2023-09-05'),
('Olivia', 'Bennett', 'olivia.bennett@example.com', '2024-09-04'),
('James', 'Carter', 'james.carter@example.com', '2024-01-05'),
('Sophia', 'Mitchell', 'sophia.mitchell@example.com', '2024-01-05')

INSERT INTO professors (first_name, last_name, department)
VALUES
('Jason', 'Stone', 'Math'),
('Sylvia', 'Fletcher', 'Psychology'),
('Glen', 'Morris', 'Physics'),
('Anna', 'Sloan', 'English')

INSERT INTO courses (course_name, course_description)
VALUES (),
(),
()

--Retrieve full names of all students in Physics 101

--Retrieve list of all courses + full prof name of respective teacher

--Retrieve all courses that have students enrolled

--Update Student Email

--Remove a Student from Course