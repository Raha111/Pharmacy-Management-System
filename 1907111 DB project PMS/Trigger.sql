--This trigger sets the default value for the city column as "Unknown" before inserting a new row into the branch table.

CREATE OR REPLACE TRIGGER trg_branch_insert
BEFORE INSERT ON branch
FOR EACH ROW
BEGIN
    IF :NEW.city IS NULL THEN
        :NEW.city := 'Unknown';
    END IF;
END;
/



--This trigger displays a message indicating that a pharmacist's information has been updated whenever a row is updated in the pharmacist table.

CREATE OR REPLACE TRIGGER trg_pharmacist_update
AFTER UPDATE ON pharmacist
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pharmacist information updated: ' || :NEW.name);
END;
/


--This trigger checks if the price of a medicine is negative and raises an exception if it is.

CREATE OR REPLACE TRIGGER trg_medicine_price_check
BEFORE INSERT OR UPDATE ON medicine
FOR EACH ROW
BEGIN
    IF :NEW.price < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid medicine price. Price cannot be negative.');
    END IF;
END;
/


--This trigger prevents the deletion of a customer if their age is below 18 and raises an exception.


CREATE OR REPLACE TRIGGER trg_customer_delete
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    IF :OLD.age < 18 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Cannot delete customer. Age is below 18.');
    END IF;
END;
/



--This trigger updates the total sales amount for a branch whenever a new sale is inserted into the sale table.



CREATE OR REPLACE TRIGGER trg_sale_insert
AFTER INSERT ON sale
FOR EACH ROW
BEGIN
    UPDATE branch
    SET total_sales = total_sales + :NEW.amount
    WHERE branch_id = (SELECT branch_id FROM customer WHERE c_id = :NEW.c_id);
END;
/



-- This trigger deletes all customers from the customer table that belong to the branch being deleted.


CREATE OR REPLACE TRIGGER trg_branch_delete
AFTER DELETE ON branch
FOR EACH ROW
BEGIN
    DELETE FROM customer WHERE branch_id = :OLD.branch_id;
END;
/



--This trigger deletes all sales records of a customer when that customer is deleted.


CREATE OR REPLACE TRIGGER trg_customer_delete
AFTER DELETE ON customer
FOR EACH ROW
BEGIN
    DELETE FROM sale WHERE c_id = :OLD.c_id;
END;
/


--This trigger updates the total sales amount for a branch when a new sale record is inserted.

CREATE OR REPLACE TRIGGER trg_sale_insert
AFTER INSERT ON sale
FOR EACH ROW
BEGIN
    UPDATE branch SET total_sales = total_sales + :NEW.Amount WHERE branch_id = (SELECT branch_id FROM customer WHERE c_id = :NEW.c_id);
END;
/


--This trigger updates the total sales amount for a branch when a sale record is updated.


CREATE OR REPLACE TRIGGER trg_sale_update
AFTER UPDATE ON sale
FOR EACH ROW
BEGIN
    UPDATE branch SET total_sales = total_sales - :OLD.Amount + :NEW.Amount WHERE branch_id = (SELECT branch_id FROM customer WHERE c_id = :NEW.c_id);
END;
/


--This trigger prevents the deletion of a medicine if it is associated with any sale records.


CREATE OR REPLACE TRIGGER trg_medicine_delete
BEFORE DELETE ON medicine
FOR EACH ROW
DECLARE
    v_sale_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_sale_count FROM sale WHERE med_id = :OLD.med_id;
    IF v_sale_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot delete medicine. It is associated with sale records.');
    END IF;
END;
/








