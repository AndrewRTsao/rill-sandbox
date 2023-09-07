SELECT winningBidder AS bidder, count(*) AS bids_won
FROM test_bids_data
WHERE length(winningBidder) != 0
GROUP BY bidder
ORDER BY bids_won DESC