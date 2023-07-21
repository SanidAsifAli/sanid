with bill_hist_tbl as (select * from {{ source("analytics", "billing_history_tbl") }})

select
    {{ dbt_utils.surrogate_key("KEY_HASH", "ROW_HASH") }} as billing_history_tbl_id,
    stg_src1_bill_hist_tbl_pk.nextval as stg_src1_billing_history_tbl_sk,
    *,NULL as dq_check
from bill_hist_tbl

{{ 
    config(
        post_hook=call_meta_process_ctrl_end_sp(
            "meta_process_ctrl_tbl", "100100004"
        )
    ) 
}}