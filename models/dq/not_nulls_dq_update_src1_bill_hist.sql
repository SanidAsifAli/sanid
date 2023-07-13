select *
from
    {{ source("dq", "not_nulls_dq_src1_bill_hist") }}

    {{
        config(
            post_hook=update_dq_flag_tbl(
                "not_nulls_dq_update_src1_bill_hist", "stg_src1_billing_history", "billing_history_id"
            )
        )
    }}
