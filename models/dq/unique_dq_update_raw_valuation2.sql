select *
from
    {{ source("dq", "unique_dq_check_raw_valuation2") }}

    {{
        config(
            post_hook=update_dq_flag_tbl(
                "unique_dq_update_raw_valuation2", "cur_valuation2", "billing_history_tbl_id"
            )
        )
    }}
