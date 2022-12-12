with
    eventos as (select * from {{ ref('stg_sql_server_dbo_events') }}),
        
    pedidos as (select * from {{ ref('stg_sql_server_dbo_orders') }}),

    dim_fecha as (select * from {{ref('dim_fecha')}}),

    eventos_usuarios as (select * from {{ref('int_session_events_users')}}),

    eventos_completos as (
        select
          event_id
        , eventos.user_id
        , dim_fecha.id_date
        , eventos_usuarios.session_id
        , eventos.creado_el
        , eventos.order_id
        , eventos.product_id
        , {{column_values_to_metrics(ref('stg_sql_server_dbo_events'),'tipo_evento')}}


        from eventos
        left join pedidos on pedidos.order_id = eventos.order_id
        left join dim_fecha on dim_fecha.fecha_forecast = cast(pedidos.creado_el as date)
        join eventos_usuarios on eventos_usuarios.session_id = eventos.session_id
        group by eventos.user_id, event_id, id_date, eventos_usuarios.session_id, eventos.creado_el, eventos.order_id, eventos.product_id
    )

select *
from eventos_completos
