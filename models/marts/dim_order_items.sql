with

    src_lineas_pedido as (select * from {{ref('stg_sql_server_dbo_order_items')}}),
    
    
    lineas_pedido as (
        select
         product_id 
        ,cantidad
        
        
        from src_lineas_pedido
       -- join lineas_pedido on lineas_pedido.order_id = pedidos.order_id
        --join articulos on articulos.product_id = lineas_pedido.product_id


    )

select *
from lineas_pedido
