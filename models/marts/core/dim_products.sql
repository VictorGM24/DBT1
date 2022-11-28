with

    src_products as (select * from {{ ref('stg_sql_server_dbo_products') }}),

    productos as (
        select
            product_id,
            nombre_producto
        


        from src_products

    )

select *
from productos
