{{ config(materialized="view") }}

select
    order_id,
    customer_id,
    payment_method,
    order_status,
    total_amount,
    store_id,
    {{ is_active_status("is_active") }} as active_status
from {{ source("raw_source", "orders") }}
where order_id is not null or total_amount >= 0
