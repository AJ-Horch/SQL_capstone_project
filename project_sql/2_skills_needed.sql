-- query from top_paying_jobs.sql
-- No longer concerned with job_schedule_type or job_posted_date
-- Using a CTE
WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location LIKE '%United Kingdom%'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
) -- only care about jobs with skills. will use inner join
SELECT top_paying_jobs.* skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
    /*
     json results:
     [
     {
     "job_id": 1401033,
     "job_title": "Market Data Lead Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "180000.0",
     "company_name": "Deutsche Bank"
     },
     {
     "job_id": 1813715,
     "job_title": "Data Architect - Trading and Supply",
     "job_location": "United Kingdom",
     "salary_year_avg": "156500.0",
     "company_name": "Shell"
     },
     {
     "job_id": 1813715,
     "job_title": "Data Architect - Trading and Supply",
     "job_location": "United Kingdom",
     "salary_year_avg": "156500.0",
     "company_name": "Shell"
     },
     {
     "job_id": 1813715,
     "job_title": "Data Architect - Trading and Supply",
     "job_location": "United Kingdom",
     "salary_year_avg": "156500.0",
     "company_name": "Shell"
     },
     {
     "job_id": 1813715,
     "job_title": "Data Architect - Trading and Supply",
     "job_location": "United Kingdom",
     "salary_year_avg": "156500.0",
     "company_name": "Shell"
     },
     {
     "job_id": 694461,
     "job_title": "Sr Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "118140.0",
     "company_name": "Hasbro"
     },
     {
     "job_id": 694461,
     "job_title": "Sr Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "118140.0",
     "company_name": "Hasbro"
     },
     {
     "job_id": 694461,
     "job_title": "Sr Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "118140.0",
     "company_name": "Hasbro"
     },
     {
     "job_id": 694461,
     "job_title": "Sr Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "118140.0",
     "company_name": "Hasbro"
     },
     {
     "job_id": 694461,
     "job_title": "Sr Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "118140.0",
     "company_name": "Hasbro"
     },
     {
     "job_id": 694461,
     "job_title": "Sr Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "118140.0",
     "company_name": "Hasbro"
     },
     {
     "job_id": 377642,
     "job_title": "Fraud Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "109000.0",
     "company_name": "esure Group"
     },
     {
     "job_id": 377642,
     "job_title": "Fraud Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "109000.0",
     "company_name": "esure Group"
     },
     {
     "job_id": 377642,
     "job_title": "Fraud Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "109000.0",
     "company_name": "esure Group"
     },
     {
     "job_id": 377642,
     "job_title": "Fraud Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "109000.0",
     "company_name": "esure Group"
     },
     {
     "job_id": 377642,
     "job_title": "Fraud Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "109000.0",
     "company_name": "esure Group"
     },
     {
     "job_id": 377642,
     "job_title": "Fraud Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "109000.0",
     "company_name": "esure Group"
     },
     {
     "job_id": 1315562,
     "job_title": "Project Data Analyst - Operational Excellence",
     "job_location": "United Kingdom",
     "salary_year_avg": "105000.0",
     "company_name": "Syngenta Group"
     },
     {
     "job_id": 150907,
     "job_title": "Senior Scientist, Computational Biology",
     "job_location": "United Kingdom",
     "salary_year_avg": "89100.0",
     "company_name": "Flagship Pioneering, Inc."
     },
     {
     "job_id": 150907,
     "job_title": "Senior Scientist, Computational Biology",
     "job_location": "United Kingdom",
     "salary_year_avg": "89100.0",
     "company_name": "Flagship Pioneering, Inc."
     },
     {
     "job_id": 150907,
     "job_title": "Senior Scientist, Computational Biology",
     "job_location": "United Kingdom",
     "salary_year_avg": "89100.0",
     "company_name": "Flagship Pioneering, Inc."
     },
     {
     "job_id": 150907,
     "job_title": "Senior Scientist, Computational Biology",
     "job_location": "United Kingdom",
     "salary_year_avg": "89100.0",
     "company_name": "Flagship Pioneering, Inc."
     },
     {
     "job_id": 150907,
     "job_title": "Senior Scientist, Computational Biology",
     "job_location": "United Kingdom",
     "salary_year_avg": "89100.0",
     "company_name": "Flagship Pioneering, Inc."
     },
     {
     "job_id": 985232,
     "job_title": "Global IT Data Analytics Solutions Expert",
     "job_location": "United Kingdom",
     "salary_year_avg": "86400.0",
     "company_name": "Campari Group"
     },
     {
     "job_id": 985232,
     "job_title": "Global IT Data Analytics Solutions Expert",
     "job_location": "United Kingdom",
     "salary_year_avg": "86400.0",
     "company_name": "Campari Group"
     },
     {
     "job_id": 985232,
     "job_title": "Global IT Data Analytics Solutions Expert",
     "job_location": "United Kingdom",
     "salary_year_avg": "86400.0",
     "company_name": "Campari Group"
     },
     {
     "job_id": 985232,
     "job_title": "Global IT Data Analytics Solutions Expert",
     "job_location": "United Kingdom",
     "salary_year_avg": "86400.0",
     "company_name": "Campari Group"
     },
     {
     "job_id": 985232,
     "job_title": "Global IT Data Analytics Solutions Expert",
     "job_location": "United Kingdom",
     "salary_year_avg": "86400.0",
     "company_name": "Campari Group"
     },
     {
     "job_id": 227038,
     "job_title": "Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "77017.5",
     "company_name": "Nominet"
     },
     {
     "job_id": 227038,
     "job_title": "Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "77017.5",
     "company_name": "Nominet"
     },
     {
     "job_id": 227038,
     "job_title": "Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "77017.5",
     "company_name": "Nominet"
     },
     {
     "job_id": 1059513,
     "job_title": "Data Analyst - Customer Services",
     "job_location": "United Kingdom",
     "salary_year_avg": "75550.0",
     "company_name": "Informa Group Plc."
     },
     {
     "job_id": 1059513,
     "job_title": "Data Analyst - Customer Services",
     "job_location": "United Kingdom",
     "salary_year_avg": "75550.0",
     "company_name": "Informa Group Plc."
     },
     {
     "job_id": 1059513,
     "job_title": "Data Analyst - Customer Services",
     "job_location": "United Kingdom",
     "salary_year_avg": "75550.0",
     "company_name": "Informa Group Plc."
     },
     {
     "job_id": 1059513,
     "job_title": "Data Analyst - Customer Services",
     "job_location": "United Kingdom",
     "salary_year_avg": "75550.0",
     "company_name": "Informa Group Plc."
     },
     {
     "job_id": 1059513,
     "job_title": "Data Analyst - Customer Services",
     "job_location": "United Kingdom",
     "salary_year_avg": "75550.0",
     "company_name": "Informa Group Plc."
     },
     {
     "job_id": 453109,
     "job_title": "Global Mobility Data Analyst",
     "job_location": "United Kingdom",
     "salary_year_avg": "75067.5",
     "company_name": "CHANEL"
     }
     ]
     
     */