show databases;
CREATE DATABASE SISDB;

use SISDB;
show tables;
Create table Students(
Student_id int primary key,
First_name Varchar(30),
last_name Varchar(30),
date_of_birth Date,
email Varchar(20),
phone_no int
);
Select * from Students;

insert into Students(Student_id,First_name,last_name,date_of_birth,email,phone_no)
values(01,'akshay','asd','2002-02-03','als@gmail.com',34567),
(02,'sahil','fgd','2002-07-03','als@gmail.com',90345),
(03,'raj','hjd','2002-05-03','aus@gmail.com',67832),
(04,'raju','kjd','2002-02-03','ays@gmail.com',27853),
(05,'sonu','jkd','2006-02-03','alqs@gmail.com',17832),
(06,'rahul','dfd','2003-02-03','iks@gmail.com',78256),
(07,'akash','akd','2009-02-03','pls@gmail.com',89267),
(08,'marry','fgd','2002-09-04','ers@gmail.com',27819),
(09,'lesa','asu','2000-05-06','oks@gmail.com',88323),
(10,'sid','asd','2003-09-03','iks@gmail.com',98567); 
/* dont use extra parenthises;*/

select * from Students;

Create table Teacher(
teacher_id int primary key,
first_name Varchar(20),
last_name Varchar(20),
email Varchar(20)
)

insert into Teacher(teacher_id,first_name,last_name,email)
values (21,'mahesh','hyt','dfah@gmail.com'),
(22,'sahil','hyt','dfah@gmail.com'),
(23,'shubdeep','hyt','dfah@gmail.com'),
(24,'rohan','hyt','dfah@gmail.com'),
(25,'kagal','hyt','dfah@gmail.com'),
(26,'rahul','hyt','dfah@gmail.com'),
(27,'mohit','hyt','dfah@gmail.com'),
(28,'prakash','hyt','dfah@gmail.com'),
(29,'salman','hyt','dfah@gmail.com'),
(30,'aditya','hyt','dfah@gmail.com');
 
 Select * from Teacher;

Create table Courses(
course_id int primary key,
course_name Varchar(30),
credits int,
teacher_id int,
foreign key(teacher_id) references Teacher(teacher_id)
);

select * from Courses;

insert into Courses(course_id,course_name,credits,teacher_id)
values ('101','science',6,21),
(102,'science',6,22),
(103,'math',6,23),
(104,'math',6,24),
(105,'goe',6,25),
(106,'geo',6,26),
(107,'history',6,27),
(108,'english',6,28),
(109,'maths',6,29),
(111,'science',6,30);


create table payments(
payment_id int primary key,
amount int,
payment_date Date,
student_id int,
foreign key(student_id) references students(student_id)
);

insert into payments(payment_id,amount,payment_date,student_id)
values(91,3000,'2021-08-09',01),
(92,5000,'2021-02-08',02),
(93,8000,'2021-04-09',03),
(94,3000,'2021-06-09',04),
(95,5000,'2021-08-09',05),
(96,9000,'2021-04-09',06),
(97,3000,'2021-02-08',07),
(98,6000,'2021-01-09',08),
(99,2000,'2021-09-09',09),
(100,1000,'2021-11-09',10);

create table Enrollments(
enrollment_id int primary key,
student_id int,
foreign key(student_id) references students(student_id),
course_id int,
foreign key(course_id) references courses(course_id),
enrollment_date date
);

insert into Enrollments(enrollment_id,student_id,course_id,enrollment_date)
values(51,01,101,'2023-09-07'),
(52,02,102,'2023-09-06'),
(53,03,103,'2023-02-07'),
(54,04,104,'2023-04-07'),
(55,05,105,'2023-09-05'),
(56,06,106,'2023-05-04'),
(57,07,107,'2023-01-07'),
(58,08,108,'2023-01-07'),
(59,09,109,'2023-03-06'),
(60,10,111,'2023-05-07');


