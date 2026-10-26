{{ config(materialized="view") }}

select
    employee_id,
    {{ macro_full_name("first_name", "last_name") }} as full_name,
    job_title,
    salary,
    store_id,
    {{ is_active_status("is_active") }} as active_status
from {{ source("raw_source", "employees") }}
where employee_id is not null or salary >= 0
