update later
# Introduction
Exploring the data job market! Focusing on data analyst and scientist roles, this project explores top-paying jobs, in-demand skills and wehere high demand meets high salary in data analytics. 

See queries here: [project_sql_folder](/project_sql/)

# Background
I'm currently looking for my first job in data after graduating. SQL is a necessary skill for almost any data role, but especially data analyst roles. Therefore, in order to learn SQL and gain insights into the job market I completed this project.

The data was collected and provided by [Luke Barousse](https://www.youtube.com/watch?v=7mz73uXD9DA&t=12697s).

The questions I wanted to answer through my queries

### These are the questions I answered 
1. What are the top-paying data analyst jobs?
2. Where are jobs being posted in the UK
3. What skills are required for these top-paying jobs?
4. What skills are most indemand for data analysts?
5. Which skills are associated with higher salaries?
6. What are the most optimal skills to learn
# Tools used
PostgreSQL, SQL, Visual Studio Code, Python, Git & Github

# The analysis
Each query for this projet aim at investigating specific aspects of the data analyst and data scientist job market. 


### Top paying jobs
I identified the highest-paying roles in the UK by filtering for the average yearly salary, location focusing on titles I might be interested in applying for. This query hihglights the high paying opportunties in the field(s)
```
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
WHERE (job_title_short = 'Data Analyst'OR job_title_short = 'Data Scientist' OR job_title_short = 'Data Engineer')
    AND job_location LIKE '%United Kingdom%'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
```
Here's a further breakdown of the results.
![Highest Paying Roles](assets\highest_paid_jobs.png)

![Dist of Salary](assets\dist_of_salary.png)

- The highest paying roles tend to belong to Senior Data Scientists
- The majority of roles offer salaries below 80,000 pounds



### Where are the job postings
I also wanted to understand where the majority of jobs are being posted. Using the same query above I use python to analyze what sites are being used the more
![Job postings](assets\websites_to_use.png)

### What skills are indemand for data analysts vs data scientists?
The query below allowed me to identify what the necessary skills are for data analysts in the UK. I also used this query to find data analyst positions. I specified a salary range that I would attractive. 
```
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_location LIKE '%United Kingdom%'
    AND salary_year_avg > 40000
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 15
```

| skills      | demand_count |
|-------------|--------------|
| excel       | 9            |
| python      | 8            |
| sql         | 6            |
| tableau     | 3            |
| word        | 2            |
| express     | 2            |
| go          | 2            |
| jupyter     | 2            |
| outlook     | 2            |
| power bi    | 2            |
| r           | 2            |
| sas         | 2            |
| notion      | 1            |
| typescript  | 1            |
| unify       | 1            |

For Data Scientests the skills defer:
| skills      | demand_count |
|-------------|--------------|
| python      | 723          |
| sql         | 458          |
| r           | 308          |
| aws         | 176          |
| azure       | 147          |
| tableau     | 116          |
| spark       | 95           |
| sas         | 94           |
| power bi    | 93           |
| tensorflow  | 92           |
| pandas      | 85           |
| pytorch     | 85           |
| gcp         | 84           |
| git         | 78           |
| excel       | 76           |
- Python and SQL are two very in demand skills
- Data Science roles seem to demand more skills based on engineering, as evident with requirements like azure, aws, and spark. ML ops also seems to be a requirement (tensorflow & pytorch)

### What skills should be learned for higher salaries
I used the following query to review what skills are assoicated with higher salaries:

```
SELECT skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%United Kingdom%'
    -- AND job_work_from_home = True
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

For data analyst roles excel skills were assoicated with higher salaries. For data scientists roles python and sql were in high demand, but tableau skills were associated with higher salaries. Data visualization seems to be just as important as querying and analyzing. 

| skill_id | skills  | demand_count | avg_salary |
|----------|---------|--------------|------------|
| 182      | tableau | 12           | 122875     |
| 5        | r       | 11           | 118246     |
| 1        | python  | 33           | 113902     |
| 0        | sql     | 28           | 111522     |
| 76       | aws     | 11           | 109164     |


# What I learned
This is the first SQL project I've completed. Here are some of my takeaways:
- In order to use SQL effectively merging tables, using GROUP BY, COUNT() and WITH clauses is essential. 
- Effective queries lead to streamlined analysis in Python. 

# Conclusions
- Top paying jobs require multi skills and excel will always have a place in the data industry
- Data engineering tools like AWS, Spark and Azure can seperate a candinate and are necessary for Data Scientist roles. 
- Job postings will not always be on popular sites liked LinkedIn. To find the right roles for me it's necessary to use data specific sites. 
 