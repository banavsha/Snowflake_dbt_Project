{% macro get_stay_category(minimum_nights) %}

    case
        when {{ minimum_nights }} <= 3 then 'short_stay'
        when {{ minimum_nights }} <= 14 then 'medium_stay'
        when {{ minimum_nights }} <= 30 then 'long_stay'
        else 'extended_stay'
    end

{% endmacro %}