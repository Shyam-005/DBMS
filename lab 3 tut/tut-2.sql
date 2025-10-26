-- STUDENT NAME: Shyam Sundar.A
-- USN: 1RUA24BCA0084
-- SECTION: A
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
       create database student;
       use student;
       create table stu(
       stid int primary key,
       sname varchar(20),
       email varchar(30)
       );
       Alter table stu add ( Marks_1 int , Marks_2 int , Marks_3 int );
       DESC stu;

insert into stu values(107 ,'Shyam Sundar.A', 'shyamsundara07@gmail.com',97 , 94 ,95 );
insert into stu values(116,'Rio ', 'rioraj623@gmail.com' ,97 , 33 ,79 );
insert into stu values(108,'Alen','alenwalker5363@gmail.com' ,74 , 44 ,95 );
insert into stu values(113,'Adhitya', 'adhityaj888@gmail.com'  ,97 , 77,68 );
insert into stu values(129 ,'Yash', 'yashrocks9292@gmail.com' ,97 , 89,78 );
insert into stu values(137,'Rithvik', 'rithvikk444@gmail.com'  ,83 , 56,79 );
insert into stu values(145 ,'Dharma', 'dharma679@gmail.com' ,95 , 28 ,65 );
       Select * from stu;

alter table stu add(Average int ,Total int ,Result varchar(10));
Select * from stu;

update stu set Average = (Marks_1 + Marks_2 + Marks_3)/3 ;
Select * from stu;

update stu set Total = Marks_1 + Marks_2 + Marks_3 ;
Select * from Stu;

update stu set  Result = 'Pass'
where Marks_1 >=35 and Marks_2 >=35 and Marks_3 >=35 ;

update stu set  Result = 'Fail'
where Marks_1 < 35 or Marks_2 < 35 or Marks_3 < 35 ;

Select * from stu;

       
       