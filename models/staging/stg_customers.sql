{{ config(materialized="view") }}

select
    customer_id,
    {{ macro_full_name("first_name", "last_name") }} as full_name,
    email,
    cast(phone as int) as phone,
    city,
    country,
    {{ is_active_status("is_active") }} as active_status
from {{ source("raw_source", "customers") }}
where customer_id is not null
