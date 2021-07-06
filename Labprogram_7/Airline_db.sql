CREATE DATABASE AIRLINE;

USE AIRLINE;

CREATE TABLE FLIGHTS(
	FL_NO INT,
    FFROM VARCHAR(30),
    FTO VARCHAR(30),
    DISTANCE INT,
    DEPARTS TIME,
    ARRIVES TIME,
    PRICE INT
    );

CREATE TABLE AIRCRAFT(
	AID INT,
    ANAME VARCHAR(30),
    CRUISINGRANGE INT,
    PRIMARY KEY(AID)
    );

CREATE TABLE EMPLOYEE(
	EID INT,
    ENAME VARCHAR(30),
    SALARY INT,
    PRIMARY KEY(EID)
    );
    
CREATE TABLE CERTIFIED(
	EID INT,
    AID INT,
	FOREIGN KEY(EID) REFERENCES EMPLOYEE(EID) ON UPDATE CASCADE,
	FOREIGN KEY(AID) REFERENCES AIRCRAFT(AID) ON UPDATE CASCADE
    );
                  

    
    
INSERT INTO FLIGHTS (FL_NO, FFROM, FTO, DISTANCE, DEPARTS, ARRIVES, PRICE) VALUES 
            (1,'BANGALORE','MANGALORE',360,'10:45:00','12:00:00',10000),
            (2,'BANGALORE','DELHI',5000,'12:15:00','04:30:00',25000),
            (3,'BANGALORE','MUMBAI',3500,'02:15:00','05:25:00',30000),
            (4,'DELHI','MUMBAI',4500,'10:15:00','12:05:00',35000),
            (5,'DELHI','FRANKFURT',18000,'07:15:00','05:30:00',90000),
            (6,'BANGALORE','FRANKFURT',19500,'10:00:00','07:45:00',95000),
            (7,'BANGALORE','FRANKFURT',17000,'12:00:00','06:30:00',99000),
            (8,'MADISON','NEW YORK', 19000, '10:00:00', '17:00:00', 100000),
            (9,'MADISON','NEW YORK', 29000, '10:00:00', '18:30:00', 100000),
            (10,'MADISON','LONDON', 30000, '11:00:00', '14:00:00', 55000),
            (10,'LONDON','NEW YORK', 30000, '14:05:00', '17:50:00', 50000),
            (11,'LONDON','NEW YORK', 31000, '14:06:00', '18:05:00', 51000),
            (11,'LONDON','BERLIN', 15000, '14:06:00', '16:05:00', 17000),
            (11,'BERLIN','NEW YORK', 18000, '16:06:00', '17:59:00', 17401);
            
INSERT INTO AIRCRAFT (AID, ANAME, CRUISINGRANGE) VALUES 
			(123,'AIRBUS',1000),
			(302,'BOEING',5000),
			(306,'JET01',5000),
			(378,'AIRBUS380',8000),
			(456,'AIRCRAFT',500),
			(789,'AIRCRAFT02',800),
			(951,'AIRCRAFT03',1000);
            
INSERT INTO EMPLOYEE (EID, ENAME, SALARY) VALUES
			(1,'AJAY',30000),
			(2,'AJITH',85000),
			(3,'ARNAB',50000),
			(4,'HARRY',45000),
			(5,'RON',90000),
			(6,'JOSH',75000),
			(7,'RAM',100000),
            (8,'RAMESH',70000),
			(9,'SURESH',80000);
            
INSERT INTO CERTIFIED (EID, AID) VALUES
			(1,123),
			(2,123),
			(1,302),
			(5,302),
			(7,302),
			(1,306),
			(2,306),
			(1,378),
			(2,378),
			(4,378),
			(6,456),
			(3,456),
			(5,789),
			(6,789),
			(3,951),
			(1,951),
			(1,789);
            
SELECT * FROM FLIGHTS;            

SELECT * FROM AIRCRAFT;    

SELECT * FROM EMPLOYEE;    

