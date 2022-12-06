

with
    src_users as (select * from {{ ref('stg_sql_server_dbo_users') }}),

    twitter_usuarios as (select * from {{ ref('stg_usuarios_twitter') }}),

    users_incrementales as (

        SELECT 
            correo,
            nombre
            FROM src_users
            UNION
        SELECT 
            correo,
            nombre
            FROM twitter_usuarios

    

    )


select * 
from users_incrementales
