with

    src_usuarios as (select * from {{ ref('stg_sql_server_dbo_users') }}),

    src_orders as (select * from {{ ref('stg_sql_server_dbo_orders') }}),
    
    info_usuarios as (
        select
          src_orders.user_id
        , count (src_orders.order_id) as Numero_Pedidos_Cliente
        , sum (venta_final) as Importe_Total_Cliente
        , avg (venta_final) as Importe_Medio_Pedido_Cliente
        , max (venta_final) as Importe_Pedido_Max
        , min (venta_final) as Importe_Pedido_Min
        , count (distinct src_orders.address_id) as Direcciones_Distintas_Cliente
        , max (src_orders.creado_el) as Fecha_ultimo_pedido
            



        from src_usuarios
        join src_orders on src_orders.user_id = src_usuarios.user_id
        group by src_orders.user_id

    )

select *
from info_usuarios