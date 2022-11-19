with

    src_addresses as (select * from {{ ref('stg_sql_server_dbo_addresses') }}),

    direcciones as (
        select
          id_address
        , Pais
        , Codigo_Postal
        , Direccion
        , Estado_region



        from src_addresses

    )

select *
from direcciones
