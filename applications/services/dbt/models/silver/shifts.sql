{{ config(materialized='table', schema='silver')}}

with source as (select * from {{ source('bronze_hr', 'stg_shift')}})

select
    CAST(shiftid AS INT) AS shift_id,
    CAST(starttime AS TIME) AS start_time,
    CAST(endtime AS TIME) AS end_time,
    CAST(modifieddate AS TIMESTAMP) AS updated_at
FROM source