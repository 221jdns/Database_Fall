CREATE INDEX countries_name ON coumtries (name);

CREATE INDEX employees_name_surname ON employees (name,surname);

CREATE UNIQUE INDEX idx_employees_salary_range ON employees (salary);

CREATE INDEX employees_substring ON employees (substring(name FROM 1 FOR 4));

CREATE INDEX employees_departments_budget_salary ON employees (salary) INCLUDE (department_id);
CREATE INDEX idx_department_budget ON departments(budget);