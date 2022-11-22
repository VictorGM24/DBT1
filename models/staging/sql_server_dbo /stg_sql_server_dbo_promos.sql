with
    src_promos as (select * from {{ source("sql_server_dbo", "promos") }}),

    promos as (

        select

            md5(replace (promo_id, ' ', '')) as id_promo,
            promo_id as promo_nombre,
            discount as descuento,
            status as estado_promo

        from src_promos

    )

select *
from promos
