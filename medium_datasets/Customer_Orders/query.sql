SELECT
  users.name
FROM (
  SELECT
    t.user_id
  FROM (
    SELECT
      user_id,
      COUNT(*) AS count_per_year
    FROM
      `ringed-bond-261712.medium_questions_dataset.transactions`
    GROUP BY
      EXTRACT(YEAR
      FROM
        created_at),
      user_id
    HAVING
      COUNT(*)>=3) AS t
  GROUP BY
    t.user_id
  HAVING
    COUNT(*)=2) AS t1
INNER JOIN
  `ringed-bond-261712.medium_questions_dataset.users` AS users
ON
  t1.user_id=users.id