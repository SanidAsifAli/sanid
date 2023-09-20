{% macro call_meta_step_ctrl_end_sp(step_sk,status) %}

    {% set query -%}
        begin transaction;
        call eyiip_rga_db.meta.sp_step_end({{ step_sk }},{{status}});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
