{% macro call_meta_step_ctrl_end_sp(step_sk) %}

    {% set query -%}
        begin transaction;
        call ey_iip_rga.meta.sp_step_end({{ step_sk }});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
