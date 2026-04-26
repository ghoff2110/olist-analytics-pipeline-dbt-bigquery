select
    date(order_purchase_ts)       as order_date,
    customer_state                as state,
    count(distinct order_id)      as total_orders,
    sum(total_amount)             as revenue,
    avg(total_amount)             as avg_order_value,
    sum(is_delayed)               as delayed_orders,
    round(
        sum(is_delayed) / count(distinct order_id) * 100, 2
    )                             as delay_rate_pct
from {{ ref('fct_orders') }}
where order_status = 'delivered'
group by 1, 2
order by 1