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
contact number(12) not null,
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

--DML

--inserting data
--branch

INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (1, 'Uttara', 'mr.X', 'Dhaka');
INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (2, 'Shibbari', 'mr.Y', 'Khulna');
INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (3, 'Lokkhipur', 'mr.W', 'Rajshahi');
INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (4, 'Shantinagar', 'mr.Z', 'Joypurhat');
INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (5, 'Dhanmondi', 'Mrs. A', 'Dhaka');
INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (6, 'Gulshan', 'Mr. B', 'Dhaka');
INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (7, 'Mirpur', 'Mrs. C', 'Dhaka');
INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (8, 'Mymensingh', 'Mr. D', 'Mymensingh');
INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (9, 'Sylhet', 'Mrs. E', 'Sylhet');
INSERT INTO branch (branch_id, branch_name, owner, city) VALUES (10, 'Chittagong', 'Mr. F', 'Chittagong');

--pharmacist

INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (1, 'mr.X', 'Owner', '01383479218', 1);
INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (2, 'rahim', 'distributer', '01523948812', 1);
INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (3, 'karim', 'helper', '01523982741', 1);
INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (4, 'mr.z', 'owner', '01717012970', 4);
INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (5, 'maruf', 'helper', '01712262970', 4);
INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (6, 'mr.y', 'owner', '01717882970', 2);
INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (7, 'mr.w', 'owner', '01717025970', 3);
INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (8, 'ms.A', 'helper', '01712232970', 2);
INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (9, 'mr.B', 'distributer', '01767898321', 3);
INSERT INTO pharmacist (p_id, name, position, contact, branch_id) VALUES (10, 'ms.C', 'owner', '01888811121', 5);

--medicine

INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (1, 'Napa', 'Navana', 'Fever', 100);
INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (2, 'Motigut', 'Navana', 'Gastric', 50);
INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (3, 'Antacid', 'Square', 'Gastric', 100);
INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (4, 'Slimfit', 'Beximco', 'PCOS', 200);
INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (5, 'Paracetamol', 'Square', 'Fever', 80);
INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (6, 'Omeprazole', 'Beximco', 'Gastric', 120);
INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (7, 'Amoxicillin', 'Incepta', 'Antibiotic', 150);
INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (8, 'Loratadine', 'Square', 'Allergy', 90);
INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (9, 'Aspirin', 'ACME', 'Pain Relief', 70);
INSERT INTO medicine (med_id, med_name, company, type, price) VALUES (10, 'Ibuprofen', 'ACME', 'Pain Relief', 200);

--customer

INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (1, 'Raha', 'Female', 23, 4);
INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (2, 'Ridi', 'Female', 22, 2);
INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (3, 'Rafi', 'Male', 33, 4);
INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (4, 'Rahi', 'Male', 43, 3);
INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (5, 'Farhan', 'Male', 28, 1);
INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (6, 'Nadia', 'Female', 35, 3);
INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (7, 'Sadia', 'Female', 27, 1);
INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (8, 'Sakib', 'Male', 31, 2);
INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (9, 'Tahmid', 'Male', 24, 4);
INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (10, 'Riya', 'Female', 29, 3);

--sales

INSERT INTO sale VALUES (1, 1, 1, 100, TO_DATE('01-01-2023', 'DD-MM-YYYY'));
INSERT INTO sale VALUES (2, 1, 3, 100, TO_DATE('01-04-2023', 'DD-MM-YYYY'));
INSERT INTO sale VALUES (3, 4, 1, 100, TO_DATE('04-01-2023', 'DD-MM-YYYY'));
INSERT INTO sale VALUES (5, 2, 4, 200, TO_DATE('01-11-2023', 'DD-MM-YYYY'));
INSERT INTO sale VALUES (6, 3, 2, 50, TO_DATE('15-02-2023', 'DD-MM-YYYY'));
INSERT INTO sale VALUES (7, 5, 5, 80, TO_DATE('20-03-2023', 'DD-MM-YYYY'));
INSERT INTO sale VALUES (8, 1, 6, 120, TO_DATE('10-02-2023', 'DD-MM-YYYY'));
INSERT INTO sale VALUES (9, 2, 1, 100, TO_DATE('05-03-2023', 'DD-MM-YYYY'));
INSERT INTO sale VALUES (10, 4, 3, 100, TO_DATE('25-01-2023', 'DD-MM-YYYY'));
INSERT INTO sale VALUES (11, 1, 2, 50, TO_DATE('12-04-2023', 'DD-MM-YYYY'));

