with
    pedidos as (select * from {{ ref('stg_sql_server_dbo_orders') }}),

servicio_de_entrega as (
        select
           order_id,
           servicio_de_envio,
           estado_del_pedido


        from pedidos



    )

select *
from servicio_de_entrega

