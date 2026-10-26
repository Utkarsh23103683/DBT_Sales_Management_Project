{{ config(materialized="view") }}

select
    store_id,
    store_name,
    province,
    country,
    {{ is_active_status("is_active") }} as active_status
from {{ source("raw_source", "stores") }}
where store_id is not null
