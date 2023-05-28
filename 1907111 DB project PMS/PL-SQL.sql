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


