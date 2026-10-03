-- HOSTS
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT host_id) AS distinct_hosts,
    COUNT_IF(host_id IS NULL) AS null_host_ids,
    COUNT_IF(host_name IS NULL) AS null_host_names,
    COUNT_IF(is_superhost IS NULL) AS null_superhost
FROM AIRBNB.ANALYTICS.STG_HOSTS;