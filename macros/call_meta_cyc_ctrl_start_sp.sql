{% macro call_meta_cyc_ctrl_start_sp(cyc_sk, force_ind) %}

    {% set query -%}
        begin transaction;
        call eyiip_rga_db.meta.sp_cyc_start({{ cyc_sk }}, '{{ force_ind }}');
        commit;
    {%- endset %}

    {% do run_query(query) %}
{% endmacro %}
