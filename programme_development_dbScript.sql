#run codes individually
#press crtl+enter to run code

CREATE DATABASE programmedevelopmentdb;

USE programmedevelopmentdb;

CREATE TABLE programmes (
	id INT PRIMARY KEY AUTO_INCREMENT,
    programme_code VARCHAR(10) UNIQUE,
    title VARCHAR(100),
    nqf_level INT,
    faculty VARCHAR(50),
    department VARCHAR(50),
    registration_date DATE
);

#Do not run unless needed
DROP TABLE programmes;
ALTER TABLE programmes;


CREATE TABLE courses (
    course_code VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100),
    nqf_level INT,
    programme_code VARCHAR(10),
    FOREIGN KEY (programme_code) REFERENCES programmes(programme_code) ON DELETE CASCADE
);

#do not run unless needed
DROP TABLE courses;
ALTER TABLE courses;

#DATA DUMP
INSERT INTO programmes (programme_code, title, nqf_level, faculty, department, registration_date)
VALUES 
('CS101', 'Bachelor of Computer Science', 8, 'Computing and Informatics', 'Software Engineering', '2019-01-15'),
('EN101', 'Bachelor of Engineering', 8, 'Engineering', 'Civil Engineering', '2018-08-10'),
('BA101', 'Bachelor of Business Administration', 7, 'Business and Management', 'Management', '2017-06-20'),
('IT201', 'Diploma in Information Technology', 6, 'Computing and Informatics', 'Information Technology', '2020-11-05'),
('ED101', 'Bachelor of Education', 7, 'Education', 'Primary Education', '2015-03-22');

INSERT INTO courses (course_code, course_name, nqf_level, programme_code)
VALUES
('CS1001', 'Introduction to Programming', 8, 'CS101'),
('CS1002', 'Data Structures and Algorithms', 8, 'CS101'),
('CS1003', 'Database Systems', 8, 'CS101'),
('EN2001', 'Engineering Mechanics', 8, 'EN101'),
('EN2002', 'Fluid Dynamics', 8, 'EN101'),
('BA3001', 'Business Management', 7, 'BA101'),
('BA3002', 'Organizational Behavior', 7, 'BA101'),
('IT4001', 'Networking Fundamentals', 6, 'IT201'),
('IT4002', 'Web Development', 6, 'IT201'),
('ED5001', 'Classroom Management', 7, 'ED101'),
('ED5002', 'Curriculum Design', 7, 'ED101');

#view programmes
SELECT * FROM programmes;
SELECT * FROM courses;

SELECT * FROM programmes
WHERE nqf_level > 5;

#view courses
SELECT * FROM courses;

SHOW TABLES;

#do not run unless needed
UPDATE programmes
SET nqf_level = 8
WHERE id = 1;

DELETE FROM programmes
WHERE id = 2;

ALTER TABLE courses
ADD COLUMN study_mode VARCHAR(20);

SELECT * FROM programmes
ORDER BY title ASC; 

SELECT COUNT(*) FROM programmes;

SELECT *
FROM Programmes
WHERE DATE_ADD(registration_date, INTERVAL 5 YEAR) <= NOW();