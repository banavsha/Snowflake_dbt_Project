with source as (

    select *
    from {{ source('airbnb', 'reviews') }}

),

renamed as (

    select
        listing_id,
        date::date as review_date,
        reviewer_name,
        comments as review_comments,
        lower(trim(sentiment)) as sentiment

    from source

)

select *
from renamed