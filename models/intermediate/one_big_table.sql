select
    {{
        dbt_utils.generate_surrogate_key(
            [
                "o.order_id",
                "o.customer_id",
                "oi.order_item_id",
                "p.product_id",
                "s.store_id",
            ]
        )
    }} as order_key,
    o.order_id,
    o.customer_id,
    o.payment_method,
    o.order_status,
    o.total_amount,
    o.store_id,
    c.full_name as customer_name,
    c.phone as customer_phone,
    oi.order_item_id,
    oi.order_id as order_item_order_id,
    oi.quantity,
    oi.unit_price,
    oi.total_price,
    oi.product_id,
    p.product_id as product_product_id,
    p.product_name,
    p.category as product_category,
    p.brand as product_brand,
    p.price as product_price,
    s.store_id as store_store_id,
    s.store_name,
    s.province as store_province,
    s.country as store_country,
    {{ is_active_status("s.active_status") }} as store_active_status

from {{ ref("stg_order_items") }} oi
join {{ ref("stg_products") }} p on oi.product_id = p.product_id
join {{ ref("stg_orders") }} o on oi.order_id = o.order_id
join {{ ref("stg_stores") }} s on o.store_id = s.store_id
join {{ ref("stg_customers") }} c on o.customer_id = c.customer_id

where
    oi.active_status = 'Active'
    and p.active_status = 'Active'
    and o.active_status = 'Active'
    and s.active_status = 'Active'
    and c.active_status = 'Active'
