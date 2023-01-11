-- Creating tables

-- 1. (You are the manager of an office that sells paper. You want to keep track of all your employees, their first names, last names, departments, and roles in the office.)
CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    departments VARCHAR(100),
    roles VARCHAR(100)
);

-- -- 2. (You also want to keep track of all romantic relationships between employees in the office.)
CREATE TABLE relationships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee1_id INTEGER,
    employee2_id INTEGER,
    FOREIGN KEY(employee1_id) REFERENCES employees(id),
    FOREIGN KEY(employee2_id) REFERENCES employees(id)
);

-- -- 3. (You also want to record performance reviews. Each performance review should record the person that the review was for and a score out of 10.)
CREATE TABLE performance_reviews (
    id INTEGER PRIMARY KEY,
    employee_id INTEGER,
    score INTEGER,
    FOREIGN KEY(employee_id) REFERENCES employees(id)
);

-- -- 4. (Your office holds regular office parties. Each party gets its own budget and can be an onsite or offsite party.)
CREATE TABLE office_parties (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(100),
    budget INTEGER,
    onsite BOOLEAN
);
