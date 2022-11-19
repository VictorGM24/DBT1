with
    pedidos as (select * from {{ ref('stg_sql_server_dbo_orders') }}),

    lineas_pedido as (select * from {{ ref('stg_sql_server_dbo_order_items') }}),

    promos as (select * from {{ref('stg_sql_server_dbo_promos')}}),

    articulos as (select * from {{ref('stg_sql_server_dbo_products')}}),

    pedidos_cliente as (
        select
        pedidos.order_id,
        address_id,
        creado_el,
        promos.id_promo,
        promos.descuento,
        entrega_estimada,
        coste_total,
        user_id,
        order_total,
        tracking_id,
        coste_envio,    
        lineas_pedido.product_id,
        lineas_pedido.cantidad,
        articulos.precio

        from pedidos
        join lineas_pedido on lineas_pedido.order_id = pedidos.order_id
        join promos on promos.id_promo = pedidos.id_promo
        join articulos on articulos.product_id = lineas_pedido.product_id

    )

select *
from pedidos_cliente
