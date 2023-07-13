{% set query %}

        SELECT SRC_ATTR FROM {{ ref('meta_rule_ctrl') }} WHERE LOWER(SRC_ENTITY) = 'stg_src1_billing_history_tbl' 
        and RULE_NM='NULL CHECK'

{% endset %}

{% set results = run_query(query) %}
{% if execute %} {% set results_list = [results.columns[0].values()[0]] %}
{% else %} {% set results_list = [] %}
{% endif %}

select {{ results_list }}
from {{ ref("stg_src1_billing_history_tbl") }}
