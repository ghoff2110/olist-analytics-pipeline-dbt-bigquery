with items as (
    select * from {{ ref('stg_order_items') }}
),
 
orders as (
    select * from {{ ref('fct_orders') }}
),
 
sellers as (
    select * from {{ ref('stg_sellers') }}
)
 
select
    s.seller_id,
    s.city                                    as seller_city,
    s.state                                   as seller_state,
    count(distinct i.order_id)                as total_orders,
    sum(i.price)                              as total_revenue,
    avg(i.price)                              as avg_item_price,
    sum(i.freight_value)                      as total_freight,
    sum(o.is_delayed)                         as delayed_orders,
    round(
        sum(o.is_delayed) / count(distinct i.order_id) * 100, 2
    )                                         as delay_rate_pct
 
from items i
left join orders  o using(order_id)
left join sellers s using(seller_id)
group by 1, 2, 3
order by total_revenue desc