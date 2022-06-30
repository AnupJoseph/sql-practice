SELECT
  CONCAT(first_name," ",last_name) AS full_name,
  name AS department_name,
  salary
FROM (
  SELECT
    *
  FROM (
    WITH
      cte AS (
      SELECT
        first_name,
        last_name,
        department_id,
        salary,
        ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC ) AS rn
      FROM
        `ringed-bond-261712.medium_questions_dataset.employees` )
    SELECT
      first_name,
      last_name,
      department_id,
      rn,
      salary
    FROM
      cte
    WHERE
      rn <=3) AS target_employees
  INNER JOIN
    `ringed-bond-261712.medium_questions_dataset.departments` AS d
  ON
    target_employees.department_id = d.id)