select distinct
    product_code,
    product_name,
    product_category,
    msrp,
    (
        select max(order_date)
        from {{ ref('stg_sales_data')}} as b
        where a.product_code = b.product_code
    ) as recent_order_date,
    (
        select min(order_date)
        from {{ ref('stg_sales_data') }} as b
        where a.product_code = b.product_code
    ) as first_order_date
from {{ ref('stg_sales_data') }} as a