with

    src_promos as (select * from {{ ref('stg_sql_server_dbo_promos') }}),

    promociones as (
        select
          id_promo,
          promo_nombre,
          estado_promo



        from src_promos

    )

select *
from promociones
