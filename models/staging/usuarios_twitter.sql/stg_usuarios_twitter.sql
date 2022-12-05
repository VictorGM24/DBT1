{{
    config(
        materialized='incremental'
    )
}}

WITH
usuarios_twitter_pro AS (
    SELECT 

      md5(replace (nombre, ' ', '')) as user_id,
      nombre,
      telefono_movil, 
      correo,
      creado_el

    FROM {{ ref('usuarios_twitter')}}
)

SELECT * FROM usuarios_twitter_pro