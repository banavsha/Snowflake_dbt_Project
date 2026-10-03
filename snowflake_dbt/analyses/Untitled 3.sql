-- LISTINGS
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT listing_id) AS distinct_listings,
    COUNT_IF(listing_id IS NULL) AS null_listing_ids,
    COUNT_IF(host_id IS NULL) AS null_host_ids,
    COUNT_IF(price IS NULL) AS null_prices,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    MIN(minimum_nights) AS min_nights,
    MAX(minimum_nights) AS max_nights
FROM AIRBNB.ANALYTICS.STG_LISTINGS;