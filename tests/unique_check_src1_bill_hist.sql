{% set cols = unique_cols_meta_rule_tbl("cur_valuation1") %}

{{ unique_in_columns(ref("cur_valuation1"), cols, "billing_history_id") }}
