select *
from
    {{ source("dq", "unique_dq_check_src1_bill_hist") }}

    {{
        config(
            post_hook=update_dq_flag_tbl(
                "unique_dq_update_src1_bill_hist", "stg_src1_billing_history", "billing_history_id"
            )
        )
    }}
