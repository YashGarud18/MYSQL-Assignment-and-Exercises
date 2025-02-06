-- -------------------Hospital Management System Database-------------------------

create database hospital;
use hospital;

-- -----------Patient Table-------------
create table patientxy(
patient_id int primary key,
Name varchar(50),
Age int,
Gender varchar(10),
address varchar(50)
);


insert into patientxy
values
(10,'yash',22,'male','104 ginger street'),
(12,'om',21,'male','tisgaown naka'),
(13,'anagha',21,'female','hamrapure, pen'),
(14,'ayush',21,'male','karjat'),
(15,'yash',23,'male','santosh nagar'),
(16,'yash',22,'male','104 ginger street'),
(17,'anagha',20,'female','hamrapure, pen'),
(18,'shraddha',21,'female','hamrapure, pen'),
(19,'archana',26,'male','hamrapure, pen'),
(0,'payal',21,'female','hamrapure, pen');

select*from patientxy;


-- -------------Doctor Table-----------------
create table doctor(
Doc_id int primary key,
Name varchar(50),
Age int,
specialization varchar(50),
salary varchar(20)
);

insert into doctor
values
(102,'yash',30,'neurologist',2000),
(103,'anagha',41,'eyes',20200),
(104,'shraddha',29,'heart specialist',44000),
(105,'om',39,'neurologist',22000),
(106,'ayush',31,'surgen',30100),
(107,'sachin',50,'orthopedics',2000),
(108,'archana',50,'Dermatology',2000),
(109,'priti',44,'ENT',5000),
(100,'payal',30,'Radiology',6000);

select*from doctor;
select Name, Age from doctor;
select * from doctor where salary=2000;

-- --------------Staff Table----------------
create table staff(
staff_id int primary key,
Name varchar(50),
Age int,
experience varchar(20),
salary varchar(20)
);

insert into staff
values
(1,'suresh',20,'2years',23000),
(2,'yash',30,'1.5years',20000),
(3,'anagha',41,'3years',21200),
(4,'shraddha',29,'2years',14000),
(5,'om',39,'2.1years',22000),
(6,'ayush',31,'2years',30100),
(7,'sachin',50,'1years',21000),
(8,'archana',50,'2years',21000),
(9,'priti',44,'6months',15000),
(10,'payal',30,'2years',16000);

select * from staff;
select * from staff where experience='2years';
select * from staff where salary=21000;

-- --------hospital Details Table--------------
create table hospital_detail(
Hospital_id int primary key,
Name varchar(50),
Address varchar(50),
type varchar(20),
No_of_Branches int not null
);

insert into hospital_detail
values
(201,'HS hospital','puna link road','Govt.',3),
(202,'YG hospital','santosh nagar, kalyan','Govt.',1),
(203,'OmSai hospital','tisgown naka','Private.',3),
(204,'Fidonal hospital','105\B Ginger street','Govt.',2),
(205,'Havells hospital','Gandhi road, near wine shop','Govt.',3),
(206,'logic hospital','hamrapur road, pen','Govt.',3),
(207,'sulabh hospital','B-street','Private.',4),
(208,'shanti hospital','puna road','Private.',1),
(209,'Eye hospital','link road, near sarovar hotel','Govt.',3),
(200,'HariOm hospital','B-wing, hariom street','Private',2)
;

select * from hospital_detail;


-- ---------------Ward_detail Table------------------------
create table ward_detail(
Ward_id int primary key,
Type varchar(50),
patient_id int,
Ac_or_NonAc varchar(10),
Amount int not null
);

insert into ward_detail
values
(1000,'private',2029,'Ac',2100),
(1001,'private',2028,'NonAc',2200),
(1002,'General',2027,'Ac',2300),
(1003,'private',2026,'NonAc',2000),
(1004,'General',2025,'NonAc',2080),
(1005,'General',2024,'NonAc',200),
(1006,'private',2023,'Ac',700),
(1007,'General',2022,'NonAc',2040),
(1008,'private',2021,'NonAc',900),
(1009,'General',2020,'Ac',300)
;

select *from ward_detail;