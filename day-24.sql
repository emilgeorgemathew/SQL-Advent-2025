-- SQL Advent Calendar - Day 24
-- Title: New Year Goals - User Type Analysis
-- Difficulty: hard
--
-- Question:
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--

-- Table Schema:
-- Table: user_goals
--   user_id: INT
--   user_type: VARCHAR
--   goal_id: INT
--   goal_status: VARCHAR
--

-- My Solution:

SELECT user_type,
  COUNT(goal_id) AS total_completed_goals,
  COUNT(goal_id) * 1.0 / COUNT(DISTINCT user_id) AS avg_goals_per_user,
  COUNT(DISTINCT user_id) AS total_users
FROM user_goals
WHERE goal_status = 'Completed'
GROUP BY user_type
ORDER BY avg_goals_per_user DESC;
