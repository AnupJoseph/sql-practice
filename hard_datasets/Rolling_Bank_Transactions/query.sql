WITH
  day_select AS (
  SELECT
    DATE_TRUNC(created_at, DAY) AS day,
    SUM(bank_transactions) AS total_transaction
  FROM
    `ringed-bond-261712.medium_questions_dataset.bank_transactions`
  GROUP BY
    day
  ORDER BY
    day)
SELECT
  day,
  AVG(total_transaction) OVER(ORDER BY day ROWS 2 PRECEDING ) AS rolling_average
FROM
  day_select