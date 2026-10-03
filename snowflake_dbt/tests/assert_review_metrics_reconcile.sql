select *
from {{ ref('int_review_metrics') }}
where total_reviews !=
      positive_reviews
    + neutral_reviews
    + negative_reviews
    + unclassified_reviews