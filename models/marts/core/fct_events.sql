with
    eventos as (select * from {{ ref('stg_sql_server_dbo_events') }}),
    
    clientes as (select * from {{ ref('stg_sql_server_dbo_users') }}),

    pedidos as (select * from {{ ref('stg_sql_server_dbo_orders') }}),

    articulos as (select * from {{ref('stg_sql_server_dbo_products')}}),

    eventos_completos as (
        select
         event_id
        ,pagina_url
        ,tipo_evento
        ,eventos.user_id
        --,eventos.product_id
        ,session_id
        ,eventos.creado_el
        ,eventos.order_id

        from eventos
        join clientes on clientes.user_id = eventos.user_id
        join pedidos on pedidos.order_id = eventos.order_id
       -- join articulos on articulos.product_id = eventos.product_id
    )

select *
from eventos_completos
