{% set cols = not_nulls_cols_meta_rule_tbl("raw_valuation1") %}

{{ not_nulls_in_columns(ref("raw_valuation2"), cols) }}
