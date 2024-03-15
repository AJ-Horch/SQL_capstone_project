-- CTE practice
SELECT COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'London, UK' THEN 'Local'
        WHEN job_location = 'London' THEN 'Local'
        WHEN job_location = 'United Kingdom' THEN 'Local'
        WHEN job_location LIKE '%UK%' THEN 'Local' -- Fuzzy match for UK
        WHEN job_location LIKE '%United Kingdom%' THEN 'Local' -- Fuzzy match for United Kingdom
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;
-- problem 7, CTE example
WITH remote_job_skills AS (
    SELECT skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim AS skills_to_job
        INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    WHERE job_postings.job_work_from_home = TRUE
        AND job_title_short = 'Data Scientist'
    GROUP BY skill_id
)
SELECT skills.skill_id,
    skills as skill_name,
    skill_count
FROM remote_job_skills
    INNER JOIN skills_dim AS skills ON remote_job_skills.skill_id = skills.skill_id
ORDER BY skill_count DESC
LIMIT 5;