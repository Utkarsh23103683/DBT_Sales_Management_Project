{{ config(materialized="view") }}

select
    order_item_id,
    quantity,
    unit_price,
    line_amount as total_price,
    {{ is_active_status("is_active") }} as active_status
from {{ source("raw_source", "order_items") }}
where order_item_id is not null or quantity >= 0 or unit_price >= 0
