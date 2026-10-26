select customer_name, customer_phone, store_name, store_province, product_name
from {{ ref("one_big_table") }}
where
    lower(trim(payment_method)) = 'gift card'
    and (lower(product_brand) = 'samsung' or lower(product_brand) = 'adidas')
