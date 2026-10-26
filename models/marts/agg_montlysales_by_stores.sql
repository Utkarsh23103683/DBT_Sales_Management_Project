select store_name, sum(total_amount) as total_sales_per_store
from {{ ref("one_big_table") }}
group by store_name
order by total_sales_per_store
