--1.How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs;
-- 1793 

--2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--ExxonMobil

--3.How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(title) AS total_TN_jobs
FROM data_analyst_jobs
WHERE location = 'TN';
--21 jobs listed in TN

SELECT COUNT(title) AS total_TN_and_KY_jobs
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';
--27 jobs listed in either TN or KY

--4.How many postings in Tennessee have a star rating above 4?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;
--3

--5.How many postings in the dataset have a review count between 500 and 1000?
SELECT *
FROM data_analyst_jobs;

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--151 

--6.Show the average star rating for companies in each state. The output should show the state as `state` and the 
--average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT *
FROM data_analyst_jobs;

SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;
--NE has the highest star rating (4.2)

--7.Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;
--881 

--8.How many unique job titles are there for California companies?
SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';
--230 

--9. Find the name of each company and it's avg star rating for all companies with more than 5000 reviews across all locations.
--How many companies have more than 5000 reviews across all locations?
SELECT *
FROM data_analyst_jobs;

SELECT company, SUM(review_count) AS total_review_count
FROM data_analyst_jobs
WHERE company IS NOT NULL
GROUP BY company
HAVING SUM(review_count) > 5000;
--70 companies have more than 5000 reviews across all locations

SELECT company, SUM(review_count) AS total_review_count, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE company IS NOT NULL
GROUP BY company
HAVING SUM(review_count) > 5000;
--Question 9a: Find the name of each company and it's avg star rating for all companies with more than 5000 reviews

--10.Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 
--5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, SUM(review_count) AS total_review_count, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE company IS NOT NULL
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY avg_star_rating DESC;
--Question 10: Google has the highest avg star rating (4.3)

--11.Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--774 

--12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
--What word do these positions have in common?
SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--4 job postings do not contain the words Analyst or analytics

SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--All 4 of the job postings say "Tableau"

--**BONUS:**
--You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that 
--require SQL and have been posted longer than 3 weeks. 
--Disregard any postings where the domain is NULL. 
--Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
SELECT *
FROM data_analyst_jobs;

SELECT domain, COUNT(title) AS hard_to_fill
FROM data_analyst_jobs
WHERE domain IS NOT NULL AND days_since_posting > 21 AND skill ILIKE '%SQL%'
GROUP BY domain
ORDER BY hard_to_fill DESC;
--BONUS: Internet and Software-62, Banks and Financial Services-61, Consulting and Business Services-57, Health Care-52




