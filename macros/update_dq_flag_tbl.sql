{% macro update_dq_flag_tbl(src_model, tgt_model, id) %}
    update {{ tgt_model }}
        set dq_flag = 'FALSE'
    where {{ id }} in (select distinct {{ id }} from {{ src_model }}) ;
    update {{ tgt_model }}
        set dq_flag = 'TRUE'
    where {{ id }} not in (select distinct {{ id }} from {{ src_model }}) ;

    drop view if exists {{ src_model }};
{% endmacro %}
