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
        , user_id
        from articulos
        join lineas_pedido on articulos.product_id = lineas_pedido.product_id
        join pedido on pedido.order_id = lineas_pedido.order_id
 --       where order_id = '5dbde056-632e-484a-a30b-67665cec51ee'

    )

select *
from producto
