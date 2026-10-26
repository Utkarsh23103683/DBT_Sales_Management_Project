select *
from {{ ref("one_big_table") }}
where
    order_id is null
    or customer_id is null
    or product_id is null
    or employee_id is null
    or order_item_id is null
    or store_id is null
