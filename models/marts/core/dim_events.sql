with

    eventos as (select * from {{ ref('stg_sql_server_dbo_events') }}),

    todo_eventos as (
        select
          pagina_url
        , tipo_evento
        , event_id
        , user_id



        from eventos

    )

select *
from todo_eventos