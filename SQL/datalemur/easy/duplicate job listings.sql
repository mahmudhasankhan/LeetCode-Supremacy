select count(*) as duplicate_companies
FROM (SELECT 
company_id,
count(title), count(description) FROM job_listings
group by company_id
having count(title) > 1 and count(description) > 1) a
