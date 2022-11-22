with

    articulos as (select * from {{ref('stg_sql_server_dbo_products')}}),
    
    
    productos as (
        select
         product_id 
        ,nombre_producto

        from articulos


    )

select *
from productos
