CREATE PROCEDURE increase_value(INOUT param_value INT)
LANGUAGE plpgsql
AS $$
BEGIN
    param_value := param_value + 10;
end;
$$;


CREATE PROCEDURE compare_numbers(
    IN num1 INT,
    IN num2 INT,
    OUT result TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF num1 > num2 THEN
        result := 'Greater';
    ELSIF num1 = num2 THEN
        result := 'Equal';
    ELSE
        result := 'Lesser';
    END IF;
END;
$$;


CREATE PROCEDURE number_series(
    IN n INT,
    OUT series TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE
    i INT;
BEGIN;
    series := '';
    FOR i IN 1..n LOOP
        series := series || i || ' ';
    END LOOP;
    series := TRIM(series);
END;
$$;


CREATE PROCEDURE find_employee(IN emp_name TEXT, OUT emp_details TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT 'ID: ' || id || ', Name: ' || name || ', Position: ' || position
    INTO emp_details
    FROM employees
    WHERE name = emp_name;
END;
$$;


CREATE OR REPLACE FUNCTION list_products(category_name TEXT)
RETURNS TABLE(product_id INTEGER, product_name TEXT, price NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, price
    FROM products
    WHERE category = category_name;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION calculate_bonus(employee_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    SELECT salary * 0.1 INTO bonus
    FROM employees
    WHERE id = employee_id;
    RETURN bonus;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION update_salary(employee_id INTEGER)
RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(employee_id);
    UPDATE employees
    SET salary = salary + bonus
    WHERE id = employee_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION complex_calculation(num INTEGER, str VARCHAR)
RETURNS TEXT AS $$
DECLARE
    numeric_result INTEGER;
    string_result VARCHAR;
BEGIN
    <<numeric_block>>
    BEGIN
        numeric_result := num * 2;
    END numeric_block;

    <<string_block>>
    BEGIN
        string_result := UPPER(str);
    END string_block;

    RETURN CONCAT('Number: ', numeric_result, ', String: ', string_result);
END;
$$ LANGUAGE plpgsql;














