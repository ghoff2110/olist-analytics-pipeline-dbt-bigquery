select
    order_id,
    customer_id,
    order_status,
    cast(order_purchase_timestamp as timestamp)      as order_purchase_ts,
    cast(order_approved_at as timestamp)             as order_approved_ts,
    cast(order_delivered_customer_date as timestamp) as delivered_ts,
    cast(order_estimated_delivery_date as timestamp) as estimated_delivery_ts,

    date_diff(
        cast(order_delivered_customer_date as date),
        cast(order_estimated_delivery_date as date),
        day
    ) as delivery_delay_days

from {{ source('olist', 'olist_orders') }}
where order_id is not null