SELECT
  query,
  ROUND(AVG(1/postion*rating),2)
FROM
  `ringed-bond-261712.easy_question_datasets.search_results`
GROUP BY
  query