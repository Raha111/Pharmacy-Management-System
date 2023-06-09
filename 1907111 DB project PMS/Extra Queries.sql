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





