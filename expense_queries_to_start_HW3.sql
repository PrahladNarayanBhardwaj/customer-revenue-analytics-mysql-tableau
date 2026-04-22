USE expense;

SELECT * FROM account_codes;

SELECT * FROM dept_codes;

SELECT * FROM trips;

SELECT *, STR_TO_DATE(start_date,"%m/%d/%Y") AS fixed_date FROM trips;

SELECT * FROM reason_codes;

SELECT * FROM employees;

SELECT * FROM expenses;

SELECT * FROM reimbursements;

SELECT * FROM expenses;

SELECT employee, SUM(gross_amount) as expense_by_employee

FROM expenses

GROUP BY employee

ORDER BY expense_by_employee DESC;


SELECT e.ssn,first_name, last_name, sum(gross_amount) as total_expense,
e.dept 
FROM employees e JOIN trips t 

ON e.ssn = t.employee JOIN expenses ex ON t.employee = ex.employee

AND t.trip_id = ex.trip_id

GROUP BY e.ssn

ORDER BY total_expense DESC;





USE expense;

SELECT * FROM trips t, reason_codes rc

WHERE t.reason_code = rc.reason_code; 





#combine expenses by employee with the number of trips by employee

SELECT e.ssn,e.first_name, e.last_name, sum(gross_amount) as total_expense 
FROM employees e JOIN trips t 

ON e.ssn = t.employee JOIN expenses ex ON t.employee = ex.employee

AND t.trip_id = ex.trip_id

GROUP BY e.ssn, e.first_name, e.last_name

ORDER BY total_expense DESC;


SELECT e.ssn,first_name, last_name, sum(gross_amount) as total_expense, 

COUNT(DISTINCT t.trip_id) AS number_of_trips
 
FROM employees e JOIN trips t 

ON e.ssn = t.employee JOIN expenses ex ON t.employee = ex.employee

AND t.trip_id = ex.trip_id

GROUP BY e.ssn, first_name, last_name

ORDER BY total_expense DESC;

#find the same as above but without count of trips and with Joins like in DW safety kpi example

SELECT e.ssn,first_name, last_name, total_expense 
FROM employees e JOIN 
	(SELECT employee,sum(gross_amount) as total_expense
    FROM expenses
    GROUP BY employee) as expenses_total
    ON e.ssn = expenses_total.employee
    ORDER BY total_expense  DESC;
    
    
    
    
         
 
    
    
    
  




