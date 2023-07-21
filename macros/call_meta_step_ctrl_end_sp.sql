{% macro call_meta_step_ctrl_end_sp(step_sk) %}

    {% set query -%}
        begin transaction;
        call analytics.meta.proc_abcupdatestepend({{ step_sk }});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
