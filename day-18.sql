-- SQL Advent Calendar - Day 18
-- Title: 12 Days of Data - Progress Tracking
-- Difficulty: hard
--
-- Question:
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--

-- Table Schema:
-- Table: daily_quiz_scores
--   subject: VARCHAR
--   quiz_date: DATE
--   score: INTEGER
--

-- My Solution:

SELECT subject, score,f,l
FROM (
  SELECT subject, score,
  ROW_NUMBER() OVER(PARTITION BY subject ORDER BY quiz_date) AS f,
  ROW_NUMBER() OVER(PARTITION BY subject ORDER BY quiz_date DESC) AS l
  FROM daily_quiz_scores
)
WHERE f = 1 OR l = 1;
