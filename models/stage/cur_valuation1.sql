with raw_valuation1 as (select * from {{ source("dev_raw", "raw_valuation1") }})

select
    {{ dbt_utils.surrogate_key("KEY_HASH", "ROW_HASH") }} as billing_history_id,
    EYIIP_RGA_DB.RAW_LOB1.SEQ_CUR_VALUATION_1_PK.nextval as stg_src1_billing_history_sk,
    *,NULL as dq_flag,NULL as dq_check
from raw_valuation1

{{ 
    config(
        post_hook=call_meta_process_ctrl_end_sp(
            "meta_process_ctrl_tbl", "100100002"
        )
    ) 
}}
