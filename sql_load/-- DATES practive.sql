-- DATES
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM job_postings_fact -- Lets say we only needed the date
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM job_postings_fact -- AT TIME ZONE
    -- there is no time zone in the data
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date
FROM job_postings_fact
LIMIT 5;
-- EXTRACT, gets field (year, month, dat) from a date/time value
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS date_month,
    EXTRACT(
        YEAR
        FROM job_posted_date
    ) AS date_year
FROM job_postings_fact
LIMIT 5;
-- BRING IT ALL TOGETHER
SELECT COUNT(job_id) AS job_posted_count,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY MONTH
ORDER BY job_posted_count DESC;