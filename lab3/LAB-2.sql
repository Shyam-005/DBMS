-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: Shyam Sundar.A
-- USN: 1RUA24BCA0084
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'DESKTOP-13U5RRQ', '8.4.6', '2025-08-18 11:33:01'

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:
create database DBLab001;
use DBLab001;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth
create table Students
( StudentID varchar(10) primary key,
FirstName varchar(15),
LastName varchar(10),
Email varchar(15) UNIQUE,
DOB date);
-- Write your SQL query below Codespace:

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(15)', 'YES', '', NULL, ''
'LastName', 'varchar(10)', 'YES', '', NULL, ''
'Email', 'varchar(15)', 'YES', 'UNI', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
*/
-- Alter the table and 2 new columns
alter table students add(gender varchar(2),age int);
desc students;
-- Modify a column data type
alter table students modify lastname varchar(15);
desc students;
-- Rename a column
alter table students rename column lastname to surname;
desc students;

-- Drop a column
alter table students drop DOB;
-- Rename the table
alter table students rename to  studentdetails;
desc studentdetails;



-- Task 2: Create the Courses Table
-- Create a table to store information about courses.

-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table info
(
   courseid varchar(15) primary key,
   coursename varchar(15),
   credits int);
   

DESC info; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :
/*'courseid', 'varchar(15)', 'NO', 'PRI', NULL, ''
'coursename', 'varchar(15)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''*/


-- Alter the table and 2 new columns
alter table info add(types varchar(10),duration int);
desc info;
-- Modify a column data type
alter table info modify courseid varchar(20);
-- Rename a column
alter table info rename column credits to points;
-- Drop a column
alter table info drop duration;
-- Rename the table
alter table info rename to course;
desc course;


-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate
-- Write your SQL query below Codespace:
create table enroll
( enrollid varchar(15) primary key,
 stuid varchar(10),
 courseid varchar(10),
 foreign key(stuid) references studentdetails(studentid),
 foreign key(courseid) references course(courseid)
 );

DESC ENROLL; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :

-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:

DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
