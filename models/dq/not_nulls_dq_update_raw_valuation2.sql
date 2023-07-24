select *
from
    {{ source("dq", "not_nulls_check_raw_valuation2") }}

    {{
        config(
            post_hook=update_dq_flag_tbl(
                "not_nulls_dq_update_raw_valuation2", "raw_valuation2", "billing_history_tbl_id"
            )
        )
    }}
