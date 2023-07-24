select *
from
    {{ source("dq", "unique_dq_check_raw_valuation1") }}

    {{
        config(
            post_hook=update_dq_flag_tbl(
                "unique_dq_update_raw_valuation1", "raw_valuation1", "billing_history_id"
            )
        )
    }}

