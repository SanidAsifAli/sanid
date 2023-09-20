{% macro call_meta_step_ctrl_start_sp(step_sk) %}

    {% set query -%}
        begin transaction;
        call eyiip_rga_db.meta.sp_step_start({{ step_sk }});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
