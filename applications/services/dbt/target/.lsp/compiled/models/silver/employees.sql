

WITH source AS (
    SELECT * FROM "dw_dbt"."bronze"."stg_employee"
)
SELECT
    CAST(businessentityid AS INT) AS employee_id,
    nationalidnumber AS national_id,
    loginid AS login_user,
    jobtitle AS job_title,
    CAST(birthdate AS DATE) AS birth_date,
    maritalstatus AS marital_status,
    gender,
    CAST(hiredate AS DATE) AS hire_date,
    vacationhours AS vacation_hours,
    sickleavehours AS sick_leave_hours,
    CAST(modifieddate AS TIMESTAMP) AS updated_at
FROM source