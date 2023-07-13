{% set cols = not_nulls_cols_meta_rule_tbl("stg_src1_billing_history") %}

{{ not_nulls_in_columns(ref("stg_src1_billing_history"), cols) }}
