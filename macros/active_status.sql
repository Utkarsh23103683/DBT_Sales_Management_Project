{% macro is_active_status(is_active) %}

    case when (upper(trim({{ is_active }}))) = 'Y' then 'Active' else 'Inactive' end
{% endmacro %}
