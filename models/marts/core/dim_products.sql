with

    products as (select * from {{ ref('stg_sql_server_dbo_products') }}),

    tipo_planta as (select * from {{ ref('stg_tipo_planta') }}),


    productos as (
        select
            product_id,
            nombre_producto,
            tipo_planta
        


        from products
        join tipo_planta on tipo_planta.id_nombre_planta = products.id_nombre_planta

    )

select *
from productos
