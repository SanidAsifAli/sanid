-- create_tables.sql
{% for table_name in config.tables %}
    CREATE TABLE {{ table_name }} (
      e_name varchar(30)-- define table columns here
    );
{% endfor %}