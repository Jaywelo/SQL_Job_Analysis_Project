INSERT INTO job_applied(
        job_id,
        application_sent_date,
        custom_resume,
        resume_file_name,        
        cover_letter_sent,
        cover_letter_file_name,
        status)

VALUES (
        1,
        '2026-01-01',
        true,
        'resume_01.pdf',
        true,
        'cover_letter_01.pdf',
        'submitted'
       ),
       (
        2,
        '2026-01-05',
        true,
        'resume_02.pdf',
        true,
        'cover_letter_02.pdf',
        'submitted'
       ),
       (
        3,
        '2026-01-12',
        true,
        'resume_03.pdf',
        false,
        null,
        'under_review'
       ),
       (
        4,
        '2026-01-18',
        true,
        'resume_04.pdf',
        true,
        'cover_letter_04.pdf',
        'interview_scheduled'
       ),
       (
        5,
        '2026-01-25',
        true,
        'resume_05.pdf',
        true,
        'cover_letter_05.pdf',
        'accepted'
       )  

ALTER TABLE job_applied
ADD contact VARCHAR (50)

UPDATE job_applied
SET 
    contact = '0245239502'
WHERE
job_id = 5

SELECT *
FROM job_applied    