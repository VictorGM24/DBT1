 WITH
 eventos as (
    select*
    
    FROM {{ ref('stg_sql_server_dbo_events') }}
    ),

int_session_events_users AS (
    SELECT
         session_id
        ,creado_el
        ,user_id
        ,product_id
        ,{{column_values_to_metrics(ref('stg_sql_server_dbo_events'),'tipo_evento')}}

    FROM eventos


    group by 1,2,3,4

    )


SELECT * FROM int_session_events_users
