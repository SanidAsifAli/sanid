{% macro update_dq_flag_tbl(src_model, tgt_model, id) %}
    update {{ tgt_model }}
        set dq_flag = 'FALSE',
        dq_check = case when substring({{ src_model }},1,9)='not_nulls'
then 'NULL_CHECK' 
when substring({{ src_model }},1,9)='unique_dq'
then 'UNIQUE_CHECK' end
    where {{ id }} in (select distinct {{ id }} from {{ src_model }});
    update {{ tgt_model }}
        set dq_flag = 'TRUE'
    where {{ id }} not in (select distinct {{ id }} from {{ src_model }}) and dq_flag IS NULL;

    drop view if exists {{ src_model }};
{% endmacro %}