--show tables

select * from branch;
select * from pharmacist;
select * from medicine;
select * from customer;
select * from sale;

select * from sale where amount = 100;

select name,contact,branch_id from pharmacist where position='owner';

-- nested query: get branch name for sale no = 7

select branch_name from branch where branch_id = (
	select branch_id from customer where c_id = (
		select c_id from sale where s_id = 7 ));

--update 

update branch set owner='Jewel' where branch_id=4;
update pharmacist set name='Jewel' where branch_id=4 and position='owner';

--delete

INSERT INTO customer (c_id, name, gender, age, branch_id) VALUES (11, 'Raya', 'Female', 19, 5);
delete from customer where c_id=11;

--union, intersect and except

select branch_name from branch where branch_name like '%s%' union select branch_name from branch where branch_name like '%l%';

select branch_name from branch where branch_name like '%s%' intersect select branch_name from branch where branch_name like '%l%';

select branch_name from branch where branch_name like '%s%' except select branch_name from branch where branch_name like '%l%';

--with clause

with max_price(val) as (select max(price) from medicine) select * from medicine,max_price where medicine.price = max_price.val;

--Aggregate Function

select count(*) from branch;

select count(branch_name) as total_no_of_branches from branch;

select count(distinct branch_name) as total_no_of_branches from branch;

select avg(price) from medicine;

select sum(amount) from sale;

select max(age) from customer;

select min(age) from customer;

--Group by and Having

select c_id,sum(amount) from sale group by c_id;

select c_id,sum(amount) from sale group by c_id having sum(amount)>100;


--and, or ,not

select * from branch where branch_name like '%a%' and branch_id in (select branch_id from customer where gender='Male');

--some/all/exists

select * from customer where age> some( select age from customer where age > 30 );
select * from customer where age> all( select age from customer where age < 30 );
select * from customer where age>20 and exists(select * from branch where owner like 'm%');

--join

select * from branch natural join pharmacist where branch_id=1;

select * from branch natural join pharmacist;

select branch_name,city,name,position,contact from branch join pharmacist on branch.branch_id = pharmacist.branch_id;

select branch_name,name from branch left outer join pharmacist using(branch_id);
select branch_name,name from branch right outer join pharmacist using(branch_id);
select branch_name,name from branch full outer join pharmacist using(branch_id);



-- PL-SQL

-- variable declaration and print, getting info of branch_number = 5

set serveroutput on
declare
  branch_name branch.branch_name%type;
  owner branch.owner%type;
  city branch.city%type;
begin
  select branch_name, owner, city into branch_name, owner, city from branch where branch_id = 5;
  dbms_output.put_line('Branch Name: ' || branch_name || ' Owner: ' || owner || ' City: ' || city);
end;
/

-- Insert

set serveroutput on
declare
  branch_id branch.branch_id%type := 11;
  branch_name branch.branch_name%type := 'Shantinagar';
  owner branch.owner%type := 'Raisa';
  city branch.city%type := 'Dhaka';
begin
  insert into branch values(branch_id, branch_name, owner, city);
end;
/

select * from branch;

-- Row Type

set serveroutput on
declare
  branch_row branch%rowtype;
begin
  select branch_name, owner, city into branch_row.branch_name, branch_row.owner, branch_row.city from branch where branch_id = 7;
  dbms_output.put_line('Branch Name: ' || branch_row.branch_name || ' Owner: ' || branch_row.owner || ' City: ' || branch_row.city);
end;
/


-- cursor
set serveroutput on
declare
  cursor c is select * from customer;
  c_row customer%rowtype;
