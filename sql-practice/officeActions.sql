------------------------------------------------------- (Employees)

-- 1. (Add "Michael Scott" to your list of employees in the "Management" department in the role of "Regional Manager")
INSERT INTO employees(first_name, last_name, departments, roles)
VALUES("Michael", "Scott", "Management", "Regional Manager");

-- 2. (Add "Dwight Schrute" to your list of employees in the "Sales" department in the role of "Assistant Regional Manager")
INSERT INTO employees(first_name, last_name, departments, roles)
VALUES("Dwight", "Schrute", "Sales", "Assistant Regional Manager");

-- 3. (Add "Jim Halpert" to your list of employees in the "Sales" department in the role of "Sales Representative")
INSERT INTO employees(first_name, last_name, departments, roles)
VALUES("Jim", "Halpert", "Sales", "Sales Representative");

-- 4. (Add "Pam Beesly" to your list of employees in the "Reception" department in the role of "Receptionist")
INSERT INTO employees(first_name, last_name, departments, roles)
VALUES("Pam", "Beesly", "Reception", "Receptionist");

-- 5. (Add "Kelly Kapoor" to your list of employees in the "Product Oversight" department in the role of "Customer Service Representative")
INSERT INTO employees(first_name, last_name, departments, roles)
VALUES("Kelly", "Kapoor", "Product Oversight", "Customer Service Representative");

-- 6. (Add "Angela Martin" to your list of employees in the "Accounting" department in the role of "Head of Accounting")
INSERT INTO employees(first_name, last_name, departments, roles)
VALUES("Angela", "Martin", "Accounting", "Head of Accounting");

-- 7. (Add "Roy Anderson" to your list of employees in the "Warehouse" department in the role of "Warehouse Staff")
INSERT INTO employees(first_name, last_name, departments, roles)
VALUES("Roy", "Anderson", "Warehouse", "Warehouse Staff");

-- 9. ("Ryan Howard" is hired in the "Reception" department as a "Temp" role.)
INSERT INTO employees(first_name, last_name, departments, roles)
VALUES("Ryan", "Howard", "Reception", "Temp");

-- 15. ("Jim Halpert" is promoted to the role of "Assistant Regional Manager")
UPDATE employees
SET roles = 'Assistant Regional Manager'
WHERE first_name = 'Jim' AND last_name = 'Halpert';

-- 16. ("Ryan Howard" is promoted to the "Sales" department as the role of "Sales Representative")
UPDATE employees
SET roles = "Sales Representative", departments = "Sales"
WHERE first_name = "Ryan" AND last_name = "Howard";


------------------------------------------------------- (relationships)

-- -- -- 8. ("Roy Anderson" and "Pam Beesly" are in a romantic relationship.)
WITH roy_id AS (
    SELECT id FROM employees WHERE first_name = 'Roy' AND last_name = 'Anderson'
), pam_id AS (
    SELECT id FROM employees WHERE first_name = 'Pam' AND last_name = 'Beesly'
)
INSERT INTO relationships (employee1_id, employee2_id)
SELECT roy_id.id, pam_id.id
FROM roy_id, pam_id;

-- -- 20. ("Ryan Howard" and "Kelly Kapoor" are in a romantic relationship)
WITH ryan_id AS (
    SELECT id FROM employees WHERE first_name = "Ryan" AND last_name = "Howard"
), kelly_id AS (
    SELECT id FROM employees WHERE first_name = "Kelly" AND last_name = "Kapoor"
)
INSERT INTO relationships (employee1_id, employee2_id)
SELECT ryan_id.id, kelly_id.id
FROM ryan_id, kelly_id;

-- -- 23. ("Roy Anderson" and "Pam Beesly" are NO LONGER in a romantic relationship)
DELETE FROM relationships
WHERE employee1_id = (SELECT id FROM employees WHERE first_name = 'Roy' AND last_name = 'Anderson')
AND employee2_id = (SELECT id FROM employees WHERE first_name = 'Pam' AND last_name = 'Beesly');


------------------------------------------------------- (office_parties)
-- 10. (An onsite office party is scheduled with a budget of $100.00)
INSERT INTO office_parties(name, location, budget, onsite)
VALUES("First Party", "PA", 100, TRUE);


------------------------------------------------------- (performance_reviews)
-- 11. ("Dwight Schrute" gets a performance review with a score of 3.3)
INSERT INTO performance_reviews(employee_id, score)
SELECT id, 3.3 FROM employees
WHERE first_name = "Dwight" AND last_name = "Schrute";

-- 12. ("Jim Halpert"'s past performance review needs to be changed to a score of 9.3)
INSERT INTO performance_reviews(employee_id, score)
SELECT id, 4.2 FROM employees
WHERE first_name = "Jim" AND last_name = "Halpert";

-- 13. ("Dwight Schrute"'s past performance review needs to be changed to a score of 9.0)
UPDATE performance_reviews
SET score = 9.0
WHERE employee_id = (SELECT id FROM employees WHERE first_name = "Dwight"
AND last_name = "Schrute");

-- 14. ("Jim Halpert"'s past performance review needs to be changed to a score of 9.3)
UPDATE performance_reviews
SET score = 9.3
WHERE employee_id = (SELECT id FROM employees WHERE first_name = "Jim"
AND last_name = "Halpert");


---------------------------------------------------------- (Deleting Ryan from everything)
-- 26. ("Ryan Howard" quits the office (make sure to remove his relationships and performance reviews if he has any)
BEGIN;
DELETE FROM performance_reviews WHERE employee_id = (SELECT id FROM employees WHERE first_name = "Ryan" AND last_name = "Howard");
DELETE FROM relationships WHERE employee1_id = (SELECT id FROM employees WHERE first_name = "Ryan" AND last_name = "Howard") OR employee2_id = (SELECT id FROM employees WHERE first_name = "Ryan" AND last_name = "Howard");
DELETE FROM employees WHERE first_name = "Ryan" AND last_name = "Howard";
COMMIT;
