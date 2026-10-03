select *
from {{ ref('int_review_metrics') }}
where positive_sentiment_pct < 0
   or positive_sentiment_pct > 100
   or neutral_sentiment_pct < 0
   or neutral_sentiment_pct > 100
   or negative_sentiment_pct < 0
   or negative_sentiment_pct > 100