select
    order_id,
    payment_type,
    payment_installments,
    payment_value
from {{ source('olist', 'olist_payments') }}