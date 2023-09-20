{% macro call_meta_process_ctrl_start_sp(process_sk, step_sk) %}

    {% set query -%}
        begin transaction;
        call eyiip_rga_db.meta.sp_process_start({{ process_sk }}, {{ step_sk }});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
