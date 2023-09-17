/* Write your T-SQL query statement below */
-- Beats 75.68% of users with MS SQL
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;

-- Beats 98.46% of users with MS SQL
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY 1;
