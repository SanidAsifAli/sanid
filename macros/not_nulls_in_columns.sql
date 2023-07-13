{% macro not_nulls_in_columns(model, column_names) %}
    select *
    from {{ model }}
    where {% for col in column_names -%} {{ col }} is null or {% endfor %} false
{% endmacro %}
