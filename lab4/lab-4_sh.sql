-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Shyam Sundar.A
-- USN: 1RUA24BCA0084
-- SECTION: 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
create database st;
use st;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create table employee(
 empid varchar(20) primary key ,
 firstname varchar(10),
 lastname varchar(10),
 salary int,
 birthdate date,
 hiredate date);
-- 2. Insert 10 records to employee;
insert into employee values (101,'jeevan','ram',50000,'2000-08-12','2023-06-23');
insert into employee values(102,'jeev','krish',100000,'2000-08-12','2023-06-23');
insert into employee values(103,'rio','krish',100000,'2000-08-12','2023-06-23');
insert into employee values(104,'ninja','krish',100000,'2000-08-12','2023-06-23');
insert into employee values(105,'rocky','bye',50000,'2000-08-12','2023-06-23');
insert into employee values(106,'santa','uno',70000,'2000-08-12','2023-06-23');
insert into employee values(107,'javan','javan',50000,'2000-08-12','2023-06-23');
insert into employee values(108,'king','ramesh',105000,'2000-08-12','2023-06-23');
insert into employee values(109,'tiger','ram',105000,'2000-08-12','2023-06-23');
insert into employee values(110,'leo','ram',105000,'2000-08-12','2023-06-23');
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table orders(
orderid varchar(20) primary key,
orderdate date ,
totamt int,
empid varchar(20),
foreign key(empid) references employee(empid));

-- 4. Insert 10 records to Orders
insert into orders values(80,'2025-07-1',5000,100);
insert into orders values(89,'2025-08-16',5000,101);
insert into orders values(88,'2025-01-18',4000,102);
insert into orders values(87,'2025-02-16',5000,103);
insert into orders values(86,'2025-03-11',2000,104);
insert into orders values(85,'2025-04-10',5000,105);
insert into orders values(84,'2025-11-21',7000,106);
insert into orders values(83,'2025-12-1',5000,107);
insert into orders values(82,'2025-09-07',5000,108);
insert into orders values(81,'2025-05-11',6000,109);

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
select * from employee;
select * from orders;



-- Output: 
/* 100	jeevan	ram	50000	2000-08-12	2023-06-23
101	jeev	krish	100000	2000-08-12	2023-06-23
103	ninja	krish	100000	2000-08-12	2023-06-23
104	tiger	ram	105000	2000-08-12	2023-06-23
105	rocky	bye	50000	2000-08-12	2023-06-23
106	santa	uno	70000	2000-08-12	2023-06-23
107	javan	javan	50000	2000-08-12	2023-06-23
109	king	ram	105000	2000-08-12	2023-06-23
110	leo	ram	105000	2000-08-12	2023-06-23
80	2025-07-01	5000	100
81	2025-05-11	6000	109
83	2025-12-01	5000	107
84	2025-11-21	7000	106
86	2025-03-11	2000	104
87	2025-02-16	5000	103
89	2025-08-16	5000	101*/
			
					


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
select round(salary) as roundsalary from employee;

-- Output: 
/*50000
100000
100000
105000
50000
70000
50000
105000
105000*/
/* b. Absolute Values: Show absolute values of salaries */
select ABS(salary) as roundsalary from employee;
-- Output: 
/*'50000'
'100000'
'100000'
'105000'
'50000'
'70000'
'50000'
'105000'
'105000'
*/
/* c. Ceiling Values: Get ceiling values of order amounts */
select ceil(totamt) as roundsalary from orders;
-- Output: 
/*
5000
6000
5000
7000
2000
5000
5000*/
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
select count(*) as totalemployee from employee;
-- Output: 9

/* b. Sum of Salaries: Calculate total salary expense */
select sum(salary) as totamt from employee;
-- Output: 735000

/* c. Average Order Amount: Find average order value */
select avg(totamt) as totalorders from orders;
-- Output: '5000.0000'


/* d. Max/Min Salary: Find highest and lowest salaries */
select max(totamt),min(totamt) as totalsalary from orders;
-- Output: 7000	2000

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select firstname,lastname,upper(firstname) as UpperFirstName,lower(lastname) as LowerLastName from employee;
-- Output:
 /*jeevan	ram	JEEVAN	ram
jeev	krish	JEEV	krish
ninja	krish	NINJA	krish
tiger	ram	TIGER	ram
rocky	bye	ROCKY	bye
santa	uno	SANTA	uno
javan	javan	JAVAN	javan
king	ram	KING	ram
leo	ram	LEO	ram*/

/* b. Concatenate Names: Create full names */
select concat(firstname,lastname) as FULLNAME from employee;
-- Output: 
/*'jeevanram'
'jeevkrish'
'ninjakrish'
'tigerram'
'rockybye'
'santauno'
'javanjavan'
'kingram'
'leoram'
*/
/* c. Extract Substring: Get first 3 characters of first names */
select substr(firstname,1,4) from employee;
-- Output: 
/*'jeev'
'jeev'
'ninj'
'tige'
'rock'
'sant'
'java'
'king'
'leo'
*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert date to string : Convert DATE to text type */

select cast(orderdate as char)  As ConvertedDate from orders;
-- Output: 
/*
2025-07-01
2025-05-11
2025-12-01
2025-11-21
2025-03-11
2025-02-16
2025-08-16*/
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
select current_date() as orderdate from orders;
-- Output: 
/*'2025-09-08'
'2025-09-08'
'2025-09-08'
'2025-09-08'
'2025-09-08'
'2025-09-08'
'2025-09-08'
*/

/* b. Extract Year: Get year from order dates */
select extract(year from orderdate)as orderyear from orders;
-- Output: 
/*'2025'
'2025'
'2025'
'2025'
'2025'
'2025'
'2025'
*/
/* c. Add Months: Add 3 months to order dates */
select date_add(orderdate,interval 3 month) as finaldate from orders;
-- Output: 
/*'2025-10-01'
'2025-08-11'
'2026-03-01'
'2026-02-21'
'2025-06-11'
'2025-05-16'
'2025-11-16'
*/

/* d. Days Since Order: Calculate days between order date and now */
select orderid,datediff(Now(),orderdate) as dayssinceorder from orders;

-- Output: 
/*
'80', '69'
'81', '120'
'83', '-84'
'84', '-74'
'86', '181'
'87', '204'
'89', '23'

*/

-- END of the Task -- 