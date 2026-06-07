/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers.
*/


WITH jobs_posting AS(
        SELECT *
        FROM job_postings_fact
        WHERE
            job_title_short = 'Data Analyst'
            AND salary_year_avg IS NOT NULL
            --AND job_work_from_home = 'True'    
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
    COUNT(js.skills) AS skills_count

FROM jobs_posting jp
INNER JOIN job_skills js
ON jp.job_id = js.job_id

GROUP BY
    jp.job_title_short,
    js.skills

ORDER BY
    skills_count DESC
LIMIT 5



/* JSON FILE

[
  {
    "job_title_short": "Data Analyst",
    "skills": "sql",
    "skills_count": "3083"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "excel",
    "skills_count": "2143"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "python",
    "skills_count": "1840"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "tableau",
    "skills_count": "1659"
  },
  {
    "job_title_short": "Data Analyst",
    "skills": "r",
    "skills_count": "1073"
  }
]


*/