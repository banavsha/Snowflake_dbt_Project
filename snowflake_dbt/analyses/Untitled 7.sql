SELECT
    listing_id,
    listing_name,
    room_type,
    price,
    minimum_nights
FROM AIRBNB.ANALYTICS.STG_LISTINGS
WHERE price = 0
   OR price > 1000
   OR minimum_nights = 0
   OR minimum_nights > 365
ORDER BY price DESC;