begin
  open c;
  fetch c into c_row.c_id, c_row.name, c_row.gender, c_row.age, c_row.branch_id;
  while c%found loop
    dbms_output.put_line('Customer ID: ' || c_row.c_id || ' Name: ' || c_row.name || ' Gender: ' || c_row.gender);
    dbms_output.put_line('Row Count: ' || c%rowcount);
    fetch c into c_row.c_id, c_row.name, c_row.gender, c_row.age, c_row.branch_id;
  end loop;
  close c;
end;
/

-- For loop with extend() function

set serveroutput on
declare
  counter number;
  med_name medicine.med_name%type;
  TYPE ARR IS VARRAY(10) OF medicine.med_name%type;
  M_NAME ARR := ARR();
begin
  counter := 1;
  for x in 1..10 loop
    select med_name into med_name from medicine where med_id = x;
    M_NAME.EXTEND();
    M_NAME(counter) := med_name;
    counter := counter + 1;
  end loop;
  counter := 1;
  WHILE counter <= M_NAME.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(M_NAME(counter));
    counter := counter + 1;
  END LOOP;
end;
/


-- with extend()

set serveroutput on
declare
  counter number := 1;
  med_name medicine.med_name%type;
  TYPE ARR IS VARRAY(3) OF medicine.med_name%type;
  M_NAME ARR := ARR('Med 1', 'Med 2', 'Med 3');
begin
  counter := 1;
  for x in 1..3 loop
    select med_name into med_name from medicine where med_id = x;
    M_NAME(counter) := med_name;
    counter := counter + 1;
  end loop;
  counter := 1;
  WHILE counter <= M_NAME.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(M_NAME(counter));
    counter := counter + 1;
 End loop;
end;
/



--IF/ELSEIF/ELSE
declare
 counter Number:=1;
 med_name medicine.med_name%type;
 TYPE ARR IS VARRAY(3) OF medicine.med_name%type;
 M_NAME ARR:=ARR('Med 1','Med 2','Med 3');
begin
 counter:=1;
 for x in 1..3
 loop
	select med_name into med_name from medicine where med_id = x;
	if med_name = 'Napa'
	  then
	  dbms_output.put_line(med_name||' is for fever');
	elsif med_name = 'Motigut'
	  then
	  dbms_output.put_line(med_name||' is for gastric');
	else
        dbms_output.put_line(med_name||' is for other purpose');
        end if;
  end loop;
end;
/


-- procedure

create or replace procedure proc(
  var1 IN number,
  var2 OUT varchar
)
as
begin
  select name into var2 from pharmacist where p_id = var1;
  dbms_output.put_line('Pharmacist''s name: ' || var2 || ' Pharmacist ID: ' || var1);
end;
/


set serveroutput on;
declare
  p_id pharmacist.p_id%type := 5;
  name pharmacist.name%type;
begin
  proc(p_id, name);
end;
/


-- function

set serveroutput on
create or replace function func(var1 in varchar) return varchar AS
  name pharmacist.name%type;
begin
  select name into name from pharmacist where p_id = var1;
  return name;
end;
/

set serveroutput on
declare
  name varchar(30);
begin
  name := func(4);
  dbms_output.put_line('name is: ' || name);
end;
/


drop procedure proc;
drop function func;

--Retrieve the details of all sales along with the customer and medicine information

select s.s_id, c.name as customer_name,m.med_name,s.amount,s."Date"
from sale s
join customer c on s.c_id = c.c_id
join medicine m on s.med_id = m.med_id;



--Retrieve the details of pharmacists along with their corresponding branch details:

select p.name as pharmacist_name, p.position, p.contact, b.branch_name, b.city
from pharmacist p
join branch b using(branch_id);



--Retrieve the sales made by customers of a specific branch:

select s.s_id, c.name as customer_name, m.med_name, s.amount, s."Date" from sale s 
join customer c using(c_id)
join medicine m using(med_id)
where c.branch_id = 4;



--To retrieve the customers for each branch individually

select b.branch_name, c.c_id, c.name AS customer_name, c.gender, c.age
FROM customer c
JOIN branch b ON c.branch_id = b.branch_id
ORDER BY b.branch_id, c.c_id;

--or

select b.branch_name, listagg(c.name, ', ') within group (order by c.name) as customers
FROM customer c
JOIN branch b ON c.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name;



