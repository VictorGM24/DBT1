with

    src_usuarios as (select * from {{ ref("stg_sql_server_dbo_users") }}),

    usuarios as (
        select
            user_id, actualizado_el, nombre, apellido, creado_el, telefono_movil, correo



        from src_usuarios

    )

select *
from usuarios
