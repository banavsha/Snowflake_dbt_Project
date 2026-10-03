select
    listing_id,
    minimum_nights
from {{ ref('stg_listings') }}
where minimum_nights < 1