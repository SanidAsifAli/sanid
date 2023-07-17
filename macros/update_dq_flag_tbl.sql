{% macro update_dq_flag_tbl(src_model, tgt_model, id) %}
    update {{ tgt_model }}
        set dq_flag = 'FALSE'
    where {{ id }} in (select distinct {{ id }} from {{ src_model }}) and dq_flag = 'TRUE' ;
    update {{ tgt_model }}
        set dq_flag = 'TRUE'
    where {{ id }} not in (select distinct {{ id }} from {{ src_model }}) and dq_flag IS NULL;

    drop view if exists {{ src_model }};
{% endmacro %}
