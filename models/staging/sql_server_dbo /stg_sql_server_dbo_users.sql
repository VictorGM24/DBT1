{{ config(materialized="view") }}

with
    src_users as (select * from {{ source("sql_server_dbo", "users") }}),

    users_renamed as (

        select
            user_id,
            cast(updated_at as date) as actualizado_el,
            address_id,
            first_name as nombre,
            last_name as apellido,
            cast(created_at as date) as creado_el,
            phone_number as telefono_movil,
            email as correo,
            total_orders as total_pedidos

        from src_users

    )



select *
from users_renamed
