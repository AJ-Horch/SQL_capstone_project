/*
 Question: What are the most in-demand skills for data analysis?
 - Join the job postings to inner join table similar to query 2
 - Identify the top 5 in-demand skill for data analysis
 - Focus on all job postings
 - Why? Retrieves the top 5 skills with the highest demand in the job market,
 porviding insights into the most valuable skills for me to learn
 */
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_location LIKE '%United Kingdom%'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 15
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist'
    AND job_location LIKE '%United Kingdom%' -- AND salary_year_avg > 40000
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 15
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short LIKE '%Engineer%'
    AND job_location LIKE '%United Kingdom%'
    AND salary_year_avg > 40000
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5