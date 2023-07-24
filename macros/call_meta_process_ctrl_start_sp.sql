{% macro call_meta_process_ctrl_start_sp(process_sk, step_sk) %}

    {% set query -%}
        begin transaction;
        call dev_cur.meta.proc_abcupdateprocessstart({{ process_sk }}, {{ step_sk }});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
