select distinct
    order_number,
    order_line_number,
    order_date,
    status
from {{ ref('stg_sales_data') }}