SELECT 
    job_schedule_type,
    AVG(salary_year_avg) AS average_year_salary,
    AVG(salary_hour_avg) AS average_hour_salary
    --job_posted_date :: DATE 
FROM job_postings_fact

WHERE 
    job_posted_date > '2023-06-01'

GROUP BY 
    job_schedule_type

HAVING 
    AVG(salary_year_avg) IS NOT NULL
 --   OR AVG(salary_hour_avg) IS NOT NULL
ORDER BY average_year_salary DESC
--LIMIT 5

SELECT 
    salary_year_avg,
    salary_hour_avg,
    job_schedule_type,
    job_posted_date
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
LIMIT 20;