select
    {{
        dbt_utils.generate_surrogate_key(
            ["order_id", "customer_id", "order_item_id", "product_id", "store_id"]
        )
    }} as order_key,
    o.order_id,
    o.customer_id,
    o.payment_method,
    o.order_status,
    o.total_amount,
    o.store_id,
    c.customer_id,
    c.full_name as customer_name,
    c.phone as customer_phone,
    e.employee_id,
    e.full_name as employee_full_name,
    e.job_title as employee_job_title,
    e.salary as employee_salary,
    e.store_id,
    oi.order_item_id,
    oi.order_id,
    oi.quantity,
    oi.unit_price,
    oi.total_price,
    oi.product_id,
    p.product_id,
    p.product_name,
    p.category as product_category,
    p.brand as product_brand,
    p.price as product_price,
    s.store_id,
    s.store_name,
    s.province as store_province,
    s.country as store_country,
    {{ is_active_status("s.is_active") }} as store_active_status

from {{ ref("stg_order_items") }} oi
join {{ ref("stg_products") }} p on oi.product_id = p.product_id
join {{ ref("stg_orders") }} o on oi.order_id = o.order_id
join {{ ref("stg_stores") }} s on o.store_id = s.store_id
join {{ ref("stg_customers") }} c on o.customer_id = c.customer_id
join {{ ref("stg_employees") }} e on o.store_id = e.store_id

where
    oi.active_status = 'Active'
    and p.active_status = 'Active'
    and o.active_status = 'Active'
    and s.active_status = 'Active'
    and c.active_status = 'Active'
    and e.active_status = 'Active'
