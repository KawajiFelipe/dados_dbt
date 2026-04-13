{{ config(materialized='table', schema='silver') }}

WITH source AS (
    SELECT * FROM {{ source('bronze_hr', 'employee_pay_history') }}
)
SELECT
    CAST(businessentityid AS INT) AS employee_id,
    CAST(ratechangedate AS TIMESTAMP) AS rate_change_at,
    CAST(rate AS DECIMAL(18,4)) AS salary_rate,
    payfrequency AS pay_frequency_type,
    CAST(modifieddate AS TIMESTAMP) AS updated_at
FROM source