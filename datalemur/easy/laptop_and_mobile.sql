SELECT SUM(
        CASE
            device_type
            WHEN 'laptop' THEN 1
            ELSE 0
        END
    ) AS laptop_views,
    SUM(
        CASE
            device_type
            WHEN 'phone' THEN 1
            WHEN 'tablet' THEN 1
            ELSE 0
        END
    ) AS mobile_views
FROM viewership