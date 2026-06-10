/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
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
        SELECT 
        sd.skill_id,
        sd.skills,
        sjd.job_id

        FROM skills_job_dim sjd 
        INNER JOIN skills_dim sd
            ON sd.skill_id = sjd.skill_id
)

SELECT
--    js.skill_id,
    js.skills,
    COUNT(js.skills) AS skills_count,
    ROUND(AVG(jp.salary_year_avg), 0) AS average_salary
FROM jobs_posting jp
INNER JOIN job_skills js
ON jp.job_id = js.job_id
GROUP BY
--    js.skill_id,
    js.skills
ORDER BY
    skills_count DESC,
    average_salary DESC
LIMIT 10


