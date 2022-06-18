SELECT
  *
FROM (
  SELECT
    id,
    bank_transactions,
    created_at,
    ROW_NUMBER() OVER(PARTITION BY created_at ORDER BY id DESC) AS target_row
  FROM
    `ringed-bond-261712.medium_questions_dataset.bank_transactions`)
WHERE
  target_row=1