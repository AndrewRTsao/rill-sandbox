WITH

bidders_unnested AS (
SELECT 
  UNNEST(bidBidders) as bidder
FROM test_bids_data
)

SELECT
  bidder,
  count(*) as total_bids
FROM bidders_unnested
GROUP BY bidder
ORDER BY total_bids DESC