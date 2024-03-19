/* 
 Questions/Deliverablies: What are the top-paying data analyst jobs?
 - Identify the top 10 highest-paying Data Analyst roles that are availabe in the UK
 - Focuces on job postings with specified salaries (remove nulls)
 - Why? Highlight the top-paying opportunites for Data Analysts, offering insights into employers, skills and roles
 */
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_via,
    name AS company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE (
        job_title_short = 'Data Analyst'
        OR job_title_short = 'Data Scientist'
        OR job_title_short = 'Data Engineer'
    )
    AND job_location LIKE '%United Kingdom%'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_via,
    name AS company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_location LIKE '%United Kingdom%'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC