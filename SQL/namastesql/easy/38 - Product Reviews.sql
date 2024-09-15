/*
Suppose you are a data analyst working for a retail company, and your team is interested in analysing customer feedback to identify trends and patterns in product reviews.

Your task is to write an SQL query to find all product reviews containing the word "excellent" or "amazing" in the review text. However, you want to exclude reviews that contain the word "not" immediately before "excellent" or "amazing". Please note that the words can be in upper or lower case or combination of both. 

Your query should return the review_id,product_id, and review_text for each review meeting the criteria, display the output in ascending order of review_id.

 

Table: product_reviews
+-------------+--------------+
| COLUMN_NAME | DATA_TYPE    |
+-------------+--------------+
| review_id   | int          |
| product_id  | int          |
| review_text | varchar(40)  |
+-------------+--------------+
*/

-- Solution:

with processed_reviews as ( 
  select review_id, product_id, review_text
  from product_reviews
  where (review_text not like "%not amazing%" and review_text not like "%not excellent%")
  )
SELECT * FROM processed_reviews
where review_text like "%Excellent%" OR review_text like "%Amazing%"
