CREATE DATABASE hr_management;
USE hr_management;

-- 1. Leave Types (Category)
CREATE TABLE leave_types (
    leave_type_id INT PRIMARY KEY AUTO_INCREMENT,
    leave_type_name VARCHAR(50) NOT NULL,
    max_days_per_year INT,
    description TEXT
);

-- 2. Job Positions
CREATE TABLE job_positions (
    position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_title VARCHAR(100) NOT NULL,
    job_grade VARCHAR(10),
    basic_salary DECIMAL(15, 2),
    description TEXT
);

-- 3. Departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    department_code VARCHAR(10),
    location VARCHAR(255),
    manager_id INT NULL, -- Self-reference for manager
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Employees (Central Table)
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_code VARCHAR(20) UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    phone VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    hire_date DATE,
    department_id INT,
    position_id INT,
    manager_id INT NULL,
    employment_status VARCHAR(20),
    national_id VARCHAR(50),
    photo_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (position_id) REFERENCES job_positions(position_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

-- Update Departments to link manager_id back to employees
ALTER TABLE departments ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

-- 5. Recruitment
CREATE TABLE recruitment (
    candidate_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    applied_position_id INT,
    application_date DATE,
    resume_path VARCHAR(255),
    interview_status VARCHAR(50),
    hiring_status VARCHAR(50),
    FOREIGN KEY (applied_position_id) REFERENCES job_positions(position_id)
);

-- 6. Attendance
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    attendance_date DATE,
    check_in_time TIME,
    check_out_time TIME,
    work_hours DECIMAL(4, 2),
    status VARCHAR(20),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 7. Payroll
CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    pay_period_month VARCHAR(20),
    pay_period_year INT,
    basic_salary DECIMAL(15, 2),
    allowance DECIMAL(15, 2) DEFAULT 0,
    overtime_pay DECIMAL(15, 2) DEFAULT 0,
    deduction DECIMAL(15, 2) DEFAULT 0,
    tax_amount DECIMAL(15, 2) DEFAULT 0,
    net_salary DECIMAL(15, 2),
    payment_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 8. Training Records
CREATE TABLE training_records (
    training_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    training_name VARCHAR(150),
    provider_name VARCHAR(150),
    start_date DATE,
    end_date DATE,
    completion_status VARCHAR(50),
    certificate_path VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 9. Performance Reviews
CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    review_date DATE,
    review_period VARCHAR(50),
    reviewer_id INT,
    score INT,
    comments TEXT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (reviewer_id) REFERENCES employees(employee_id)
);

-- 10. Leave Requests
CREATE TABLE leave_requests (
    leave_request_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    leave_type_id INT,
    start_date DATE,
    end_date DATE,
    total_days INT,
    reason TEXT,
    approval_status VARCHAR(20),
    approved_by INT NULL,
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_types(leave_type_id),
    FOREIGN KEY (approved_by) REFERENCES employees(employee_id)
);

-- Data for Leave Types
INSERT INTO leave_types (leave_type_name, max_days_per_year) VALUES ('Casual Leave', 10), ('Medical Leave', 15);

-- Data for Job Positions
INSERT INTO job_positions (position_title, job_grade, basic_salary) VALUES ('Software Engineer', 'B1', 1200000), ('HR Manager', 'M1', 1500000);

-- Data for Departments
INSERT INTO departments (department_name, department_code, location) VALUES ('IT Department', 'IT001', 'Floor 4'), ('HR Department', 'HR001', 'Floor 2');

-- Data for Employees
INSERT INTO employees (employee_code, first_name, last_name, gender, email, department_id, position_id, employment_status) 
VALUES 
('EMP-001', 'Aung', 'Kyaw', 'Male', 'aungkyaw@gmail.com', 1, 1, 'Active'),
('EMP-002', 'Su', 'Su', 'Female', 'susu@gmail.com', 2, 2, 'Active');

-- Data for Payroll
INSERT INTO payroll (employee_id, pay_period_month, pay_period_year, basic_salary, net_salary) 
VALUES (1, 'April', 2026, 1200000, 1150000);

-- Data for Attendance
INSERT INTO attendance (employee_id, attendance_date, check_in_time, check_out_time, status) 
VALUES (1, '2026-04-26', '09:00:00', '17:00:00', 'Present');

SHOW TABLES;

SELECT * FROM departments;
SELECT * FROM job_positions;
SELECT * FROM employees;

SELECT 
    e.employee_code AS 'ID',
    CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
    d.department_name AS 'Department',
    j.position_title AS 'Job Position',
    j.basic_salary AS 'Salary'
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN job_positions j ON e.position_id = j.position_id;