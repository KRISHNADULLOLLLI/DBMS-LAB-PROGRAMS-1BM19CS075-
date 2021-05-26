/*Consider the following database of student enrollment in courses and books adopted for each course.
STUDENT (regno: String, name: String, major: String, bdate: date)
COURSE (course #: int, cname: String, dept: String)
ENROLL (regno: String, cname: String, sem: int, marks: int)
BOOK_ADOPTION (course #: int, sem: int, book-ISBN: int)
TEXT(book-ISBN:int, book-title: String, publisher:String, author:String)
i) Create the above tables by properly specifying the primary keys and the foreign keys.
ii) Enter at least five tuples for each relation.
iii) Demonstrate how you add a new text book to the database and make this book be adopted by some department.
iv) Produce a list of text books (include Course #, Book-ISBN, Book-title) in the alphabetical order for courses offered by the ‘CS’ department that use more than two books.
v) List any department that has all its adopted books published by a specific publisher.*/


CREATE DATABASE SENROLLMENT;
USE SENROLLMENT;

CREATE TABLE STUDENT(
	REG_NO VARCHAR(30),
	SNAME VARCHAR(30),
    MAJOR VARCHAR(30),
    BDATE DATE,
    PRIMARY KEY(REG_NO)
);

CREATE TABLE COURSE(
	COURSE_ID INT,
    CNAME VARCHAR(30),
    DEPT VARCHAR(30),
    PRIMARY KEY(COURSE_ID)
);

CREATE TABLE ENROLL(
	REG_NO VARCHAR(30),
    COURSE_ID INT,
    SEM INT,
    MARKS INT,
	FOREIGN KEY(REG_NO) REFERENCES STUDENT(REG_NO) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE BOOK_ADOPTION(
	COURSE_ID INT,
	SEM INT,
	BOOK_ISBN INT,
	PRIMARY KEY(BOOK_ISBN),
	FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TEXT(
	BOOK_ISBN INT,
	BOOK_TITLE VARCHAR(30),
	PUBLISHER VARCHAR(30),
	AUTHOR VARCHAR(30),
	FOREIGN KEY(BOOK_ISBN) REFERENCES BOOK_ADOPTION(BOOK_ISBN) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO STUDENT(REG_NO, SNAME, MAJOR, BDATE) VALUES
 ('CS01', 'RAM', 'DS', '1986-03-12'),('IS02', 'SMITH', 'USP', '1987-12-23'),('EC03', 'AHMED', 'SNS', '1985-04-17'),
 ('CS03', 'SNEHA', 'DBMS', '1987-01-01'),('TC05', 'AKHILA', 'EC', '1986-10-06');

INSERT INTO COURSE(COURSE_ID, CNAME, DEPT) VALUES 
(11, 'DS', 'CS'),(22, 'USP', 'IS'),(33, 'SNS', 'EC'),(44, 'DBMS', 'CS'),(55, 'EC', 'TC');		

INSERT INTO ENROLL(REG_NO, COURSE_ID, SEM, MARKS) VALUES 
('CS01', 11, 4, 85),('IS02', 22, 6, 80),('EC03', 33, 2, 80),('CS03', 44, 6, 75),('TC05', 55, 2, 8);

INSERT INTO BOOK_ADOPTION(COURSE_ID,SEM,BOOK_ISBN) VALUES 
(11,4,1),(11,4,2),(44,6,3),(44,6,4),(55,2,5),(22,6,6),(55,2,7);

INSERT INTO TEXT(BOOK_ISBN, BOOK_TITLE, PUBLISHER, AUTHOR) VALUES 
(1, 'DS and C', 'Princeton', 'Padma Reddy'),
(2, 'Fundamentals of DS', 'Princeton', 'Godse'),
(3, 'Fundamentals of DBMS', 'Princeton', 'Navathe'),
(4, 'SQL', 'Princeton', 'Foley'),
(5, 'Electronic circuits', 'TMH', 'Elmasri'),
(6, 'Adv unix prog', 'TMH', 'Stevens');  

/* QUERY 1
Demonstrate how you add a new text book to the database and make this book be adopted by some department.*/
INSERT INTO TEXT VALUES(7, "TREES & GRAPHS", "PRINCETON", "SADGE");
INSERT INTO BOOK_ADOPTION VALUES(11, 4, 8); 


/* QUWERY 2
Produce a list of text books (include Course #, Book-ISBN, Book-title) in the alphabetical order for courses offered by the ‘CS’ department that use more than two books.*/
SELECT C.COURSE_ID,T.BOOK_ISBN,T.BOOK_TITLE FROM TEXT T,COURSE C,BOOK_ADOPTION B WHERE T.BOOK_ISBN=B.BOOK_ISBN 
AND B.COURSE_ID=C.COURSE_ID AND C.DEPT="CS" AND (SELECT COUNT(B.BOOK_ISBN) 
FROM BOOK_ADOPTION B 
WHERE C.COURSE_ID=B.COURSE_ID)>=2 
ORDER BY T.BOOK_TITLE;                     


/* QUERY 3
List any department that has all its adopted books published by a specific publisher.*/
SELECT DISTINCT C.DEPT
FROM COURSE C
WHERE C.DEPT 
IN (SELECT C.DEPT 
FROM COURSE C,BOOK_ADOPTION B,TEXT T
WHERE C.COURSE_ID=B.COURSE_ID
AND T.BOOK_ISBN=B.BOOK_ISBN
AND T.PUBLISHER='Princeton')
AND C.DEPT
NOT IN (SELECT C.DEPT
FROM COURSE C,BOOK_ADOPTION B,TEXT T
WHERE C.COURSE_ID=B.COURSE_ID
AND T.BOOK_ISBN=B.BOOK_ISBN
AND T.PUBLISHER != 'Princeton');






