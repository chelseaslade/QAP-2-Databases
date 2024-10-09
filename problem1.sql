--QAP 2: SQL & PostgreSQL Mastery
--Problem 1: University Course Enrollment System
--Author: Chelsea Slade (Mayne)
--Due: October 14, 2024

--Create Tables
--Students
CREATE TABLE students (
    id serial NOT NULL PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    email varchar (150),
    school_enrollment_date DATE,
    UNIQUE (id)
);

--Professors
CREATE TABLE professors (
    id serial NOT NULL PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    department varchar(100)
);

--Courses
CREATE TABLE courses (
    id serial NOT NULL PRIMARY KEY,
    course_name varchar(100),
    course_description varchar(300),
    professor_id int,
    FOREIGN KEY (professor_id) REFERENCES professors(id),
    UNIQUE (id)
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
('Sophia', 'Mitchell', 'sophia.mitchell@example.com', '2024-01-05');

INSERT INTO professors (first_name, last_name, department)
VALUES
('Jason', 'Stone', 'Math'),
('Sylvia', 'Fletcher', 'Psychology'),
('Glen', 'Morris', 'Physics'),
('Anna', 'Sloan', 'English');

INSERT INTO courses (course_name, course_description, professor_id)
VALUES 
('Math 101', 'Introductory Algebra', 1),
('Psychology 101', 'Introductory Psychology', 2),
('Physics 101', 'Introductory Physics', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2024-09-04'),
(2, 1, '2024-09-04'),
(3, 3, '2024-09-04'),
(4, 2, '2024-09-04'),
(5, 3, '2024-09-04');

--Retrieve full names of all students in Physics 101
SELECT first_name || ' ' || last_name as full_name
FROM enrollments
JOIN students ON enrollments.student_id = id
WHERE course_id = 3;

--Retrieve list of all courses + full prof name of respective teacher
SELECT course_name, professors.first_name || ' ' || professors.last_name AS professor_full_name
FROM courses
JOIN professors ON courses.professor_id = professors.id;

--Retrieve all courses that have students enrolled
SELECT DISTINCT course_name
FROM courses
JOIN enrollments ON enrollments.course_id = course_id;

--Update Student Email
UPDATE students
SET email = 'sillyupdate@example.com'
WHERE id = 1;

--Remove a Student from Course
DELETE
FROM enrollments
WHERE student_id = 1 AND course_id = 1;