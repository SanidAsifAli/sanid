{% macro call_meta_process_ctrl_end_sp(tgt_model, prcs_sk) %}
    update ey_iip_rga.meta.{{ tgt_model }}
        set process_sts_cd = 'L'
    where process_sk = {{ prcs_sk }} ;
    call ey_iip_rga.meta.sp_process_end ({{ prcs_sk }});
{% endmacro %}
