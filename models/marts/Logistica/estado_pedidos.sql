with

    src_orders as (select * from {{ ref('stg_sql_server_dbo_orders') }}),
    
    int_compania_servicio as (
        select
          estado_del_pedido,
          count(order_id) as total_estado_pedido


            


        from src_orders
        group by estado_del_pedido


    )

select *
from int_compania_servicio       