with orders as (

    select * from {{ ref('fct_orders') }}

),

customer_orders as (

    select
        customer_id,
        max(order_purchase_ts) as last_order_date,
        count(order_id) as frequency,
        sum(total_amount) as monetary
    from orders
    group by customer_id

)

select
    customer_id,

    -- Recency (days since last order)
    date_diff(current_date, date(last_order_date), day) as recency,

    frequency,
    monetary

from customer_orders