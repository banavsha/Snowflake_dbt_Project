-- REVIEWS
SELECT
    COUNT(*) AS total_rows,
    COUNT_IF(listing_id IS NULL) AS null_listing_ids,
    COUNT_IF(review_date IS NULL) AS null_dates,
    COUNT_IF(review_comments IS NULL) AS null_comments,
    COUNT_IF(sentiment IS NULL) AS null_sentiment,
    COUNT(DISTINCT sentiment) AS sentiment_values
FROM AIRBNB.ANALYTICS.STG_REVIEWS;