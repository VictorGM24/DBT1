with
    pedidos as (select * from {{ ref('stg_sql_server_dbo_orders') }}),

    promos as (select * from {{ref('stg_sql_server_dbo_promos')}}),

    dim_fecha as (select * from {{ref('dim_fecha')}}),

    recuento_usuarios as (select * from {{ref('int_recuento_usuarios')}}),

    pedidos_cliente as (
        select
          pedidos.order_id
        , address_id
        , pedidos.user_id
        , tracking_id
        , promos.id_promo
        , dim_fecha.id_date
        , entrega_estimada
        , entregado_el
        , DATEDIFF(day, creado_el, entregado_el) AS tiempo_entrega
        , promos.descuento
        , coste_envio  
        , coste_total_sin_envio
        , venta_final
        , Importe_Medio_Pedido_Cliente


        from pedidos
        left join promos on promos.id_promo = pedidos.id_promo
        join dim_fecha on dim_fecha.fecha_forecast = cast(pedidos.creado_el as date)
        join recuento_usuarios on recuento_usuarios.user_id = pedidos.user_id

    )

select *
from pedidos_cliente
