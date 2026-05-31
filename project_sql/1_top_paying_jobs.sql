/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment opportunities
*/

SELECT
    jp.job_id,
    cd.name AS company_name,
    jp.job_title,
    jp.job_title_short,
    jp.job_location,
    jp.job_schedule_type,
    jp.salary_year_avg,
    jp.job_posted_date
FROM job_postings_fact jp 
LEFT JOIN company_dim cd
ON jp.company_id = cd.company_id
WHERE 
    job_title_short = 'Data Analyst'
    AND job_location = 'Germany'
    AND salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC
LIMIT 10
 