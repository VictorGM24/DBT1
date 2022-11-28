with

    src_lineas_pedido as (select * from {{ref('stg_sql_server_dbo_order_items')}}),
    
    
    lineas_pedido as (
        select
        order_id
        ,product_id 
        ,cantidad
        
        
        from src_lineas_pedido



    )

select *
from lineas_pedido
