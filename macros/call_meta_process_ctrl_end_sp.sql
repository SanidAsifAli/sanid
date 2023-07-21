{% macro call_meta_process_ctrl_end_sp(tgt_model, prcs_sk) %}
    update analytics.meta.{{ tgt_model }}
        set process_sts_cd = 'L'
    where process_sk = {{ prcs_sk }} ;
    call analytics.meta.proc_abcupdateprocessend ({{ prcs_sk }});
{% endmacro %}
