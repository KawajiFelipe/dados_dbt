with emp as (select * from "dw_dbt"."silver_silver"."employees"),

pay as (select distinct on (employee_id) * from "dw_dbt"."silver_silver"."pay_history"
        order by employee_id, rate_change_at DESC
        )

select
    e.*,
    p.salary_rate,
    p.pay_frequency_type
from emp e
left join pay p on e.employee_id = p.employee_id