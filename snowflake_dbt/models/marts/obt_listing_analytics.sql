with listings as (

    select *
    from {{ ref('int_listings_enriched') }}

),

reviews as (

    select *
    from {{ ref('int_review_metrics') }}

),

final as (

    select

        -- Listing
        l.listing_id,
        l.listing_name,
        l.listing_url,
        l.room_type,
        l.price,
        l.minimum_nights,

        {{ get_stay_category('l.minimum_nights') }} as stay_category,

        -- Host
        l.host_id,
        l.host_name,
        l.is_superhost,
        l.host_created_at,

        -- Listing lifecycle
        l.listing_created_at,
        l.listing_updated_at,

        -- Review activity
        coalesce(r.total_reviews, 0) as total_reviews,
        r.first_review_date,
        r.last_review_date,

        -- Sentiment
        coalesce(r.positive_reviews, 0) as positive_reviews,
        coalesce(r.neutral_reviews, 0) as neutral_reviews,
        coalesce(r.negative_reviews, 0) as negative_reviews,
        coalesce(r.unclassified_reviews, 0) as unclassified_reviews,

        r.positive_sentiment_pct,
        r.neutral_sentiment_pct,
        r.negative_sentiment_pct,

        -- Useful analytical flag
        case
            when r.listing_id is null then false
            else true
        end  as has_reviews

    from listings l

    left join reviews r
        on l.listing_id = r.listing_id

)

select *
from final