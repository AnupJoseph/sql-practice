SELECT
  e.first_name,
  e.last_name,
  d.name,
  e.salary
FROM (
  SELECT
    department_id,
    first_name,
    last_name,
    salary
  FROM
    `ringed-bond-261712.medium_questions_dataset.employees`
  GROUP BY
    department_id,
    first_name,
    last_name,
    salary
  ORDER BY
    salary DESC
  ) AS e
INNER JOIN
  `ringed-bond-261712.medium_questions_dataset.departments` AS d
ON
  e.department_id = d.id