--Retrieve the names of customers who have made a purchase of a medicine with a price higher than the average price:

select c.name as customer_name from customer c where c.c_id in ( select s.c_id from sale s where s.amount> (select avg(price) from medicine));



--Retrieve the branch names and the total number of sales made in each branch

select branch_name, (select count(*) from sale s join customer c on s.c_id = c.c_id
where c.branch_id = b.branch_id) as total_sales from branch b;

--it will show all
--later will show only the ones that participated

select b.branch_name, count(*) as sales_count from sale s 
join customer c on c.c_id = s.c_id
join branch b on b.branch_id = c.branch_id 
group by b.branch_name;



--Retrieve the total amount of sales in respective branches;

select b.branch_name, ( select sum(amount) from sale s join customer c on c.c_id = s.c_id 
where c.branch_id = b.branch_id) as total_amount from branch b;

--or

select b.branch_name, sum(amount) as total_amount
from sale s
join customer c using(c_id)
join branch b using(branch_id)
group by b.branch_name;



--Retrieve the customer names and the total amount spent by each customer on medicine purchases:

select c.name, ( select sum(amount) from sale s where s.c_id = c.c_id) as total_purchase from customer c;

select c.name, sum(amount) as total_purchase
from sale s
join customer c on c.c_id = s.c_id
group by c.name; 



--Retrieves all customers who belong to branches located in Dhaka

select * from customer c where branch_id in (select branch_id from branch where city='Dhaka');



--Retrieves all male customers who are at least 30 years old.

select * from customer where gender='Male' and age>=30;



-- Retrieves the names of customers from Branch 1 and Branch 2

 select * from customer where branch_id = 1 union select * from customer where branch_id = 2;

--or
SELECT *
FROM customer
WHERE branch_id = 1 OR branch_id = 2;

--or
SELECT *
FROM customer
WHERE branch_id in(1,2);


--Retrieve the branch names along with the total sales amount and the average sales amount for each branch:

select b.branch_name, sum(s.amount) as total_sales, avg(s.amount) as average_sale from branch b join customer c using(branch_id) join sale s using(c_id) group by b.branch_name;



--Retrieves the names of customers from Branch 1, excluding those who are female.

select * from customer where branch_id = 1 except select * from customer where gender = 'Female';

select * from customer where branch_id = 1 and gender = 'Male';



--Retrieves all customers who have made sales.

select * from customer c where exists( select * from sale s where s.c_id = c.c_id);


--Retrieves all customers who have not made any sales.

select * from customer c where not exists( select * from sale s where s.c_id = c.c_id);


--Retrieve all the customer name who bought the medicine napa

select c.name from customer c where c_id in (select c_id from sale join medicine using(med_id) where med_name = 'Napa');

select name from customer where c_id in (select c_id from sale where med_id = (select med_id from medicine where med_name = 'Napa'));


--find the sales happened between two dates

select s.s_id,c.name as customer_name, m.med_name, s.amount, s."Date"
from sale s
join customer c using(c_id)
join medicine m using(med_id)
where s."Date" between to_date('2023-01-01','YYYY-MM-DD') and to_date('2023-03-31','YYYY-MM-DD');



-- retrieve the names of customers who made a purchase between specified dates

select c.name from customer c where c.c_id in (
  select s.c_id from sale s 
    where s."Date" between to_date('2023-01-01','YYYY-MM-DD') and to_date('2023-03-31','YYYY-MM-DD'));


--
--PL_SQL
--


-- PL/SQL procedure to calculate the total sales amount for each branch

CREATE OR REPLACE PROCEDURE calculate_total_sale AS
   total_sales NUMBER;
BEGIN
   FOR branch_rec IN (SELECT DISTINCT b.branch_id, b.branch_name FROM branch b)
   LOOP
      total_sales := 0;
      FOR sale_rec IN (SELECT s.amount FROM sale s JOIN customer c ON s.c_id = c.c_id WHERE c.branch_id = branch_rec.branch_id)
      LOOP
         total_sales := total_sales + sale_rec.amount;
      END LOOP;
      DBMS_OUTPUT.PUT_LINE('Total sales for ' || branch_rec.branch_name || ': ' || total_sales);
   END LOOP;
