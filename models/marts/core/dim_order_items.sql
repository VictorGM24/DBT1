with

    src_lineas_pedido as (select * from {{ref('stg_sql_server_dbo_order_items')}}),
    
    
    lineas_pedido as (
        select
        {{ dbt_utils.surrogate_key(['order_id', 'product_id']) }} as order_item_id
        ,order_id
        ,product_id 
        
        
        from src_lineas_pedido



    )

select *
from lineas_pedido
