{{
    config(
        materialized='incremental',
        unique_key='review_key',
        incremental_strategy='merge'
    )
}}

with reviews as (

    select
        md5(
            concat_ws(
                '|',
                listing_id,
                review_date,
                coalesce(reviewer_name, ''),
                coalesce(review_comments, '')
            )
        ) as review_key,

        listing_id,
        review_date,
        reviewer_name,
        review_comments,
        sentiment

    from {{ ref('stg_reviews') }}

),

deduplicated as (

    select *
    from reviews

    qualify row_number() over (
        partition by review_key
        order by review_date
    ) = 1

)

select *
from deduplicated

{% if is_incremental() %}

where review_key not in (
    select review_key
    from {{ this }}
)

{% endif %}