{% macro call_meta_process_ctrl_end_sp(tgt_model, prcs_sk) %}
    update dev_cur.meta.{{ tgt_model }}
        set process_sts_cd = 'L'
    where process_sk = {{ prcs_sk }} ;
    call dev_cur.meta.proc_abcupdateprocessend ({{ prcs_sk }});
{% endmacro %}
