
WITH q_1 AS (
                SELECT * 
                FROM (  SELECT *
                        FROM january_jobs
                        UNION --ALL
                        SELECT *
                        FROM february_jobs
                        UNION --ALL
                        SELECT *
                        FROM march_jobs
                    )
                WHERE 
                    salary_year_avg > 70000
                    AND 
                    job_title_short = 'Data Analyst'
                    ORDER BY salary_year_avg DESC
            )
SELECT 
    a.job_id,
    a.job_title_short,
    c.skills,
    c.type AS skill_type,
    a.salary_year_avg  AS salary
FROM q_1 AS a
LEFT JOIN skills_job_dim AS b ON a.job_id = b.job_id
LEFT JOIN skills_dim AS c ON b.skill_id = c.skill_id



SELECT *
FROM january_jobs





WITH jan_jobs AS(
                    SELECT
                        a.job_id,
                        a.job_title_short,
                        c.skills,
                        c.type AS skill_type
                    FROM january_jobs AS a
                    LEFT JOIN skills_job_dim AS b ON a.job_id = b.job_id
                    LEFT JOIN skills_dim AS c ON b.skill_id = c.skill_id
                ),
  feb_jobs AS(
                    SELECT
                        a.job_id,
                        a.job_title_short,
                        c.skills,
                        c.type AS skill_type
                    FROM february_jobs AS a
                    LEFT JOIN skills_job_dim AS b ON a.job_id = b.job_id
                    LEFT JOIN skills_dim AS c ON b.skill_id = c.skill_id
                ),  
  mar_jobs AS(
                    SELECT
                        a.job_id,
                        a.job_title_short,
                        c.skills,
                        c.type AS skill_type
                    FROM march_jobs AS a
                    LEFT JOIN skills_job_dim AS b ON a.job_id = b.job_id
                    LEFT JOIN skills_dim AS c ON b.skill_id = c.skill_id
                )

SELECT *
FROM jan_jobs
UNION --ALL
SELECT *
FROM feb_jobs
UNION --ALL
SELECT *
FROM mar_jobs










WITH remote_jobs AS (
                        SELECT 
                            b.skill_id,
                            COUNT(a.job_id) AS job_offers
                        FROM job_postings_fact AS a
                        LEFT JOIN skills_job_dim AS b 
                        ON a.job_id = b.job_id
                        WHERE
                            a.job_work_from_home = True
                        GROUP BY
                        b.skill_id
                    )
SELECT
    c.skills,
    d.job_offers
FROM remote_jobs AS d
        LEFT JOIN skills_dim AS c 
        ON d.skill_id = c.skill_id
ORDER BY
    job_offers DESC
LIMIT 10



SELECT
FROM (
        SELECT
            c.skills,
            COUNT(a.job_id) AS job_offers
        FROM job_postings_fact AS a
        LEFT JOIN skills_job_dim AS b 
        ON a.job_id = b.job_id
        LEFT JOIN skills_dim AS c 
        ON b.skill_id = c.skill_id

        WHERE
            a.job_work_from_home = 'True'
        GROUP BY
        c.skills
        ORDER BY
            job_offers DESC
        LIMIT 10
)


/*
SELECT 
    job_title_short,
   -- salary_year_avg,
   COUNT(*),
    CASE
        WHEN salary_year_avg >= 120000 THEN 'high'
        WHEN salary_year_avg BETWEEN 70000 AND 120000 THEN 'medium'
    ELSE 'low'
    END AS salary_category
FROM job_postings_fact
WHERE 
    job_title_short LIKE '%Data Analyst%'
GROUP BY
    salary_category,
    job_title_short
    --salary_year_avg
ORDER BY 
    job_title_short DESC



CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1

-- February
CREATE TABLE february_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

-- April
CREATE TABLE april_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

-- May
CREATE TABLE may_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

-- June
CREATE TABLE june_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

-- July
CREATE TABLE july_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

-- August
CREATE TABLE august_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

-- September
CREATE TABLE september_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

-- October
CREATE TABLE october_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

-- November
CREATE TABLE november_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

-- December
CREATE TABLE december_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 12;

*/