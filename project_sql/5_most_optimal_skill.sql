/* Use a CTE to combine results from queries 3 and 4
 Focusing on high demand skills and high salaries 
 London location doesn't reveal salaries. So maybe focus on remote?
 
 */
-- query 3 
WITH skills_demand AS(
    SELECT skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location LIKE '%London%'
    GROUP BY skills_dim.skill_id
),
average_salary AS(
    SELECT skills_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location LIKE '%London%'
    GROUP BY skills_dim.skill_id
)
SELECT skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
    INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY demand_count DESC,
    avg_salary DESC -- without london location, with salary
    WITH skills_demand AS(
        SELECT skills_dim.skill_id,
            skills_dim.skills,
            COUNT(skills_job_dim.job_id) AS demand_count
        FROM job_postings_fact
            INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
            INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        WHERE job_title_short = 'Data Analyst'
            AND job_location LIKE '%London%'
        GROUP BY skills_dim.skill_id
    ),
    average_salary AS(
        SELECT skills_dim.skill_id,
            ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
        FROM job_postings_fact
            INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
            INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        WHERE job_title_short = 'Data Analyst'
            AND salary_year_avg IS NOT NULL
            AND job_location LIKE '%London%'
        GROUP BY skills_dim.skill_id
    )
SELECT skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
    INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY avg_salary DESC,
    demand_count DESC