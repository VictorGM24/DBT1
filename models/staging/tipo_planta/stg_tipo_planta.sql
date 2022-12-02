{{
  config(
    materialized='view'
  )
}}

WITH
tipo_planta_renamed AS (
    SELECT 

      md5(replace (nombre_planta, ' ', '')) as id_nombre_planta,
      nombre_planta,
      tipo_planta

    FROM {{ ref('tipo_planta')}}
)

SELECT * FROM tipo_planta_renamed