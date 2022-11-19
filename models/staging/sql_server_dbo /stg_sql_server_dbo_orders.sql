{{ config(materialized="view") }}

with
    src_orders as (select * from {{ source("sql_server_dbo", "orders") }}),

    orders_renamed as (

        select
            order_id,
            address_id,
            shipping_service as servicio_envio,
            created_at as creado_el,
            md5(replace (promo_id, ' ', '')) as id_promo,
            promo_id as promo_nombre,
            estimated_delivery_at as entrega_estimada,
            order_cost as coste_total,
            user_id,
            order_total,
            delivered_at as entregado_el,
            tracking_id,
            status as estado,
            shipping_cost as coste_envio

        from src_orders

    )



select *
from orders_renamed
