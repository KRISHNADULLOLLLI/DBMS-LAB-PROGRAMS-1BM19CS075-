/*BANKING ENTERPRISE DATABASE
Consider the following database for a banking enterprise.
BRANCH (branch-name: String, branch-city: String, assets: real)
ACCOUNTS (accno: int, branch-name: String, balance: real)
DEPOSITOR (customer-name: String, customer-street: String,customer-city: String)
LOAN (loan-number: int, branch-name: String, amount: real)
BORROWER (customer-name: String, loan-number: int)
i) Create the above tables by properly specifying the primary keys and the foreign keys.
ii) Enter at least five tuples for each relation.
iii) Find all the customers who have at least two accounts at the Main branch.
iv) Find all the customers who have an account at all the branches located in a specific city.
v) Demonstrate how you delete all account tuples at every branch located in a specific cit*/



CREATE DATABASE BANKING_ENTERPRISE;
USE BANKING_ENTERPRISE;


create table branch(
branch_name varchar(30) primary key,
branch_city varchar(30),
assets real);

create table accounts(
accno int primary key,
branch_name varchar(30),
balance real,
foreign key (branch_name) references branch(branch_name) on delete cascade on update cascade);

create table depositor(
customer_name varchar(30),
accno int,
primary key(customer_name ,accno),
foreign key (accno) references accounts(accno) on delete cascade on update cascade,
foreign key (customer_name) references customer(customer_name) on delete cascade on update
cascade);


create table loan(
loan_number int primary key,
branch_name varchar(30),
amount real,
foreign key (branch_name) references branch(branch_name)
);

create table borrower (
customer_name varchar(30),
loan_number int,
primary key(customer_name, loan_number),
foreign key (customer_name) references customer(customer_name) on delete cascade on update cascade,
foreign key (loan_number) references loan(loan_number) on delete cascade on update cascade);


insert into branch(branch_name,branch_city,assets) values 
('A','Bangalore',190000), ('B','Bangalore',200000),
('C','Delhi',235344),('D','Chennai',1050560),('E','Chennai',678909);

insert into accounts(accno,branch_name,balance) 
VALUES (1001,'A',10000),(1002,'B',5000),(1003,'C',7500),
(1004,'D',50000),(1005,'D',75000),(1006,'E',560),(1007,"B",500),(1008,"B",1500);

insert into customer(customer_name,customer_street,customer_city)
 VALUES ("Ravi","Dasarahalli","Bangalore"),("Shyam","Indiranagar","Delhi"), ("Seema","Vasantnagar","Chennai"),
 ("Arpita","Church Street","Bangalore"),("Vinay","MG Road","Chennai");
 

insert into depositor(customer_name,accno) 
VALUES ("Ravi",1001),("Ravi",1002), ("Shyam",1003),("Seema",1004),
 ("Seema",1005),("Arpita",1006),("Vinay",1007),("Vinay",1008);

insert into loan(loan_number,branch_name,amount) VALUES 
(001,'A',10000),(002,'B',25000),(003,'B',250000),(004,'C',5000),(005,'E',90000);

insert into borrower(customer_name,loan_number) VALUES 
("Arpita",001),("Ravi",002), ("Arpita",003),("Shyam",004),("Vinay",005);



-- iii. Find all the customers who have at least two accounts at the Main branch.
select d.customer_name from depositor d,accounts a 
where d.accno=a.accno and  a.branch_name = "D"
group by d.customer_name having count(d.customer_name) >=2;

-- iv. Find all the customers who have an account at all the branches located in a specific city.
select customer_name from depositor
join accounts on accounts.accno = depositor.accno
join branch on branch.branch_name = accounts.branch_name
where branch.branch_city = "Bangalore"
GROUP BY depositor.customer_name
having count(DISTINCT branch.branch_name) = (SELECT COUNT(branch_name)
FROM branch
WHERE branch_city = 'Bangalore');

-- v. Demonstrate how you delete all account tuples at every branch located in a specific city.
delete from accounts where branch_name in
(select branch_name from branch where branch_city="Delhi");

SELECT * FROM ACCOUNTS
-- ROLLBACK


