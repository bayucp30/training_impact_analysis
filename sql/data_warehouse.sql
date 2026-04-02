-- DIM (Dimension Table) tabel deskriptif

-- Outlet
CREATE TABLE dim_outlet AS
SELECT * FROM stg_outlets;

-- Trainings
CREATE TABLE dim_training AS
SELECT * FROM stg_trainings;

-- Employees
CREATE TABLE dim_employees AS
SELECT e.employee_id, e.name, e.role, e.hire_date, o.outlet_name, o.city
FROM stg_employees as e
LEFT JOIN stg_outlets as o
    ON e.outlet_id = o.outlet_id
;

-- Date
CREATE TABLE dim_date AS
SELECT DISTINCT date AS full_date,
       YEAR(date) AS year,
       MONTH(date) AS month,
       DAY(date) AS day
FROM (
    SELECT training_date AS date FROM stg_training_participants
    UNION
    SELECT date FROM stg_performance
    UNION
    SELECT date FROM stg_operations
    UNION
    SELECT complaint_date FROM stg_complaints
) d;

-- Table baru untuk dimensi peak hour agar scalable
CREATE TABLE dim_peak_hour (
    peak_hour_id INT AUTO_INCREMENT PRIMARY KEY,
    peak_hour_name VARCHAR(20)
);
INSERT INTO dim_peak_hour (peak_hour_name)
VALUES ('lunch'), ('dinner');

-- table baru untuk dimensi complaint type agar scalable
CREATE TABLE dim_complaint_type (
    complaint_type_id INT AUTO_INCREMENT PRIMARY KEY,
    complaint_type_name VARCHAR(100)
);
INSERT INTO dim_complaint_type (complaint_type_name)
SELECT DISTINCT complaint_type
FROM stg_complaints;



-- FACT TABLE (angka/metric)

-- fact training (participants)
CREATE TABLE fact_training AS
SELECT * FROM stg_training_participants;

-- fact performance
CREATE TABLE fact_performance AS
SELECT * FROM stg_performance;

-- fact operations
CREATE TABLE fact_operations AS
SELECT o.operation_id, o.outlet_id, o.date, o.total_orders, o.avg_wait_time, ph.peak_hour_id
FROM stg_operations AS o
LEFT JOIN dim_peak_hour AS ph
    ON o.peak_hour = ph.peak_hour_name
;

-- fact complaints
CREATE TABLE fact_complaints AS
SELECT c.complaint_id, c.outlet_id, c.employee_id, c.complaint_date, ct.complaint_type_id
FROM stg_complaints AS c
LEFT JOIN dim_complaint_type AS ct
    ON c.complaint_type = ct.complaint_type_name;