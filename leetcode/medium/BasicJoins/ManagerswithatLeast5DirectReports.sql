WITH bigman AS (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
)
SELECT e.name
FROM bigman AS b
    INNER JOIN Employee AS e ON b.managerId = e.id