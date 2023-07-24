{% set cols = unique_cols_meta_rule_tbl("cur_valuation2") %}

{{
    unique_in_columns(
        ref("cur_valuation2"), cols, "billing_history_tbl_id"
    )
}}
