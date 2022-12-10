with
    budget as (select * from {{ ref('stg_google_sheets_budget') }}),

  --  dim_fecha as (select * from {{ref('dim_fecha')}}),

   -- producto_budget  as (select * from {{ ref('stg_sql_server_dbo_products') }}),



    presupuestos as (
        select
          fila
       -- , producto_budget.product_id 
        , cantidad
        , fecha
       -- , dim_fecha.id_date
     --   , mes
      --  , inventario
    --    , precio
        

        from budget
    --    join dim_fecha on dim_fecha.fecha_forecast = cast(budget.fecha as date)
     --   join producto_budget on producto_budget.product_id = budget.product_id
      --  where mes = 3 
    )

select *
from presupuestos