with
    articulos as (select * from {{ref('stg_sql_server_dbo_products')}}),
    lineas_pedido as (select * from {{ ref('stg_sql_server_dbo_order_items') }}),



    producto as (
        select
          articulos.product_id
        , order_id
        , precio
        , cantidad
        , (precio*cantidad) as importe_total_linea
        from articulos
        join lineas_pedido on articulos.product_id = lineas_pedido.product_id
 --       where order_id = '5dbde056-632e-484a-a30b-67665cec51ee'

    )

select *
from producto
