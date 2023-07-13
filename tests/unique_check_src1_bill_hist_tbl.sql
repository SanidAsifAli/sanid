{% set cols = unique_cols_meta_rule_tbl("stg_src1_billing_history_tbl") %}

{{
    unique_in_columns(
        ref("stg_src1_billing_history_tbl"), cols, "billing_history_tbl_id"
    )
}}
