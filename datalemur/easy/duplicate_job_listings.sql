SELECT COUNT(counts)
FROM (
        SELECT COUNT(DISTINCT company_id) as counts
        FROM job_listings
        GROUP BY company_id,
            title,
            description
        HAVING COUNT(*) > 1
    ) AS outtable