END;
/

SET SERVEROUTPUT ON
BEGIN
   calculate_total_sale();
END;
/



-- Retrieve all the customer names who bought the medicine "Napa"

SET SERVEROUTPUT ON
DECLARE
   CURSOR cr IS 
      SELECT c.name FROM customer c
      JOIN sale s USING (c_id)
      JOIN medicine m USING (med_id)
      WHERE m.med_name = 'Napa';
   customer_name cr%ROWTYPE;
BEGIN
   OPEN cr;
   LOOP
      FETCH cr INTO customer_name;
      EXIT WHEN cr%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Customer name: ' || customer_name.name);
   END LOOP;
   CLOSE cr;
END;
/

-- Retrieve all the customer names who bought the given medicine

CREATE OR REPLACE PROCEDURE get_customer_name(med_name IN medicine.med_name%TYPE) AS
   CURSOR cr IS
      SELECT DISTINCT c.name FROM customer c
      JOIN sale s USING (c_id)
      JOIN medicine m USING (med_id)
      WHERE m.med_name = med_name;

   customer_name customer.name%TYPE;
BEGIN
   OPEN cr;
   LOOP
      FETCH cr INTO customer_name;
      EXIT WHEN cr%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Customer name: ' || customer_name);
   END LOOP;
   CLOSE cr;
END;
/

SET SERVEROUTPUT ON
DECLARE
   med medicine.med_name%TYPE;
BEGIN
   med := 'Napa';
   get_customer_name(med);
END;
/

-- PL/SQL function to retrieve the count of customers in a specific branch

CREATE OR REPLACE FUNCTION count_customer(b_name IN branch.branch_name%TYPE) RETURN NUMBER AS
   customer_count NUMBER;
BEGIN
   SELECT COUNT(*) INTO customer_count FROM customer c JOIN branch b USING (branch_id) WHERE b.branch_name = b_name;
   RETURN customer_count;
END;
/

SET SERVEROUTPUT ON
DECLARE
   customer_count NUMBER;
BEGIN 
   customer_count := count_customer('Uttara');
   DBMS_OUTPUT.PUT_LINE('Total customer: ' || customer_count);
END;
/

-- PL/SQL loop to display the names of customers along with their branch names

SET SERVEROUTPUT ON
DECLARE
   customer_name customer.name%TYPE;
   branch_name branch.branch_name%TYPE;
BEGIN
   FOR cr IN (SELECT c.name, b.branch_name FROM customer c JOIN branch b USING (branch_id))
   LOOP
      customer_name := cr.name;
      branch_name := cr.branch_name;
      DBMS_OUTPUT.PUT_LINE('Customer: ' || customer_name || '  Branch: ' || branch_name);
   END LOOP;
END;
/

-- PL/SQL cursor to retrieve the details of pharmacists in a specific branch

SET SERVEROUTPUT ON
DECLARE
   CURSOR c IS 
      SELECT p.name, p.position, p.contact, b.branch_name
      FROM pharmacist p
      JOIN branch b USING (branch_id)
      WHERE b.branch_name = 'Uttara';
   p_rec c%ROWTYPE;
BEGIN
   OPEN c;
   LOOP 
      FETCH c INTO p_rec;
      EXIT WHEN c%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Pharmacist Name: ' || p_rec.name || ' Position: ' || p_rec.position || ' Contact: ' || p_rec.contact || ' Branch_name: ' || p_rec.branch_name);
   END LOOP;
   CLOSE c;
END;
/

-- Retrieve the names of customers who made a purchase between specified dates

DECLARE
   v_customer_name customer.name%TYPE;
   v_sale_date sale."Date"%TYPE;
BEGIN
   FOR sale_rec IN (SELECT c.name, s."Date"
                    FROM sale s
                    JOIN customer c ON s.c_id = c.c_id
                    WHERE s."Date" BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-03-31', 'YYYY-MM-DD'))
   LOOP
      v_customer_name := sale_rec.name;
      v_sale_date := sale_rec."Date";
      
      DBMS_OUTPUT.PUT_LINE('Customer Name: ' || v_customer_name || ', Sale Date: ' || v_sale_date);
   END LOOP;
END;
/








