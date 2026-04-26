with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select
        order_id,
        coalesce(sum(payment_value), 0) as total_amount,
        count(distinct payment_type)    as payment_methods_used
    from {{ ref('stg_payments') }}
    group by order_id
),

customers as (
    select * from {{ ref('stg_customers') }}
)

select
    o.order_id,
    o.customer_id,
    c.city                            as customer_city,
    c.state                           as customer_state,
    o.order_status,
    o.order_purchase_ts,
    o.delivered_ts,
    o.estimated_delivery_ts,
    coalesce(p.total_amount, 0)       as total_amount,  -- ← fix here
    coalesce(p.payment_methods_used, 0) as payment_methods_used,  -- ← and here
    o.delivery_delay_days,

    case
        when o.delivered_ts > o.estimated_delivery_ts then 1
        else 0
    end as is_delayed

from orders o
left join payments  p using(order_id)
left join customers c using(customer_id)