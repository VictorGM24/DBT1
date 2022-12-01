{{
  config(
    materialized='view'
  )
}}

WITH
tipo_planta AS (
    SELECT *
    FROM {{ ref('tipo_planta')}}
)

SELECT * FROM tipo_planta