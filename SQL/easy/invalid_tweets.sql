/* Write your T-SQL query statement below */
-- Runtime: 2838 ms, beats 10.40% of users with MS SQL Server
SELECT tweet_id
FROM Tweets
WHERE LEN(content) > 15;
