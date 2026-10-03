SELECT
    sentiment,
    COUNT(*) AS review_count
FROM AIRBNB.ANALYTICS.STG_REVIEWS
GROUP BY sentiment
ORDER BY review_count DESC;