{{ config(materialized="view") }}


with
    cte as (
        select
            customer_id,
            {{ macro_full_name("first_name", "last_name") }} as full_name,
            email,
            phone,
            city,
            country,
            {{ is_active_status("is_active") }} as active_status,
            row_number() over (
                partition by lower(trim(email)) order by customer_id
            ) as row_num
        from {{ source("raw_source", "customers") }}
        where customer_id is not null and email is not null
    )

select customer_id, full_name, email, phone, city, country, active_status
from cte
where row_num = 1
