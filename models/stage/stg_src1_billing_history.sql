with bill_hist as (select * from {{ source("analytics", "billing_history") }})

select
    {{ dbt_utils.surrogate_key("KEY_HASH", "ROW_HASH") }} as billing_history_id,
    stg_src1_bill_hist_pk.nextval as stg_src1_billing_history_sk,
    *,NULL as dq_check
from bill_hist
