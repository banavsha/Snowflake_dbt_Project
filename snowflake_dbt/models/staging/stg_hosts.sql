with source as (

    select *
    from {{ source('airbnb', 'hosts') }}

),

renamed as (

    select
        id as host_id,
        name as host_name,

        case
            when lower(trim(is_superhost)) = 't' then true
            when lower(trim(is_superhost)) = 'f' then false
            else null
        end as is_superhost,

        created_at,
        updated_at

    from source

)

select *
from renamed