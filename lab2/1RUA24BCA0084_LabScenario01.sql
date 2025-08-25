-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: Shyam Sundar.A
-- USN:1RUA24BCA0084
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
/*'root@localhost', 'RVU-PC-060', '8.4.6', '2025-08-25 05:59:37'*/

-- Scenario: College Student Management System 

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
create database colleges;
use colleges;
-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    HOD VARCHAR(30),
    ContactEmail VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Location VARCHAR(50)
);
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  CREATE TABLE Course (
  CourseID INT PRIMARY KEY,
    CourseName VARCHAR(30),
    Credits int,
    DepartmentID int,
    Duration VARCHAR(30),
    Fee decimal(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  CREATE TABLE Students (
   StudentID int PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DateOfBirth DATE,
    CourseID int,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
CREATE TABLE Faculty (
    FacultyID int PRIMARY KEY,
    FacultyName VARCHAR(100),
    DepartmentID int,
    Qualification VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);  
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
  CREATE TABLE Enrollments (
  EnrollmentID int PRIMARY KEY,
    StudentID int,
    CourseID int,
    Semester VARCHAR(20),
    Year int,
    Grade VARCHAR(5),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:
desc Departments;
desc Course;
desc Students;
desc Faculty;
desc Enrollments;
-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(100)', 'YES', '', NULL, ''
'HOD', 'varchar(100)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(100)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(20)', 'YES', '', NULL, ''
'Location', 'varchar(100)', 'YES', '', NULL, ''
 
 'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(100)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Duration', 'varchar(50)', 'YES', '', NULL, ''
'Fee', 'decimal(10,2)', 'YES', '', NULL, ''

'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(50)', 'YES', '', NULL, ''
'LastName', 'varchar(50)', 'YES', '', NULL, ''
'Email', 'varchar(100)', 'YES', '', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''


'FacultyID', 'int', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(100)', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(100)', 'YES', '', NULL, ''
'Email', 'varchar(100)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(20)', 'YES', '', NULL, ''

'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Semester', 'varchar(20)', 'YES', '', NULL, ''
'Year', 'int', 'YES', '', NULL, ''
'Grade', 'varchar(5)', 'YES', '', NULL, '' */

--  describe the structure of each table and copy paste the Output 

-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
ALTER TABLE Departments ADD (EstablishedYear int,Website VARCHAR(200));
ALTER TABLE Course ADD (syllabus VARCHAR(100),instructor VARCHAR(50));
ALTER TABLE Students ADD (gender VARCHAR(20),address VARCHAR(100));
ALTER TABLE Faculty ADD (department VARCHAR(30),startingdate date);
ALTER TABLE Enrollments ADD(enrolldate date,status varchar(20));


-- 02: Modify the existing column from each table
ALTER TABLE Departments MODIFY  HOD VARCHAR(50);
ALTER TABLE Course  MODIFY CourseName VARCHAR(150);
ALTER TABLE Students  MODIFY  FirstName VARCHAR(100);
ALTER TABLE  Faculty  MODIFY Qualification VARCHAR(150);
ALTER TABLE  Enrollments  MODIFY Semester VARCHAR(30);
-- 03 change the datatypes
ALTER TABLE Departments modify DepartmentName TEXT;
ALTER TABLE Course modify CourseName TEXT;
ALTER TABLE Students modify FirstName VARCHAR(100);
ALTER TABLE  Faculty modify  Email VARCHAR(150);
ALTER TABLE  Enrollments  modify Grade VARCHAR(15);
-- 04: Rename a column
ALTER TABLE Students RENAME COLUMN  DateOfBirth to  DOB ;
-- 05: Drop a column
ALTER TABLE departments drop column phoneNumber;
-- 06: Rename the table
alter table Students rename to StudentDetails;
-- 07: describe the structure of the new table
DESC StudentDetails;
/*'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(100)', 'YES', '', NULL, ''
'LastName', 'varchar(50)', 'YES', '', NULL, ''
'Email', 'varchar(100)', 'YES', '', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'gender', 'varchar(20)', 'YES', '', NULL, ''
'address', 'varchar(100)', 'YES', '', NULL, ''
*/

/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
-- already done
--2 Add a column Gender (CHAR(1)) to the Students table.
-- already done
--3 Add a column JoiningDate (DATE) to the Faculty table.
-- already done
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(150) to VARCHAR(200).
alter table Course modify CourseName varchar(200);
--5 Modify the column Location in the Departments table to VARCHAR(80).
alter table Departments modify location varchar(80);

--6 Rename the column Qualification in the Faculty table to Degree.
alter table departments modify location varchar(80);

--7 Rename the table Faculty to Teachers.

--8 Drop the column PhoneNumber from the Departments table.
alter table faculty rename to teachers;
--9 Drop the column Email from the Students table.
alter table studentDetails drop column email;
--10 Drop the column Duration from the Courses table.
alter table course drop column duration;
*/

SHOW TABLES; -- Before dropping the table
/*'course'
'departments'
'enrollments'
'faculty'
'studentdetails'*/

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table Enrollments;

SHOW TABLES; -- After dropping the table Enrollement and Course
/*'course'
'departments'
'faculty'
'studentdetails'*/
-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01