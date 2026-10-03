with reviews as (

    select *
    from {{ ref('stg_reviews') }}

),

aggregated as (

    select
        listing_id,

        count(*) as total_reviews,

        min(review_date) as first_review_date,
        max(review_date) as last_review_date,

        count_if(sentiment = 'positive') as positive_reviews,
        count_if(sentiment = 'neutral') as neutral_reviews,
        count_if(sentiment = 'negative') as negative_reviews,
        count_if(sentiment is null) as unclassified_reviews,

        round(
            100.0 * count_if(sentiment = 'positive')
            / nullif(count_if(sentiment is not null), 0),
            2
        ) as positive_sentiment_pct,

        round(
            100.0 * count_if(sentiment = 'neutral')
            / nullif(count_if(sentiment is not null), 0),
            2
        ) as neutral_sentiment_pct,

        round(
            100.0 * count_if(sentiment = 'negative')
            / nullif(count_if(sentiment is not null), 0),
            2
        ) as negative_sentiment_pct

    from reviews

    group by listing_id

)

select *
from aggregated