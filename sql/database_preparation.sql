CREATE DATABASE learning_improvement_dw;

USE learning_improvement_dw;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    role VARCHAR(50),
    hire_date DATE,
    outlet_id INT,
    status VARCHAR(20)
);

CREATE TABLE outlets (
    outlet_id INT PRIMARY KEY AUTO_INCREMENT,
    outlet_name VARCHAR(100),
    city VARCHAR(50),
    open_date DATE
);

CREATE TABLE trainings (
    training_id INT PRIMARY KEY AUTO_INCREMENT,
    training_name VARCHAR(100),
    training_type VARCHAR(50),
    duration_days INT,
    created_at DATE
);

CREATE TABLE training_participants (
    participant_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    training_id INT,
    training_date DATE,
    score DECIMAL(5,2),
    
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (training_id) REFERENCES trainings(training_id)
);

CREATE TABLE performance (
    performance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    date DATE,
    service_time_avg DECIMAL(5,2), -- dalam menit
    orders_handled INT,
    error_count INT,
    
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE operations (
    operation_id INT PRIMARY KEY AUTO_INCREMENT,
    outlet_id INT,
    date DATE,
    total_orders INT,
    avg_wait_time DECIMAL(5,2),
    peak_hour VARCHAR(20),
    
    FOREIGN KEY (outlet_id) REFERENCES outlets(outlet_id)
);

CREATE TABLE complaints (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,
    outlet_id INT,
    employee_id INT,
    complaint_date DATE,
    complaint_type VARCHAR(100),
    description TEXT,
    
    FOREIGN KEY (outlet_id) REFERENCES outlets(outlet_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- INPUT DATA

INSERT INTO employees (name, role, hire_date, outlet_id, status) VALUES
-- Outlet 1 (8 orang)
('Andi Saputra', 'Crew', '2024-01-10', 1, 'Active'),
('Budi Santoso', 'Crew', '2024-02-15', 1, 'Active'),
('Citra Lestari', 'Cashier', '2024-03-01', 1, 'Active'),
('Dewi Anggraini', 'Crew', '2024-01-25', 1, 'Active'),
('Eko Prasetyo', 'Kitchen', '2024-02-05', 1, 'Active'),
('Fajar Nugroho', 'Crew', '2024-03-12', 1, 'Active'),
('Gina Putri', 'Cashier', '2024-01-18', 1, 'Active'),
('Hadi Wijaya', 'Supervisor', '2023-12-01', 1, 'Active'),

-- Outlet 2 (12 orang)
('Indra Kurniawan', 'Crew', '2024-01-08', 2, 'Active'),
('Joko Susilo', 'Kitchen', '2024-02-20', 2, 'Active'),
('Kartika Sari', 'Cashier', '2024-03-03', 2, 'Active'),
('Lina Marlina', 'Crew', '2024-01-30', 2, 'Active'),
('Maman Setiawan', 'Crew', '2024-02-11', 2, 'Active'),
('Nina Oktaviani', 'Cashier', '2024-03-15', 2, 'Active'),
('Oki Saputra', 'Kitchen', '2024-01-22', 2, 'Active'),
('Putri Ayu', 'Crew', '2024-02-27', 2, 'Active'),
('Rudi Hartono', 'Crew', '2024-03-10', 2, 'Active'),
('Siti Aminah', 'Cashier', '2024-01-17', 2, 'Active'),
('Tono Wibowo', 'Crew', '2024-02-14', 2, 'Active'),
('Umar Faruq', 'Supervisor', '2023-11-20', 2, 'Active'),

-- Outlet 3 (10 orang)
('Vina Melati', 'Crew', '2024-01-09', 3, 'Active'),
('Wahyu Hidayat', 'Kitchen', '2024-02-16', 3, 'Active'),
('Xena Putri', 'Cashier', '2024-03-05', 3, 'Active'),
('Yudi Santoso', 'Crew', '2024-01-28', 3, 'Active'),
('Zahra Aulia', 'Crew', '2024-02-07', 3, 'Active'),
('Agus Salim', 'Kitchen', '2024-03-11', 3, 'Active'),
('Bella Safitri', 'Crew', '2024-01-14', 3, 'Active'),
('Doni Kurnia', 'Cashier', '2024-02-25', 3, 'Active'),
('Erna Sari', 'Crew', '2024-03-18', 3, 'Active'),
('Fikri Maulana', 'Supervisor', '2023-12-05', 3, 'Active'),

-- Outlet 4 (9 orang)
('Galih Pratama', 'Crew', '2024-01-11', 4, 'Active'),
('Hana Puspita', 'Cashier', '2024-02-19', 4, 'Active'),
('Iqbal Ramadhan', 'Kitchen', '2024-03-07', 4, 'Active'),
('Jihan Putri', 'Crew', '2024-01-26', 4, 'Active'),
('Kiki Amelia', 'Crew', '2024-02-09', 4, 'Active'),
('Lukman Hakim', 'Kitchen', '2024-03-13', 4, 'Active'),
('Mega Wulandari', 'Cashier', '2024-01-16', 4, 'Active'),
('Naufal Rizky', 'Crew', '2024-02-23', 4, 'Active'),
('Ocha Permata', 'Supervisor', '2023-11-28', 4, 'Active'),

-- Outlet 5 (11 orang)
('Pandu Saputra', 'Crew', '2024-01-07', 5, 'Active'),
('Qori Anisa', 'Cashier', '2024-02-18', 5, 'Active'),
('Rangga Pratama', 'Kitchen', '2024-03-04', 5, 'Active'),
('Salsa Putri', 'Crew', '2024-01-29', 5, 'Active'),
('Tari Oktavia', 'Crew', '2024-02-06', 5, 'Active'),
('Uli Rahma', 'Cashier', '2024-03-09', 5, 'Active'),
('Vicky Prasetyo', 'Kitchen', '2024-01-20', 5, 'Active'),
('Wulan Sari', 'Crew', '2024-02-28', 5, 'Active'),
('Yoga Saputra', 'Crew', '2024-03-14', 5, 'Active'),
('Zaki Mubarak', 'Cashier', '2024-01-15', 5, 'Active'),
('Aulia Rahman', 'Supervisor', '2023-12-10', 5, 'Active');


INSERT INTO outlets (outlet_name, city, open_date) VALUES
('Gacoan Surabaya 1', 'Surabaya', '2023-10-01'),
('Gacoan Malang 1', 'Malang', '2023-10-05'),
('Gacoan Sidoarjo 1', 'Sidoarjo', '2023-10-10'),
('Gacoan Kediri 1', 'Kediri', '2023-10-15'),
('Gacoan Jember 1', 'Jember', '2023-10-20');


INSERT INTO trainings (training_name, training_type, duration_days, created_at) VALUES
('Basic Crew Onboarding', 'Onboarding', 1, '2023-10-01'),
('Advanced Crew Onboarding', 'Onboarding', 3, '2023-10-02'),
('Service Excellence Training', 'Service', 2, '2023-10-03'),
('Fast Service Training', 'Service', 1, '2023-10-04'),
('Kitchen SOP Training', 'Operational', 2, '2023-10-05'),
('Advanced Kitchen SOP', 'Operational', 3, '2023-10-06'),
('Customer Handling Training', 'Soft Skill', 2, '2023-10-07'),
('Complaint Handling Training', 'Soft Skill', 1, '2023-10-08');


INSERT INTO training_participants (employee_id, training_id, training_date, score) VALUES
(1, 1, '2023-10-10', 75),
(2, 1, '2023-10-10', 80),
(3, 3, '2023-10-12', 85),
(4, 4, '2023-10-12', 70),
(5, 5, '2023-10-15', 88),
(6, 2, '2023-10-16', 90),
(7, 7, '2023-10-18', 78),
(8, 8, '2023-10-18', 72),
(9, 1, '2023-10-11', 76),
(10, 5, '2023-10-15', 82),
(11, 3, '2023-10-13', 89),
(12, 4, '2023-10-13', 68),
(13, 2, '2023-10-17', 91),
(14, 6, '2023-10-19', 87),
(15, 7, '2023-10-20', 79),
(16, 8, '2023-10-20', 74),
(17, 1, '2023-10-11', 77),
(18, 3, '2023-10-12', 84),
(19, 5, '2023-10-15', 86),
(20, 6, '2023-10-19', 88),
(21, 2, '2023-10-17', 92),
(22, 4, '2023-10-13', 69),
(23, 7, '2023-10-18', 80),
(24, 8, '2023-10-18', 73),
(25, 1, '2023-10-10', 74),
(26, 3, '2023-10-12', 83),
(27, 5, '2023-10-15', 85),
(28, 6, '2023-10-19', 89),
(29, 2, '2023-10-17', 90),
(30, 4, '2023-10-13', 67),
(31, 7, '2023-10-20', 78),
(32, 8, '2023-10-20', 71),
(33, 1, '2023-10-11', 76),
(34, 3, '2023-10-12', 82),
(35, 5, '2023-10-15', 87),
(36, 6, '2023-10-19', 91),
(37, 2, '2023-10-17', 93),
(38, 4, '2023-10-13', 66),
(39, 7, '2023-10-18', 81),
(40, 8, '2023-10-18', 72);


INSERT INTO performance (employee_id, date, service_time_avg, orders_handled, error_count) VALUES
-- Outlet 1
(1, '2023-10-25', 9.5, 80, 5),
(2, '2023-10-25', 8.8, 85, 4),
(3, '2023-10-25', 7.2, 95, 2),
(4, '2023-10-25', 10.1, 70, 6),
(5, '2023-10-25', 7.5, 92, 3),
(6, '2023-10-25', 6.8, 100, 2),
(7, '2023-10-25', 8.9, 88, 4),
(8, '2023-10-25', 6.5, 105, 1),
-- Outlet 2
(9, '2023-10-26', 9.2, 82, 5),
(10, '2023-10-26', 7.8, 90, 3),
(11, '2023-10-26', 7.0, 98, 2),
(12, '2023-10-26', 10.5, 65, 7),
(13, '2023-10-26', 6.7, 102, 1),
(14, '2023-10-26', 6.3, 108, 1),
(15, '2023-10-26', 8.5, 87, 4),
(16, '2023-10-26', 9.0, 84, 5),
-- Outlet 3
(17, '2023-10-27', 9.0, 83, 5),
(18, '2023-10-27', 7.4, 93, 3),
(19, '2023-10-27', 7.1, 96, 2),
(20, '2023-10-27', 6.6, 104, 1),
(21, '2023-10-27', 6.2, 110, 1),
(22, '2023-10-27', 10.2, 68, 6),
(23, '2023-10-27', 8.3, 89, 4),
(24, '2023-10-27', 9.1, 86, 5),
-- Outlet 4
(25, '2023-10-28', 9.3, 81, 5),
(26, '2023-10-28', 7.6, 91, 3),
(27, '2023-10-28', 7.2, 94, 2),
(28, '2023-10-28', 6.5, 106, 1),
(29, '2023-10-28', 6.4, 107, 1),
(30, '2023-10-28', 10.8, 60, 7),
(31, '2023-10-28', 8.7, 88, 4),
(32, '2023-10-28', 9.4, 85, 5),
-- Outlet 5
(33, '2023-10-29', 9.1, 84, 5),
(34, '2023-10-29', 7.7, 92, 3),
(35, '2023-10-29', 7.3, 95, 2),
(36, '2023-10-29', 6.4, 108, 1),
(37, '2023-10-29', 6.1, 112, 1),
(38, '2023-10-29', 10.6, 62, 7),
(39, '2023-10-29', 8.2, 90, 4),
(40, '2023-10-29', 9.0, 87, 5),
-- Tambahan variasi
(41, '2023-10-30', 7.5, 93, 3),
(42, '2023-10-30', 6.8, 101, 2),
(43, '2023-10-30', 8.9, 86, 5),
(44, '2023-10-30', 9.7, 78, 6),
(45, '2023-10-30', 6.3, 110, 1),
(46, '2023-10-30', 7.1, 97, 2),
(47, '2023-10-30', 8.8, 88, 4),
(48, '2023-10-30', 9.5, 82, 5),
(49, '2023-10-30', 6.6, 105, 1),
(50, '2023-10-30', 7.4, 94, 3);


INSERT INTO operations (outlet_id, date, total_orders, avg_wait_time, peak_hour) VALUES
-- Outlet 1
(1, '2023-10-21', 650, 12.5, 'Lunch'),
(1, '2023-10-22', 670, 12.2, 'Lunch'),
(1, '2023-10-23', 690, 11.8, 'Dinner'),
(1, '2023-10-24', 710, 11.5, 'Dinner'),
(1, '2023-10-25', 700, 11.7, 'Lunch'),
(1, '2023-10-26', 720, 11.2, 'Dinner'),
(1, '2023-10-27', 730, 10.9, 'Dinner'),
(1, '2023-10-28', 740, 10.7, 'Lunch'),
(1, '2023-10-29', 760, 10.5, 'Dinner'),
(1, '2023-10-30', 750, 10.6, 'Dinner'),
-- Outlet 2
(2, '2023-10-21', 680, 12.8, 'Lunch'),
(2, '2023-10-22', 700, 12.4, 'Dinner'),
(2, '2023-10-23', 710, 12.1, 'Dinner'),
(2, '2023-10-24', 730, 11.7, 'Lunch'),
(2, '2023-10-25', 720, 11.9, 'Dinner'),
(2, '2023-10-26', 740, 11.3, 'Dinner'),
(2, '2023-10-27', 760, 11.0, 'Lunch'),
(2, '2023-10-28', 770, 10.8, 'Dinner'),
(2, '2023-10-29', 790, 10.6, 'Dinner'),
(2, '2023-10-30', 780, 10.7, 'Lunch'),
-- Outlet 3 (best)
(3, '2023-10-21', 750, 11.5, 'Dinner'),
(3, '2023-10-22', 770, 11.2, 'Lunch'),
(3, '2023-10-23', 790, 10.8, 'Dinner'),
(3, '2023-10-24', 810, 10.5, 'Dinner'),
(3, '2023-10-25', 800, 10.6, 'Lunch'),
(3, '2023-10-26', 820, 10.2, 'Dinner'),
(3, '2023-10-27', 830, 9.9, 'Dinner'),
(3, '2023-10-28', 840, 9.7, 'Lunch'),
(3, '2023-10-29', 860, 9.5, 'Dinner'),
(3, '2023-10-30', 850, 9.6, 'Dinner'),
-- Outlet 4 (underperform)
(4, '2023-10-21', 600, 13.5, 'Lunch'),
(4, '2023-10-22', 620, 13.2, 'Dinner'),
(4, '2023-10-23', 630, 13.0, 'Lunch'),
(4, '2023-10-24', 640, 12.8, 'Dinner'),
(4, '2023-10-25', 650, 12.6, 'Lunch'),
(4, '2023-10-26', 660, 12.4, 'Dinner'),
(4, '2023-10-27', 670, 12.2, 'Dinner'),
(4, '2023-10-28', 660, 12.3, 'Lunch'),
(4, '2023-10-29', 670, 12.1, 'Dinner'),
(4, '2023-10-30', 680, 12.0, 'Dinner'),
-- Outlet 5
(5, '2023-10-21', 780, 11.8, 'Dinner'),
(5, '2023-10-22', 800, 11.5, 'Lunch'),
(5, '2023-10-23', 820, 11.1, 'Dinner'),
(5, '2023-10-24', 830, 10.9, 'Dinner'),
(5, '2023-10-25', 820, 11.0, 'Lunch'),
(5, '2023-10-26', 840, 10.6, 'Dinner'),
(5, '2023-10-27', 850, 10.3, 'Dinner'),
(5, '2023-10-28', 860, 10.1, 'Lunch'),
(5, '2023-10-29', 880, 9.9, 'Dinner'),
(5, '2023-10-30', 870, 10.0, 'Dinner');


INSERT INTO complaints (outlet_id, employee_id, complaint_date, complaint_type, description) VALUES
(1, 1, '2023-10-21', 'Slow Service', 'Customer waited too long'),
(1, 2, '2023-10-22', 'Wrong Order', 'Incorrect order delivered'),
(1, 3, '2023-10-23', 'Slow Service', 'Service was slow'),
(1, 4, '2023-10-24', 'Bad Attitude', 'Staff not friendly'),
(1, 5, '2023-10-25', 'Wrong Order', 'Order mismatch'),
(1, 6, '2023-10-26', 'Slow Service', 'Delay in service'),
(1, 7, '2023-10-27', 'Slow Service', 'Queue too long'),
(1, 8, '2023-10-28', 'Bad Attitude', 'Unresponsive staff'),
(1, 2, '2023-10-29', 'Slow Service', 'Late service'),
(1, 3, '2023-10-30', 'Wrong Order', 'Wrong items delivered'),

(2, 9, '2023-10-21', 'Slow Service', 'Service slightly slow'),
(2, 10, '2023-10-22', 'Wrong Order', 'Wrong menu item'),
(2, 11, '2023-10-23', 'Bad Attitude', 'Staff inattentive'),
(2, 12, '2023-10-24', 'Slow Service', 'Waiting too long'),
(2, 13, '2023-10-25', 'Wrong Order', 'Incorrect order'),
(2, 14, '2023-10-26', 'Slow Service', 'Service delay'),
(2, 15, '2023-10-27', 'Wrong Order', 'Wrong items served'),
(2, 16, '2023-10-28', 'Bad Attitude', 'Rude behavior'),
(2, 10, '2023-10-29', 'Slow Service', 'Delay again'),
(2, 11, '2023-10-30', 'Wrong Order', 'Order incorrect'),

(3, 17, '2023-10-22', 'Wrong Order', 'Minor mistake'),
(3, 18, '2023-10-24', 'Slow Service', 'Slight delay'),
(3, 19, '2023-10-26', 'Wrong Order', 'Wrong item'),
(3, 20, '2023-10-28', 'Bad Attitude', 'Less responsive'),
(3, 21, '2023-10-30', 'Slow Service', 'Small delay'),

(4, 25, '2023-10-21', 'Slow Service', 'Very long waiting time'),
(4, 26, '2023-10-22', 'Slow Service', 'Extremely slow'),
(4, 27, '2023-10-23', 'Wrong Order', 'Multiple errors'),
(4, 28, '2023-10-24', 'Bad Attitude', 'Rude staff'),
(4, 29, '2023-10-25', 'Slow Service', 'Delay over 20 minutes'),
(4, 30, '2023-10-26', 'Wrong Order', 'Incorrect order'),
(4, 31, '2023-10-27', 'Slow Service', 'Too slow'),
(4, 32, '2023-10-28', 'Bad Attitude', 'Ignored customer'),
(4, 25, '2023-10-29', 'Slow Service', 'Queue too long'),
(4, 26, '2023-10-30', 'Wrong Order', 'Wrong order again'),

(5, 33, '2023-10-21', 'Wrong Order', 'Small mistake'),
(5, 34, '2023-10-22', 'Slow Service', 'Slight delay'),
(5, 35, '2023-10-23', 'Wrong Order', 'Minor error'),
(5, 36, '2023-10-24', 'Bad Attitude', 'Less friendly'),
(5, 37, '2023-10-25', 'Slow Service', 'Short delay'),
(5, 38, '2023-10-26', 'Wrong Order', 'Order mismatch'),
(5, 39, '2023-10-27', 'Slow Service', 'Queue delay'),
(5, 40, '2023-10-28', 'Wrong Order', 'Wrong item'),
(5, 33, '2023-10-29', 'Bad Attitude', 'Not friendly'),
(5, 34, '2023-10-30', 'Slow Service', 'Slightly slow');



-- MEMBUAT RAW DATA DARI SOURCE DATA

CREATE TABLE raw_outlets (
    outlet_id INT PRIMARY KEY,
    outlet_name VARCHAR(100),
    city VARCHAR(100),
    open_date DATE
);
INSERT INTO raw_outlets
SELECT * FROM outlets;

CREATE TABLE raw_employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    role VARCHAR(50),
    hire_date DATE,
    outlet_id INT,
    status VARCHAR(20),
    FOREIGN KEY (outlet_id) REFERENCES raw_outlets(outlet_id)
);
INSERT INTO raw_employees
SELECT * FROM employees;

CREATE TABLE raw_trainings (
    training_id INT PRIMARY KEY AUTO_INCREMENT,
    training_name VARCHAR(100),
    training_type VARCHAR(50),
    duration_days INT,
    created_at DATE
);
INSERT INTO raw_trainings
SELECT * FROM trainings;

CREATE TABLE raw_training_participants (
    participant_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    training_id INT,
    training_date DATE,
    score DECIMAL(5,2),
    FOREIGN KEY (employee_id) REFERENCES raw_employees(employee_id),
    FOREIGN KEY (training_id) REFERENCES raw_trainings(training_id)
);
INSERT INTO raw_training_participants
SELECT * FROM training_participants;

CREATE TABLE raw_performance (
    performance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    date DATE,
    service_time_avg DECIMAL(5,2), -- dalam menit
    orders_handled INT,
    error_count INT,
    FOREIGN KEY (employee_id) REFERENCES raw_employees(employee_id)
);
INSERT INTO raw_performance
SELECT * FROM performance;

CREATE TABLE raw_operations (
    operation_id INT PRIMARY KEY AUTO_INCREMENT,
    outlet_id INT,
    date DATE,
    total_orders INT,
    avg_wait_time DECIMAL(5,2),
    peak_hour VARCHAR(20),
    
    FOREIGN KEY (outlet_id) REFERENCES raw_outlets(outlet_id)
);
INSERT INTO raw_operations
SELECT * FROM operations;

CREATE TABLE raw_complaints (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,
    outlet_id INT,
    employee_id INT,
    complaint_date DATE,
    complaint_type VARCHAR(100),
    description TEXT,
    
    FOREIGN KEY (outlet_id) REFERENCES raw_outlets(outlet_id),
    FOREIGN KEY (employee_id) REFERENCES raw_employees(employee_id)
);
INSERT INTO raw_complaints
SELECT * FROM complaints;



-- penambahan data performance
INSERT INTO raw_performance (employee_id, date, service_time_avg, orders_handled, error_count)
SELECT 
    e.employee_id,
    DATE_ADD('2023-10-01', INTERVAL d.day_num DAY),

    ROUND(5 + RAND()*5, 2),          -- service time 5–10 menit
    FLOOR(50 + RAND()*100),          -- orders 50–150
    FLOOR(RAND()*5)                  -- error 0–4

FROM raw_employees e

JOIN (
    SELECT 0 AS day_num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
    UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14
    UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19
    UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24
    UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29
) d;


TRUNCATE TABLE stg_performance;

INSERT INTO stg_performance
SELECT 
    performance_id,
    employee_id,
    date,
    service_time_avg,
    orders_handled,
    error_count
FROM raw_performance
WHERE date IS NOT NULL;

TRUNCATE TABLE fact_performance;

INSERT INTO fact_performance
SELECT * FROM stg_performance;