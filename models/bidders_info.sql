SELECT a.bidder, avg_response_time, total_bids, bids_won
FROM avg_response_time_by_bidder a
LEFT JOIN total_bids_by_bidder b
ON a.bidder = b.bidder
LEFT JOIN wins_by_bidder c
ON a.bidder = c.bidder
