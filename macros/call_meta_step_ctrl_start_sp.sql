{% macro call_meta_step_ctrl_start_sp(step_sk) %}

    {% set query -%}
        begin transaction;
        call dev_cur.meta.proc_abcupdatestepstart({{ step_sk }});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
