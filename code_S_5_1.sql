select d.DeptName, d.DeptID, count(e.*) as "EmployeeCount", Avg(e.Salary) as "AvgSal", 
case 
	WHEN AVG(e.Salary) >= 60000 THEN 'High Avg'
        WHEN AVG(e.Salary) BETWEEN 50000 AND 59999 THEN 'Medium Avg'
        ELSE 'Low Avg'
    END AS AvgCategory
from Employees as e
right join Departments as d on d.DeptID = e.DeptID
group by d.DeptID
order by "EmployeeCount" desc;