/* Task 2 
1 Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
© Hexaware Technologies Limited. All rights www.hexaware.com
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890*/

INSERT INTO Students (Student_id, First_name, last_name, date_of_birth, email, phone_no)
VALUES (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', 1234567890);


/* 
3 Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
modify their email address.*/

Update teacher set email = 'newrohan@gmail.com' where teacher_id = '24';

select * from teacher;

/*
4 Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
an enrollment record based on the student and course.*/

Delete from Enrollments
where student_id = '02' and course_id = '102';
select * from Enrollments

/*Update the "Courses" table to assign a specific teacher to a course. Choose any course and
teacher from the respective tables*/

update courses
set teacher_id = '21'
where course_name = 'Science';

select * from courses;

/*
6 Delete a specific student from the "Students" table and remove all their enrollment records
from the "Enrollments" table. Be sure to maintain referential integrity.*/

Delete from  Enrollments
where student_id = '04';

select * from Enrollments;

/*
7 Update the payment amount for a specific payment record in the "Payments" table. Choose any
payment record and modify the payment amount.*/

Update Payments
set amount = '7777'
where payment_id = '97';



/*
TASK 3
Write an SQL query to calculate the total payments made by a specific student. You will need to
join the "Payments" table with the "Students" table based on the student's ID.

*/ 
SELECT 
    s.Student_id,
    s.First_name,
    s.Last_name,
    SUM(p.amount) AS Total_Payments
FROM 
    Students s
JOIN 
    Payments p ON s.Student_id = p.student_id
WHERE 
    s.Student_id = 1
GROUP BY 
    s.Student_id, s.First_name, s.Last_name;
    
/*Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.*/
SELECT 
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS Student_Count
FROM 
    Courses c
LEFT JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_id, c.course_name;


/* 3 Write an SQL query to find the names of students who have not enrolled in any course. Use a
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
without enrollments.*/

SELECT 
    s.First_name,
    s.Last_name
FROM 
    Students s
LEFT JOIN 
    Enrollments e ON s.Student_id = e.student_id
WHERE 
    e.course_id IS NULL;

/* 4 Write an SQL query to retrieve the first name, last name of students, and the names of the
courses they are enrolled in. Use JOIN operations between the "Students" table and the
"Enrollments" and "Courses" tables. */

SELECT 
    s.First_name,
    s.Last_name,
    c.course_name
FROM 
    Students s
JOIN 
    Enrollments e ON s.Student_id = e.student_id
JOIN 
    Courses c ON e.course_id = c.course_id;
/*5 Create a query to list the names of teachers and the courses they are assigned to. Join the
"Teacher" table with the "Courses" table.
*/


SELECT 
    t.first_name,
    t.last_name,
    c.course_name
FROM 
    Teacher t
JOIN 
    Courses c ON t.teacher_id = c.teacher_id;
    
    /* 6  Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
"Students" table with the "Enrollments" and "Courses" tables. */

    
    
    SELECT 
    s.First_name,
    s.Last_name,
    e.enrollment_date
FROM 
    Students s
JOIN 
    Enrollments e ON s.Student_id = e.student_id
JOIN 
    Courses c ON e.course_id = c.course_id
WHERE 
    c.course_id = 1;
    
    /* 7 Find the names of students who have not made any payments. Use a LEFT JOIN between the
"Students" table and the "Payments" table and filter for students with NULL payment records*/

SELECT 
    s.First_name,
    s.Last_name
FROM 
    Students s
LEFT JOIN 
    Payments p ON s.Student_id = p.student_id
WHERE 
    p.payment_id IS NULL;

/* 8  Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
between the "Courses" table and the "Enrollments" table and filter for courses with NULL
enrollment records.*/

SELECT 
    c.course_id,
    c.course_name
FROM 
    Courses c
LEFT JOIN 
    Enrollments e ON c.course_id = e.course_id
WHERE 
    e.enrollment_id IS NULL;
