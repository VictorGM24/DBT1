with
    articulos as (select * from {{ref('stg_sql_server_dbo_products')}}),
    lineas_pedido as (select * from {{ ref('stg_sql_server_dbo_order_items') }}),
    pedido as (select * from {{ ref('stg_sql_server_dbo_orders') }}),    



    producto as (
        select
          articulos.product_id
        , lineas_pedido.order_id
        , precio
        , cantidad
        , precio*cantidad
        , pedido.user_id
        , id_nombre_planta
        from articulos
        join lineas_pedido on articulos.product_id = lineas_pedido.product_id
        join pedido on pedido.order_id = lineas_pedido.order_id

    )

select *
from producto
