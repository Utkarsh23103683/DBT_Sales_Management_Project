select *
from {{ ref("one_big_table") }}
where or quantity < 0 or unit_price < 0 or total_amount < 0 or product_price < 0
