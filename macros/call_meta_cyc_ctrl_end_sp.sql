{% macro call_meta_cyc_ctrl_end_sp(cyc_sk) %}

    {% set query -%}
        begin transaction;
        call ey_iip_rga.meta.sp_cyc_end({{ cyc_sk }});
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
