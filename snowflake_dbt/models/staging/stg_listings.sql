with source as (

    select *
    from {{ source('airbnb', 'listings') }}

),

renamed as (

    select
        id as listing_id,
        listing_url,
        name as listing_name,
        room_type,
        case
            when minimum_nights = 0 then 1
        else minimum_nights
        end as minimum_nights,
        host_id,

        -- Convert values such as '$90.00' into numeric 90.00
        try_to_decimal(
            replace(replace(price, '$', ''), ',', ''),
            10, 2
        ) as price,

        created_at,
        updated_at

    from source

)

select *
from renamed