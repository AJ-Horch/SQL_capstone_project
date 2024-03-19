/* What are the top skills based on salary? 
 */
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%UK%'
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%UK%'
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
    /*
     JSON RESULTS 
     [
     {
     "skills": "redis",
     "avg_salary": "76"
     },
     {
     "skills": "digitalocean",
     "avg_salary": "71"
     },
     {
     "skills": "clojure",
     "avg_salary": "68"
     },
     {
     "skills": "node",
     "avg_salary": "65"
     },
     {
     "skills": "swift",
     "avg_salary": "65"
     },
     {
     "skills": "mongo",
     "avg_salary": "58"
     },
     {
     "skills": "neo4j",
     "avg_salary": "57"
     },
     {
     "skills": "ansible",
     "avg_salary": "56"
     },
     {
     "skills": "cobol",
     "avg_salary": "56"
     },
     {
     "skills": "kafka",
     "avg_salary": "53"
     },
     {
     "skills": "ibm cloud",
     "avg_salary": "53"
     },
     {
     "skills": "git",
     "avg_salary": "52"
     },
     {
     "skills": "bitbucket",
     "avg_salary": "52"
     },
     {
     "skills": "dynamodb",
     "avg_salary": "51"
     },
     {
     "skills": "databricks",
     "avg_salary": "50"
     },
     {
     "skills": "yarn",
     "avg_salary": "50"
     },
     {
     "skills": "redshift",
     "avg_salary": "49"
     },
     {
     "skills": "microstrategy",
     "avg_salary": "48"
     },
     {
     "skills": "pytorch",
     "avg_salary": "48"
     },
     {
     "skills": "seaborn",
     "avg_salary": "48"
     },
     {
     "skills": "db2",
     "avg_salary": "48"
     },
     {
     "skills": "looker",
     "avg_salary": "47"
     },
     {
     "skills": "github",
     "avg_salary": "47"
     },
     {
     "skills": "hadoop",
     "avg_salary": "47"
     },
     {
     "skills": "php",
     "avg_salary": "47"
     }
     ]
     
     */