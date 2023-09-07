SELECT count (distinct sessionId) AS unique_session_count
FROM test_bids_data
WHERE length(sessionId) != 0