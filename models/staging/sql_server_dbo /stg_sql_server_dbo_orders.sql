{{ config(materialized="view") }}

with
    src_orders as (select * from {{ source("sql_server_dbo", "orders") }}),

    orders_renamed as (

        select
            order_id,
            address_id,
            case 
                when shipping_service = '' then 'Pendiente de asignar'
                else (shipping_service)
                end as servicio_de_envio,
            shipping_cost as coste_envio,
            created_at as creado_el,
            case 
                when promo_id = '' then null
                else md5 (replace ( promo_id, ' ' ,''))
                end as id_promo ,
            promo_id as promo_nombre,
            estimated_delivery_at as entrega_estimada,
            order_cost as coste_total_sin_envio,
            user_id,
            order_total as venta_final,
            delivered_at as entregado_el,
            case 
                when tracking_id = '' then null
                else md5 (replace ( tracking_id, ' ' ,''))
                end as tracking_id,
            md5 (status) as estado_id,
            status as estado_del_pedido

        from src_orders
            --    where order_id = '5dbde056-632e-484a-a30b-67665cec51ee' 

    )



select *
from orders_renamed