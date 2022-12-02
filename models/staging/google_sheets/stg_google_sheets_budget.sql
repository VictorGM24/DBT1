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
    SELECT*
    FROM src_google_sheets_budget
    )

SELECT * FROM budget