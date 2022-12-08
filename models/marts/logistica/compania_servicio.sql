with

    src_orders as (select * from {{ ref('stg_sql_server_dbo_orders') }}),
    
    int_compania_servicio as (
        select
          servicio_de_envio,
          count(order_id) as total_pedidos_por_empresa_transporte,
          avg (coste_envio) as media_coste_envio_por_empresa_transporte





            


        from src_orders
        group by servicio_de_envio


    )

select *
from int_compania_servicio       