{% macro unique_in_columns(model, column_names, id) %}

    {% for col in column_names -%}
        select {{ id }}, {{ col }}, count(*) as n_records
        from {{ model }}
        where {{ col }} is not null
        group by {{ id }}, {{ col }}
        having count(*) > 1
        {% if not (loop.last) %}
            union all
        {% endif %}

    {% endfor %}
{% endmacro %}
