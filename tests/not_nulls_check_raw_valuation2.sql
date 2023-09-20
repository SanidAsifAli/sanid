{% set cols = not_nulls_cols_meta_rule_tbl("cur_valuation2") %}

{{ not_nulls_in_columns(ref("cur_valuation2"), cols) }}
