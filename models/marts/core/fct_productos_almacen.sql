with
    articulos as (select * from {{ref('stg_sql_server_dbo_products')}}),
    --lineas_pedido as (select * from {{ ref('stg_sql_server_dbo_order_items') }}),



    stock_almacen as (
        select
          product_id
        , inventario
        , precio
        , (inventario*precio) as total_e_producto
        from articulos
        --join lineas_pedido on articulos.product_id = lineas_pedido.product_id

    )

select *
from stock_almacen