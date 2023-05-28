drop table sale;
drop table customer;
drop table pharmacist;
drop table branch;
drop table medicine;

set linesize 200;
set pagesize 100;

create table branch(
branch_id number(10) not null,
branch_name varchar(50) not null,
owner varchar(40) not null,
city varchar(20),
primary key(branch_id)
);

create table Pharmacist(
p_id number(10) not null,
name varchar(40) not null,
position varchar(40),
contact number(11) not null,
branch_id number(10) not null,
primary key(p_id),
foreign key(branch_id) references branch(branch_id)
);

create table medicine(
med_id number(10) not null,
med_name varchar(40) not null,
Company varchar(40),
Type varchar(50),
Price number(10,2) not null,
primary key(med_id)
);

create table customer(
c_id number(10) not null,
name varchar(30) not null,
gender varchar(20),
Age number(10),
branch_id number(10) not null,
primary key(c_id),
foreign key(branch_id) references branch(branch_id)
);

create table sale(
S_id number(10) not null,
C_id number(10) not null,
med_id number(10) not null,
Amount number(10,2) not null,
"Date" DATE not null,
primary key (S_id),
foreign key(c_id) references customer(c_id),
foreign key(med_id) references medicine(med_id)
);

desc branch;
desc pharmacist;
desc customer;
desc medicine;
desc sale;

--add column location to table branch

alter table branch add location varchar(20);
desc branch;

--modify location domain to varchar to number

alter table branch modify location number(10);
desc branch;

--Rename location to street_no

alter table branch rename column location to street_no;
desc branch;

--drop column street_no

alter table branch drop column street_no;
desc branch;

