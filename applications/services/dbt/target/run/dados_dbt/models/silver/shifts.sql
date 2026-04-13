
  
    

  create  table "dw_dbt"."silver"."shifts__dbt_tmp"
  
  
    as
  
  (
    

with source as (select * from "dw_dbt"."bronze"."stg_shift")

select
    CAST(shiftid AS INT) AS shift_id,
    CAST(starttime AS TIME) AS start_time,
    CAST(endtime AS TIME) AS end_time,
    CAST(modifieddate AS TIMESTAMP) AS updated_at
FROM source
  );
  