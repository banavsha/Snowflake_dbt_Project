SELECT
    (SELECT COUNT(*)
     FROM AIRBNB.ANALYTICS.STG_LISTINGS l
     LEFT JOIN AIRBNB.ANALYTICS.STG_HOSTS h
       ON l.host_id = h.host_id
     WHERE h.host_id IS NULL) AS listings_without_host,

    (SELECT COUNT(*)
     FROM AIRBNB.ANALYTICS.STG_REVIEWS r
     LEFT JOIN AIRBNB.ANALYTICS.STG_LISTINGS l
       ON r.listing_id = l.listing_id
     WHERE l.listing_id IS NULL) AS reviews_without_listing;