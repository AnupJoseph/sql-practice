SELECT
  name,
  num_emps,
  greaterthan10k/num_emps*100 AS percentage_over_100K
FROM (
  SELECT
    *
  FROM (
    SELECT
      name,
      id,
      num_emps
    FROM (
      SELECT
        dept.name,
        COUNT(emp.department_id) AS num_emps,
        dept.id
      FROM
        `ringed-bond-261712.easy_question_datasets.employees` AS emp
      INNER JOIN
        `ringed-bond-261712.easy_question_datasets.departments` AS dept
      ON
        emp.department_id=dept.id
      GROUP BY
        dept.name,
        dept.id) a
    WHERE
      num_emps>10 ) AS a
  INNER JOIN (
    SELECT
      department_id,
      COUNT(*) AS greaterthan10k
    FROM
      `ringed-bond-261712.easy_question_datasets.employees`
    WHERE
      salary>10000
    GROUP BY
      department_id) b
  ON
    a.id=b.department_id)