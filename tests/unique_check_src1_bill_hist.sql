{% set cols = unique_cols_meta_rule_tbl("raw_valuation1") %}

{{ unique_in_columns(ref("raw_valuation1"), cols, "billing_history_id") }}
