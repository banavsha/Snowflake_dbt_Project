//combine listing + host attributes
with listings as (

    select *
    from {{ ref('stg_listings') }}

),

hosts as (

    select *
    from {{ ref('stg_hosts') }}

),

enriched as (

    select
        l.listing_id,
        l.listing_url,
        l.listing_name,
        l.room_type,
        l.minimum_nights,
        l.price,

        l.host_id,
        h.host_name,
        h.is_superhost,

        l.created_at as listing_created_at,
        l.updated_at as listing_updated_at,
        h.created_at as host_created_at,
        h.updated_at as host_updated_at

    from listings l

    left join hosts h
        on l.host_id = h.host_id
)

select *
from enriched