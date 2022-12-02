with

    src_products as (select * from {{ ref('stg_sql_server_dbo_products') }}),

    src_tipo_planta as (select * from {{ ref('stg_tipo_planta') }}),


    productos as (
        select
            product_id,
            nombre_producto,
            tipo_planta
        


        from src_products
        join src_tipo_planta on src_tipo_planta.id_nombre_planta = src_products.id_nombre_planta

    )

select *
from productos
