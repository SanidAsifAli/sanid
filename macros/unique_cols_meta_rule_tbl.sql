{% macro unique_cols_meta_rule_tbl(model) %}
    {% set query %}

        SELECT SRC_ATTR FROM {{ source("meta", "meta_rule_ctrl") }} 
        WHERE LOWER(SRC_ENTITY) = '{{ model }}' and RULE_NM='UNIQUE CHECK'

    {% endset %}

    {% set results = run_query(query) %}
    {% if execute %} {% set results_list = results.columns[0].values() %}
    {% else %} {% set results_list = [] %}
    {% endif %}

    {{ return(results_list) }}

{% endmacro %}


