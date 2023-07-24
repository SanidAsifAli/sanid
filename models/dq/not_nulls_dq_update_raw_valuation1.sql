select *
from
    {{ source("dq", "not_nulls_check_raw_valuation1") }}

    {{
        config(
            post_hook=update_dq_flag_tbl(
                "not_nulls_dq_update_raw_valuation1", "curr_valuation1", "billing_history_id"
            )
        )
    }}
