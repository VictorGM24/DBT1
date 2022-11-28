with
    articulos as (select * from {{ref('stg_sql_server_dbo_products')}}),
    lineas_pedido as (select * from {{ ref('stg_sql_server_dbo_order_items') }}),



    producto as (
        select
          articulos.product_id
        , order_id
        , precio
        , cantidad
        , inventario

        from articulos
        join lineas_pedido on articulos.product_id = lineas_pedido.product_id

    )

select *
from producto
