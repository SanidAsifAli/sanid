{% set cols = unique_cols_meta_rule_tbl("stg_src1_billing_history") %}

{{ unique_in_columns(ref("stg_src1_billing_history"), cols, "billing_history_id") }}
