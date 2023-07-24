select *
from
    {{ source("dq", "unique_check_raw_valuation1") }}

    {{
        config(
            post_hook=update_dq_flag_tbl(
                "unique_check_raw_valuation1", "cur_valuation1", "billing_history_id"
            )
        )
    }}

