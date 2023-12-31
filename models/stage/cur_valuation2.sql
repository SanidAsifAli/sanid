with raw_valuation2 as (select * from {{ source("dev_raw", "raw_valuation2") }})

select
    {{ dbt_utils.surrogate_key("KEY_HASH", "ROW_HASH") }} as billing_history_tbl_id,
    DEV_RAW.GARE.SEQ_CUR_VALUATION_2_PK.nextval as stg_src1_billing_history_tbl_sk,
    *,NULL as dq_check
from raw_valuation2

{{ 
    config(
        post_hook=call_meta_process_ctrl_end_sp(
            "meta_process_ctrl_tbl", "100100004"
        )
    ) 
}}