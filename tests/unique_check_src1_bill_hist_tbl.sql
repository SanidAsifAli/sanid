{% set cols = unique_cols_meta_rule_tbl("raw_valuation2") %}

{{
    unique_in_columns(
        ref("raw_valuation2"), cols, "billing_history_tbl_id"
    )
}}
