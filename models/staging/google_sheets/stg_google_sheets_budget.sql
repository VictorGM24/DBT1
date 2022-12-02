{{
  config(
    materialized='view'
  )
}}

WITH src_google_sheets_budget AS (
    SELECT * 
    FROM {{ source('google_sheets','budget') }}
    ),

 budget AS (
    SELECT
      _row as fila,
      quantity as cantidad,
      month as fecha,
      product_id,
      _fivetran_synced
    FROM src_google_sheets_budget
    )

SELECT * FROM budget