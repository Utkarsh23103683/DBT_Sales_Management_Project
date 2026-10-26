{{ config(materialized="view") }}

select
    product_id,
    product_name,
    category,
    brand,
    price,
    {{ is_active_status("is_active") }} as active_status
from {{ source("raw_source", "products") }}
where product_id is not null or price >= 0
