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



