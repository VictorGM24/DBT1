{{
  config(
    materialized='view'
  )
}}

WITH src_google_sheets AS (
    SELECT * 
    FROM {{ source('google_sheets', 'budget') }}
    ),

budget AS (
    SELECT
          _row as fila
        , product_id 
        , quantity as cantidad
        , month as fecha
    FROM src_google_sheets
    )

SELECT * FROM budget