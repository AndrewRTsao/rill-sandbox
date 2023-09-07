WITH 

cleaned_bids_data AS (
SELECT
  countryName country_name,
  referrerURL referrer_url,
  sessionId session_id,
  eventType event_type,
  section,
  bidBidders bidders_per_bid,
  hasAdServerWonAuction has_ad_server_won_auction,
  hasPrebidWon has_pre_bid_won,
  winningSize winning_size,
  winningBidder winning_bidder,
  publisherName publisher_name,
  site,
  advertiserName advertiser_name, 
  browser,
  isInfiniteScroll is_infinite_scroll,
  responseTimes response_times,
  serverTimestamp server_timestamp

FROM test_bids_data
),

bids_data_unnested AS (
SELECT
  * EXCLUDE (response_times, bidders_per_bid), 
  UNNEST(response_times),
  UNNEST(bidders_per_bid) as active_bidders

FROM cleaned_bids_data
),

bids_data_consolidated AS (
UNPIVOT bids_data_unnested
ON COLUMNS(* EXCLUDE (country_name, referrer_url, session_id, event_type, section, has_ad_server_won_auction, has_pre_bid_won, winning_size, winning_bidder, publisher_name, site, advertiser_name, browser, is_infinite_scroll, server_timestamp, active_bidders))
INTO
  NAME bidder
  VALUE response_time
)

SELECT * FROM bids_data_consolidated