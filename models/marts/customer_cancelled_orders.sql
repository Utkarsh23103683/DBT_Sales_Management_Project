select customer_name, customer_phone
from {{ ref("one_big_table") }}

where lower(trim(order_status)) = 'cancelled' and total_amount > 3000
