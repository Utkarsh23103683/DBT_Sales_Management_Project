{% macro is_active_status(is_active) %}

    case
        when (upper(trim({{ is_active }}))) = 'Y'
        then 'Active'
        when upper(trim({{ is_active }})) = 'N'
        then 'Inactive'
        else null
    end
{% endmacro %}
