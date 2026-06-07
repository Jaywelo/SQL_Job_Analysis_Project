/*
Questions to Answer

What are the top-paying jobs for my role?
What are the skills required for these top-paying roles?
What are the most in-demand skills for my role?
What are the top skills based on salary for my role?
What are the most optimal skills to learn?
a. Optimal: High Demand AND High Paying
*/

SELECT
--    jp.job_id,
--    cd.name AS company_name,
--    jp.job_title,
    jp.job_title_short,
    sd.skills,
    COUNT(sd.skills) AS skills_count,
--        sd.type
    jp.job_location
--    jp.job_schedule_type,
--    jp.salary_year_avg,
--    jp.job_posted_date
FROM job_postings_fact jp 
LEFT JOIN company_dim cd
ON jp.company_id = cd.company_id
LEFT JOIN skills_job_dim sjd 
ON sjd.job_id = jp.job_id
LEFT JOIN skills_dim sd
    ON sd.skill_id = sjd.skill_id

GROUP BY
--    jp.job_id,
--    cd.name,
--    jp.job_title,
    jp.job_title_short,
    sd.skills,
    jp.job_location
--    jp.job_schedule_type,
--    jp.salary_year_avg,
--    jp.job_posted_date

HAVING 
    jp.job_title_short = 'Data Analyst'
    AND jp.job_location = 'Germany'
    --AND salary_year_avg IS NOT NULL

ORDER BY
    skills_count DESC
LIMIT 10
 