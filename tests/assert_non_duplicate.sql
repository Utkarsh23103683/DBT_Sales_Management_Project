select *
from ref {{ "one_big_table" }}
where order_key is not unique or order_key is null