SELECT * FROM CERTIFIED;    
-- i. Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80,000.

SELECT DISTINCT A.ANAME FROM AIRCRAFT A, CERTIFIED C, EMPLOYEE E WHERE A.AID = C.AID AND C.EID = E.EID AND E.SALARY > 80000;

-- ii. For each pilot who is certified for more than three aircrafts, find the eid and the maximum cruising
-- range of the aircraft for which she or he is certified.

SELECT E.EID,MAX(A.CRUISINGRANGE) FROM AIRCRAFT A,CERTIFIED C,EMPLOYEE E WHERE A.AID=C.AID AND C.EID=E.EID GROUP BY E.EID HAVING COUNT(E.EID)>3;

-- iii. Find the names of pilots whose salary is less than the price of the cheapest route from Bengaluru to Frankfurt.

SELECT DISTINCT ENAME FROM EMPLOYEE WHERE EID IN(
						   SELECT EID FROM CERTIFIED)
                           AND SALARY < (
                           SELECT MIN(PRICE) FROM FLIGHTS WHERE FFROM = 'BANGALORE' AND FTO = 'FRANKFURT') ;
                           
-- iv. For all aircraft with cruising range over 1000 Kms, find the name of the aircraft and the average
-- salary of all pilots certified for this aircraft.

SELECT A.ANAME, AVG(E.SALARY) FROM AIRCRAFT A,CERTIFIED C,EMPLOYEE E WHERE A.AID=C.AID AND C.EID=E.EID AND A.CRUISINGRANGE > 1000 GROUP BY A.AID;

-- v. Find the names of pilots certified for some Boeing aircraft.

SELECT E.ENAME FROM AIRCRAFT A,CERTIFIED C,EMPLOYEE E WHERE A.AID=C.AID AND C.EID=E.EID AND A.ANAME = 'BOEING';

-- vi. Find the aids of all aircraft that can be used on routes from Bengaluru to New Delhi.

SELECT AID FROM AIRCRAFT WHERE CRUISINGRANGE >= (SELECT MIN(DISTANCE) FROM FLIGHTS WHERE FFROM = 'BANGALORE' AND FTO = 'DELHI') ;

-- vii. A customer wants to travel from Madison to New York with no more than two changes of flight. List
-- the choice of departure times from Madison if the customer wants to arrive in New York by 6 p.m.

SELECT F.DEPARTS
FROM FLIGHTS F
WHERE F.FL_NO IN ( ( SELECT F0.FL_NO
 FROM FLIGHTS F0
 WHERE F0.FFROM = 'MADISON' AND F0.FTO = 'NEW YORK'
 AND F0.ARRIVES < '18:00:00' )
 UNION
 ( SELECT F0.FL_NO
 FROM FLIGHTS F0, FLIGHTS F1
 WHERE F0.FFROM = 'MADISON' AND F0.FTO != 'NEW YORK'
 AND F0.FTO = F1.FFROM AND F1.FTO = 'NEW YORK'
 AND F1.DEPARTS > F0.ARRIVES
 AND F1.ARRIVES < '18:00:00' )
 UNION
 ( SELECT F0.FL_NO
 FROM FLIGHTS F0, FLIGHTS F1, FLIGHTS F2
 WHERE F0.FFROM = 'MADISON'
 AND F0.FTO = F1.FFROM
 AND F1.FTO = F2.FFROM
 AND F2.FTO = 'NEW YORK'
 AND F0.FTO != 'NEW YORK'
 AND F1.FTO != 'NEW YORK'
 AND F1.DEPARTS > F0.ARRIVES
 AND F2.DEPARTS > F1.ARRIVES
 AND F2.ARRIVES < '18:00:00' ));
                                                             
-- viii. Print the name and salary of every non-pilot whose salary is more than the average salary for pilots.
SELECT ENAME FROM EMPLOYEE WHERE EID NOT IN(SELECT EID FROM CERTIFIED) AND SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE EID IN(SELECT EID FROM CERTIFIED));                                                             
