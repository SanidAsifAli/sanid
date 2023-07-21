{% macro call_meta_cyc_ctrl_end_sp(cyc_sk) %}

    {% set query -%}
        begin transaction;
        call analytics.meta.proc_abcupdatecycend({{ cyc_sk }});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
