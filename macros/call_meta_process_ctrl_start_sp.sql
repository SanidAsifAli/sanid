{% macro call_meta_process_ctrl_start_sp(process_sk, step_sk) %}

    {% set query -%}
        begin transaction;
        call ey_iip_rga.meta.sp_process_start({{ process_sk }}, {{ step_sk }});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
