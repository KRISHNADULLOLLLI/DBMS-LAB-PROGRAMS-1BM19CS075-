# DATABASE MANAGEMENT SYSTEMS LAB PROGRAMS





*B.M.S COLLEGE OF ENGINNERING, BASAVANGUDI, BENGALURU.*

* MENTOR - PANIMOZHI K MADAM 

* STUDENT NAME - KRISHNA MOHAN DULLOLLI

* USN - 1BM19CSO75

* COURSE CODE - 19CS4PCDBM

* YEAR - 2020-2021

* SEMSETER - 4TH


***********************************************************************








******LAB PROGRAMS ASSIGNED BY INSTITUTION******










1)   **INSURANCE DATABASE**

     Consider the Insurance database given below. The primary keys are underlined and the data types are specified.
    
     PERSON (driver-id #: String, name: String, address: String)
   
     CAR (Regno: String, model: String, year: int)
   
     ACCIDENT (report-number: int, date: date, location: String)
   
     OWNS (driver-id #: String, Regno: String)
   
     PARTICIPATED (driver-id: String, Regno: String, report-number: int, damage-amount: int)
   
     i) Create the above tables by properly specifying the primary keys and the foreign keys.
   
     ii) Enter at least five tuples for each relation.
   
     iii) Demonstrate how you
        a. Update the damage amount for the car with a specific Regno in the accident with report number 12 to 25000.
        b. Add a new accident to the database.
        
     iv) Find the total number of people who owned cars that involved in accidents in 2008.
   
     v) Find the number of accidents in which cars belonging to a specific model were involved.

----------------------------------------------------------------------------------------------------

2) **BOOKDEALER DATABASE**
 
   The following tables are maintained by a book dealer:
   
   AUTHOR(author-id: int, name: String, city: String, country: String)
   
   PUBLISHER(publisher-id: int, name: String, city: String, country: String)
   
   CATALOG(book-id: int, title: String, author-id: int, publisher-id: int, category-id: int, year: int, price:int)
   
   CATEGORY(category-id: int, description: String)
   
   ORDER-DETAILS(order-no: int, book-id: int, quantity: int)
   
   i) Create the above tables by properly specifying the primary keys and the foreign keys.
   
   ii) Enter at least five tuples for each relation.
   
   iii) Give the details of the authors who have 2 or more books in the catalog and the price of the books in the catalog and the year of publication is after 2000.
   
   iv) Find the author of the book which has maximum sales.
   
   v) Demonstrate how you increase the price of books published by a specific publisher by 10%

----------------------------------------------------------------------------------------------------

3) **ORDER PROCESSING DATABASE**
  
   Consider the following relations for an Order Processing database application in a company.
   
   CUSTOMER (CUST #: int, cname: String, city: String)
   
   ORDER (order #: int, odate: date, cust #: int, ord-Amt: int)
   
   ITEM (item #: int, unit-price: int)
   
   ORDER-ITEM (order #: int, item #: int, qty: int)
   
   WAREHOUSE (warehouse #: int, city: String)
   
   SHIPMENT (order #: int, warehouse #: int, ship-date: date)
   
   i)Create the above tables by properly specifying the primary keys and the foreign keys and the foreign keys.
   
   ii) Enter at least five tuples for each relation.
   
   iii) Produce a listing: CUSTNAME, #oforders, AVG_ORDER_AMT, where the middle column is the total numbers of orders by the customer and the last column is the average order
   amount for that customer.
   
   iv) List the order# for orders that were shipped from all warehouses that the company has in a specific city.
   
   v) Demonstrate how you delete item# 10 from the ITEM table and make that field null in the ORDER_ITEM table.


----------------------------------------------------------------------------------------------------

4)  **BANKING ENTERPRISE DATABASE**
  
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
   
    v) Demonstrate how you delete all account tuples at every branch located in a specific city

----------------------------------------------------------------------------------------------------
5) Consider the following database of student enrollment in courses and books adopted for
   each course.
   
    STUDENT (regno: String, name: String, major: String, bdate: date)
    
    COURSE (course #: int, cname: String, dept: String)
    
    ENROLL (regno: String, cname: String, sem: int, marks: int)
    
    BOOK_ADOPTION (course #: int, sem: int, book-ISBN: int)
    
    TEXT(book-ISBN:int, book-title: String, publisher:String, author:String)
    
 i) Create the above tables by properly specifying the primary keys and the foreign keys.
 
 ii) Enter at least five tuples for each relation.
 
 iii) Demonstrate how you add a new text book to the database and make this book be
      adopted by some department.
      
 iv) Produce a list of text books (include Course #, Book-ISBN, Book-title) in the
     alphabetical order for courses offered by the ‘CS’ department that use more than two
     books.
     
 v) List any department that has all its adopted books published by a specific publisher.


----------------------------------------------------------------------------------------------------
6) **SUPPLIER DATABASE**
   
   Consider the following schema:
   
   SUPPLIERS (sid: integer, sname: string, address: string)
   
   PARTS (pid: integer, pname: string, color: string)
   
   CATALOG (sid: integer, pid: integer, cost: real)
   
   The Catalog relation lists the prices charged for parts by Suppliers. Write the following queries in SQL:
   
   i) Find the pnames of parts for which there is some supplier.
   
   ii) Find the snames of suppliers who supply every part.
   
   iii) Find the snames of suppliers who supply every red part.
   
   iv) Find the pnames of parts supplied by Acme Widget Suppliers and by no one else.
   
   v) Find the sids of suppliers who charge more for some part than the average cost of that part (averaged over all the suppliers who supply that part).
   
   vi) For each part, find the sname of the supplier who charges the most for that part.
   
   vii)Find the sids of suppliers who supply only red parts

----------------------------------------------------------------------------------------------------
7) 


----------------------------------------------------------------------------------------------------

8) 


----------------------------------------------------------------------------------------------------
9) 

----------------------------------------------------------------------------------------------------
10) 
 
 
----------------------------------------------------------------------------------------------------

