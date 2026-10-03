SELECT
    COUNT(*) AS listing_count,
    SUM(total_reviews) AS total_reviews,
    SUM(positive_reviews) AS positive_reviews,
    SUM(neutral_reviews) AS neutral_reviews,
    SUM(negative_reviews) AS negative_reviews,
    SUM(unclassified_reviews) AS unclassified_reviews
FROM AIRBNB.ANALYTICS.INT_REVIEW_METRICS;