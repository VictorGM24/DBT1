WITH 

    src_users as (select * from {{ ref('stg_sql_server_dbo_users') }}),

    twitter_usuarios as (select * from {{ ref('stg_google_sheets_usuarios_twitter') }}),

    users_incrementales as (

        SELECT 
            --user_id,
            nombre,
            correo,
            telefono_movil,
            _fivetran_synced
            FROM src_users
            UNION
        SELECT 
           -- user_id,
            nombre,
            correo,
            telefono_movil,
            _fivetran_synced
            FROM twitter_usuarios

    

    )


select * 
from users_incrementales

