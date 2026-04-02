use learning_improvement_dw;
show tables;


-- staging table employess
create table stg_employees as 
select 
    employee_id, 
    outlet_id, 
    TRIM(UPPER(name)) as name,
    TRIM(LOWER(role)) as role,

    CASE 
        WHEN hire_date IS NULL THEN '2023-01-01'
        ELSE hire_date
    END AS hire_date

from raw_employees
;


-- staging outlets
create table stg_outlets as 
select 
    outlet_id, 
    TRIM(UPPER(outlet_name)) as outlet_name,
    TRIM(UPPER(city)) as city,
    open_date
from raw_outlets
;


-- staging performance
create table stg_performance as -- 3
select -- 4
    performance_id, 
    employee_id, 
    date,
    ifnull(service_time_avg, 0) as service_time_avg,
    ifnull(orders_handled, 0) as orders_handled,
    ifnull(error_count, 0) as error_count
from raw_performance -- 1
where date is NOT NULL -- 2
;


--staging training
create table stg_trainings as -- 2
select
    training_id,
    trim(upper(training_name)) as training_name,
    trim(lower(training_type)) as training_type,
    CASE
        when duration_days is null or duration_days <=0 then 1
        else duration_days
    end as duration_days,
    created_at
from raw_trainings -- 1
;


--staging training participants
create table stg_training_participants as
select
    participant_id,
    employee_id,
    training_id,
    training_date,
    CASE
        when score is null then 0
        when score < 0 then 0
        when score > 100 then 100
        else score
    end as score

from raw_training_participants
where training_date is not null
;


--staging operations
create table stg_operations as
SELECT
    operation_id,
    outlet_id,
    date,
    ifnull(total_orders, 0) as total_orders,
    CASE
        when avg_wait_time is null then 0
        when avg_wait_time < 0 then 0
        else avg_wait_time
    end as avg_wait_time,
    trim(lower(peak_hour)) as peak_hour
from raw_operations
where date is not null;

--staging complaints
create table stg_complaints as
select
    complaint_id,
    outlet_id,
    employee_id,
    complaint_date,
    trim(lower(complaint_type)) as complaint_type,
    description
from raw_complaints
where complaint_date is not null;


--validation
SELECT * FROM stg_employees WHERE name IS NULL;

-- cek data aneh
SELECT * FROM stg_performance WHERE service_time_avg < 0;

-- cek relasi
SELECT e.name, o.outlet_name, e.role, t.training_name, tp.training_date, tp.score
FROM stg_training_participants as tp
LEFT JOIN stg_employees as e
    ON tp.employee_id = e.employee_id
LEFT JOIN stg_outlets as o
    ON e.outlet_id = o.outlet_id
LEFT JOIN stg_trainings as t
    ON tp.training_id = t.training_id
WHERE t.training_name like 'Advanced Crew Onboarding';




