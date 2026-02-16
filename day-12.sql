-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

WITH max_active AS 
(
SELECT dt, user_id, user_name, msg_cnt, rnk
FROM (
  SELECT nu.user_id, nu.user_name, DATE(nm.sent_at) AS dt, 
         COUNT(nm.message_id) AS msg_cnt,
         DENSE_RANK() OVER (PARTITION BY DATE(nm.sent_at)
         ORDER BY COUNT(nm.message_id) DESC) as rnk
  FROM npn_users nu
  JOIN npn_messages nm 
  ON nu.user_id = nm.sender_id
  GROUP BY nu.user_id, nu.user_name, DATE(nm.sent_at)
) x
)
SELECT dt, user_id, user_name, msg_cnt
FROM max_active
WHERE rnk = 1
ORDER BY dt DESC, user_name;
