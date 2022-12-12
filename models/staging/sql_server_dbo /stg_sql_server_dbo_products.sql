{{
  config(
    materialized='view'
  )
}}

WITH src_products AS (

    SELECT *

    FROM {{ source('sql_server_dbo', 'products') }}

    ),

products_renamed AS (

    SELECT
          product_id 
        , price as precio
        , md5(replace (name, ' ', '')) as id_nombre_planta
        , name as nombre_producto
        , inventory as inventario

    FROM src_products

    )



SELECT * FROM products_renamed 