SELECT emp.department_id,
    MAX(emp.salary)
FROM `ringed-bond-261712.easy_question_datasets.departments` AS dept
    RIGHT JOIN `ringed-bond-261712.easy_question_datasets.employees` AS emp ON dept.id = emp.id
WHERE dept.department = "Major Pharmaceuticals"
GROUP BY emp.department_id,
    emp.salary
ORDER BY emp.salary DESC
LIMIT 1 OFFSET 1