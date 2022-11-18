{{ config(materialized="view") }}

with
    src_promos as (select * from {{ source("sql_server_dbo", "promos") }}),

    promos_renamed as (

        select promo_id, discount as descuento, status as estado_promo from src_promos

    )



select *
from promos_renamed
