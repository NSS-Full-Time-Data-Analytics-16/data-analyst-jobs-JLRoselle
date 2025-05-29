SELECT COUNT(*)
FROM data_analyst_jobs;
--Question 1: There are 1793 rows in this table

SELECT *
FROM data_analyst_jobs
LIMIT 10;
--Question 2: The company listed on line 10 is ExxonMobil

SELECT COUNT(title) AS total_TN_jobs
FROM data_analyst_jobs
WHERE location = 'TN';
--Question3a: There are 21 jobs listed in TN

SELECT COUNT(title) AS total_TN_and_KY_jobs
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';
--Question 3b: There are 27 jobs listed in either TN or KY

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;
--Question 4: 3 jobs in TN have a star rating over 4

SELECT *
FROM data_analyst_jobs;

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--Question 5: 151 job postings have a review count between 500 and 1000

SELECT *
FROM data_analyst_jobs;

SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;
--Question 6: NE has the highest star rating (4.2)

SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;
--Question 7: There are 881 unique job titles

SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';
--Question 8: There are 230 unique job titles listed in California

SELECT *
FROM data_analyst_jobs;

SELECT company, SUM(review_count) AS total_review_count
FROM data_analyst_jobs
WHERE company IS NOT NULL
GROUP BY company
HAVING SUM(review_count) > 5000;
--Question 9b: There are 70 companies that have more than 5000 reviews across all locations

SELECT company, SUM(review_count) AS total_review_count, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE company IS NOT NULL
GROUP BY company
HAVING SUM(review_count) > 5000;
--Question 9a: Find the name of each company and it's avg star rating for all companies with more than 5000 reviews

SELECT company, SUM(review_count) AS total_review_count, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE company IS NOT NULL
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY avg_star_rating DESC;
--Question 10: Google has the highest avg star rating (4.3)

SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--Question 11: There are 774 distinct job titles that contain the word analyst or analytics

SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--Question 12a: 4 job postings do not contain the words Analyst or analytics

SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--Question 12b: All 4 of the job postings say "Tableau"

SELECT *
FROM data_analyst_jobs;

SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE domain IS NOT NULL AND days_since_posting > 21 AND skill ILIKE '%SQL%'
GROUP BY domain
ORDER BY COUNT DESC;
--BONUS: Internet and Software-62, Banks and Financial Services-61, Consulting and Business Services-57, Health Care-52




