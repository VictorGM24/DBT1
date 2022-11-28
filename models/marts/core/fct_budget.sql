with
    budget as (select * from {{ ref('stg_google_sheets_budget') }}),



    presupuestos as (
        select
          fila
        , product_id 
        , cantidad
        , fecha


        from budget
  

    )

select *
from presupuestos