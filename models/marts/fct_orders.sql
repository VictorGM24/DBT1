with
    pedidos as (select * from {{ ref('stg_sql_server_dbo_orders') }}),


    promos as (select * from {{ref('stg_sql_server_dbo_promos')}}),


    pedidos_cliente as (
        select
          pedidos.order_id
        , address_id
        , user_id
        , tracking_id
        , promos.id_promo
        , creado_el
        , entrega_estimada
        , entregado_el
        , promos.descuento
        , coste_envio  
        , coste_total
        , venta_final


        from pedidos
        left join promos on promos.id_promo = pedidos.id_promo

    )

select *
from pedidos_cliente
