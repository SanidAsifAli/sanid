{% macro call_dq_meta_process_ctrl_end_sp(process_sk) %}




    {% set query -%}

        begin transaction;

        call eyiip_rga_db.meta.sp_process_end({{ process_sk }});

        commit;

    {%- endset %}




    {% do run_query(query) %}

{% endmacro %}