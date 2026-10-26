select customer_name, customer_phone, store_name, store_province, product_name
from {{ ref("one_big_table") }}
where
    product_category = 'gift card'
    and (product_brand = 'Samsung' or product_brand = 'Adidas')
