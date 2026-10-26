select
    employee_full_name,
    employee_job_title,
    employee_salary,
    store_name,
    store_province,
    store_country
from {{ ref("one_big_table") }}
where store_province = 'Virginia' and employee_salary > 75000
