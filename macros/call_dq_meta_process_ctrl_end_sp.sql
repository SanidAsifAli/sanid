{% macro call_dq_meta_process_ctrl_end_sp(process_sk) %}




    {% set query -%}

        begin transaction;

        call analytics.meta.proc_abcupdateprocessend({{ process_sk }});

        commit;

    {%- endset %}




    {% do run_query(query) %}

{% endmacro %}