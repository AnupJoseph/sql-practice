SELECT acc.paying_customer,
    dow.download_date,
    ROUND(AVG(dow.downloads), 2) AS average_downloads
FROM accounts AS acc
    INNER JOIN downloads AS dow ON acc.accounts_id = dow.accounts_id
GROUP BY dow.download_date,
    acc.paying_customer