
/*
Answer: What are the top skills based on salary?

- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve

*/


WITH jobs_posting AS(
        SELECT *
        FROM job_postings_fact
        WHERE
            job_title_short = 'Data Analyst'
            AND salary_year_avg IS NOT NULL
            AND job_work_from_home = 'True'    
),

job_skills AS (
        SELECT *

        FROM skills_job_dim sjd 
        LEFT JOIN skills_dim sd
            ON sd.skill_id = sjd.skill_id
)


SELECT
    jp.job_title_short,
    js.skills,
--    COUNT(js.skills) AS skills_count,
--    jp.job_location,
--    jp.job_schedule_type,
    ROUND(AVG(jp.salary_year_avg), 0) AS average_salary
--    jp.job_posted_date
FROM jobs_posting jp
INNER JOIN job_skills js
ON jp.job_id = js.job_id
GROUP BY
    jp.job_title_short,
    js.skills
--    jp.job_location,
--    jp.job_schedule_type,
--    jp.salary_year_avg
ORDER BY
--    skills_count DESC,
    average_salary DESC
LIMIT 10




/* JSON FILE

[
  {
    "job_title_short": "Data Analyst",
    "skills": "pyspark",
    "average_salary": "208172"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "bitbucket",
    "average_salary": "189155"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "watson",
    "average_salary": "160515"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "gitlab",
    "average_salary": "154500"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "swift",
    "average_salary": "153750"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "jupyter",
    "average_salary": "152777"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "pandas",
    "average_salary": "151821"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "elasticsearch",
    "average_salary": "145000"
  }
]

*/