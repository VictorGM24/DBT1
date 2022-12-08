{{ config(
    materialized='incremental'    
    ) 
    }}


WITH src_google_sheets AS (
    SELECT * 
    FROM {{ source('google_sheets','usuarios_twitter') }}
    ),

 usuarios_twitter AS (
    SELECT
      md5(replace (_row, ' ', '')) as user_id,
      _row,
      correo,
      nombre,
      creado_el,
      telefono_movil,
      _fivetran_synced

    FROM src_google_sheets
    )

SELECT * FROM usuarios_twitter 

{% if is_incremental() %}

  where creado_el > (select max(creado_el) from {{ this }})

{% endif %}