select
    seller_id,
    seller_zip_code_prefix  as zip_code,
    seller_city             as city,
    seller_state            as state
from {{ source('olist', 'olist_sellers') }}
where seller_id is not null