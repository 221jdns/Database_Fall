CREATE DATABASE LAB2;

CREATE TABLE countries(
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT,
    population INT
);

INSERT INTO countries (country_name, region_id, population)
VALUES('kazakhstan','central_asia', 19000000);

INSERT INTO countries(country_id, country_name) VALUES (2, 'USA');

INSERT INTO countries(region_id) VALUES (NULL);

INSERT INTO countries(country_id, country_name, region_id, population) VALUES ('53', 'UZBEKISTNAN',32,8333),
                                                                              ('32','SDW',22,5563222),
                                                                              ('42','SOMECOUNTRY',534,5252666);
ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new(LIKE countries INCLUDING ALL);

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries  SET region_id = 1 WHERE region_id IS NULL;

SELECT country_name, population * 1.1 AS "New Population" FROM countries;

DELETE FROM countries WHERE POPULATION <100000;

DELETE FROM countries_new USING countries WHERE countries_new.country_id = countries.country_id
RETURNING countries_new.*;

DELETE FROM countries RETURNING *;




()



