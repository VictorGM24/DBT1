with
    articulos as (select * from {{ref('stg_sql_server_dbo_products')}}),
    lineas_pedido as (select * from {{ ref('stg_sql_server_dbo_order_items') }}),
    pedido as (select * from {{ ref('stg_sql_server_dbo_orders') }}),    
    tipo_planta as (select * from {{ ref('stg_tipo_planta') }}),



    producto as (
        select
        {{ dbt_utils.surrogate_key(['lineas_pedido.order_id', 'lineas_pedido.product_id']) }} as order_item_id
        , articulos.product_id
        , lineas_pedido.order_id
        , precio
        , cantidad
        , precio*cantidad as precio_final
        , pedido.user_id
        , articulos.id_nombre_planta
        from articulos
        join lineas_pedido on articulos.product_id = lineas_pedido.product_id
        join pedido on pedido.order_id = lineas_pedido.order_id
        join tipo_planta on tipo_planta.id_nombre_planta = articulos.id_nombre_planta
    )

select *
from producto
