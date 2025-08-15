CREATE DATABASE test;

CREATE USER 'student'@'%' IDENTIFIED BY 'student@1';

GRANT ALL PRIVILEGES ON test.* TO 'student'@'%';

flush privileges;


use test

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100),
    student_age INT,
    student_addr VARCHAR(255),
    student_percent DECIMAL(5, 2),
    student_qual VARCHAR(100),
    student_year_passed INT
);

