select order_key, count(*) as row_count
from {{ ref("one_big_table") }}
group by order_key
having count(*) > 1 or order_key is null
