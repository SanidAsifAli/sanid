{% set cols = not_nulls_cols_meta_rule_tbl("cur_valuation1") %}

{{ not_nulls_in_columns(ref("cur_valuation1"), cols) }}
