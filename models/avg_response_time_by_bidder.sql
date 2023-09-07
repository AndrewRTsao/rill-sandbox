WITH

response_times_unnested AS (
SELECT 
  UNNEST(responseTimes)
FROM test_bids_data
),

response_time_by_bidder AS (
UNPIVOT response_times_unnested
ON COLUMNS(*)
INTO
  NAME bidder
  VALUE response_time
)

SELECT 
  bidder,
  AVG(response_time) as avg_response_time 
FROM response_time_by_bidder
GROUP BY bidder
ORDER BY avg_response_time DESC