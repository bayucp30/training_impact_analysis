-- USE CASE 1 (Apakah training mempengaruhi performance?)

SELECT 
    ft.employee_id, 
    ft.training_id, 
    dt.training_name, 
    ft.training_date,

-- SEBELUM TRAINING
    COALESCE(AVG(CASE
        WHEN fp.date BETWEEN DATE_SUB(ft.training_date, INTERVAL 7 DAY) 
                         AND DATE_SUB(ft.training_date, INTERVAL 1 DAY)
        THEN fp.orders_handled
    END), 0) as before_orders,

    COALESCE(AVG(CASE
        WHEN fp.date BETWEEN DATE_SUB(ft.training_date, INTERVAL 7 DAY)
                         AND DATE_SUB(ft.training_date, INTERVAL 1 DAY)
        THEN fp.service_time_avg
    END), 0) as before_service_time,

    COALESCE(AVG(CASE
        WHEN fp.date BETWEEN DATE_SUB(ft.training_date, INTERVAL 7 DAY)
                         AND DATE_SUB(ft.training_date, INTERVAL 1 DAY)
        THEN fp.error_count
    END), 0) as before_error,

-- SETELAH TRAINING
    COALESCE(AVG(CASE
        WHEN fp.date BETWEEN DATE_ADD(ft.training_date, INTERVAL 1 DAY)
                         AND DATE_ADD(ft.training_date, INTERVAL 7 DAY)
        THEN fp.orders_handled
    END), 0) as after_orders,

    COALESCE(AVG(CASE
        WHEN fp.date BETWEEN DATE_ADD(ft.training_date, INTERVAL 1 DAY)
                         AND DATE_ADD(ft.training_date, INTERVAL 7 DAY)
        THEN fp.service_time_avg
    END), 0) as after_service_time,

    COALESCE(AVG(CASE
        WHEN fp.date BETWEEN DATE_ADD(ft.training_date, INTERVAL 1 DAY)
                         AND DATE_ADD(ft.training_date, INTERVAL 7 DAY)
        THEN fp.error_count
    END), 0) as after_error

FROM fact_training AS ft
LEFT JOIN dim_training AS dt
    ON ft.training_id = dt.training_id
LEFT JOIN fact_performance AS fp
    ON ft.employee_id = fp.employee_id
    AND fp.date BETWEEN 
        DATE_SUB(ft.training_date, INTERVAL 7 DAY)
        AND DATE_ADD(ft.training_date, INTERVAL 7 DAY)

GROUP BY
    ft.employee_id, ft.training_id, dt.training_name, ft.training_date
HAVING before_orders IS NOT NULL AND after_orders IS NOT NULL;


-- USE CASE 2 (generate data harian untuk visual trend performa sebelum dan sesudah training)
-- HANYA UNTUK VISUALISASI TAMBAHAN
SELECT 
    ft.employee_id,
    dt.training_name,
    ft.training_date,
    fp.date,
    DATEDIFF(fp.date, ft.training_date) as day_diff,
    fp.orders_handled,
    fp.service_time_avg,
    fp.error_count

FROM fact_training ft
LEFT JOIN fact_performance fp
    ON ft.employee_id = fp.employee_id
LEFT JOIN dim_training dt
    ON ft.training_id = dt.training_id

WHERE fp.date BETWEEN DATE_SUB(ft.training_date, INTERVAL 7 DAY)
                  AND DATE_ADD(ft.training_date, INTERVAL 7 DAY);