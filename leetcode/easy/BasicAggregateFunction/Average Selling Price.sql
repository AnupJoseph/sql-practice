SELECT pr.product_id,
    IFNULL(ROUND(SUM(price * units) / SUM(units), 2), 0) AS average_price
FROM Prices AS pr
    LEFT JOIN UnitsSold AS un ON (
        pr.product_id = un.product_id
        AND un.purchase_date >= pr.start_date
        AND un.purchase_date <= pr.end_date
    )
GROUP BY pr.product_id