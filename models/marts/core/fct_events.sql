with
    eventos as (select * from {{ ref('stg_sql_server_dbo_events') }}),
    
    clientes as (select * from {{ ref('stg_sql_server_dbo_users') }}),

    pedidos as (select * from {{ ref('stg_sql_server_dbo_orders') }}),

    dim_fecha as (select * from {{ref('dim_fecha')}}),

    eventos_completos as (
        select
          event_id
        , pagina_url
        , tipo_evento
        , eventos.user_id
        , dim_fecha.id_date
        , session_id
        , eventos.creado_el
        , eventos.order_id


        from eventos
        join clientes on clientes.user_id = eventos.user_id
        join pedidos on pedidos.order_id = eventos.order_id
        join dim_fecha on dim_fecha.fecha_forecast = cast(pedidos.creado_el as date)
    )

select *
from eventos_completos
