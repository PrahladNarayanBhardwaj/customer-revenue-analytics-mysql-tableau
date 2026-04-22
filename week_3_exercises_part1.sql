#PART 1
USE ap;

SELECT * FROM invoices;




SELECT invoice_number,invoice_date,invoice_total 

FROM invoices;







SELECT invoice_number, invoice_date, invoice_total

FROM invoices

WHERE invoice_date BETWEEN '2018-04-01' AND '2018-04-30';






SELECT invoice_number, invoice_date, invoice_total

FROM invoices

WHERE invoice_total < 100;






SELECT invoice_number, invoice_date, invoice_total

FROM invoices

WHERE invoice_total < 100

ORDER BY invoice_total;







SELECT invoice_number, invoice_date, invoice_total

FROM invoices

WHERE invoice_total < 100

ORDER BY invoice_total DESC;




SELECT invoice_number, invoice_date, invoice_total

FROM invoices

WHERE invoice_total < 100

ORDER BY invoice_total, invoice_date DESC, invoice_number;


SELECT invoice_id, invoice_number, invoice_total

FROM invoices

ORDER BY invoice_total DESC LIMIT 5;








SELECT invoice_id, invoice_number, invoice_total

FROM invoices

ORDER BY invoice_id  LIMIT 10 OFFSET 5;

#exercises slide 9 
USE university;

SELECT * FROM courses;

-- List of courses with more than 3 credit hours
SELECT * FROM courses

 WHERE creditHours>3;
 
 
 SELECT * FROM professors;
 
 
 -- List of faculty in BIO department, sorted by last name
 SELECT * FROM professors
 WHERE department = "BIO"
 ORDER BY facultyLastName;
 
 
 SELECT * FROM courses;
 -- List of courses in NURS sequence (courseID begins with NURS)

SELECT * FROM courses
WHERE courseID REGEXP "NURS";


#PART 2



USE ap;

SELECT invoice_number, vendor_name, invoice_due_date, 
invoice_total, payment_total, credit_total
FROM vendors JOIN invoices ON
vendors.vendor_id = invoices.vendor_id
ORDER BY invoice_due_date DESC;  



SELECT vendor_id, vendor_name, default_terms_id, terms_id, terms_description
FROM vendors JOIN terms ON
vendors.default_terms_id = terms.terms_id;  



SELECT invoice_number, vendor_name, invoice_due_date, 
invoice_total, payment_total, credit_total
FROM vendors NATURAL JOIN invoices 
ORDER BY invoice_due_date DESC; 









SELECT invoice_number, vendor_name, invoice_due_date, 
invoice_total, payment_total, credit_total
FROM vendors v JOIN invoices i ON
v.vendor_id = i.vendor_id
ORDER BY invoice_due_date DESC;



USE university;


SELECT facultyLastName, c.courseID, courseTitle, sectionNumber
FROM courses  c JOIN sections s  ON  c.courseID = s.courseID
JOIN professors p ON s.facultyID = p.facultyID
ORDER BY facultyLastName;










SELECT c.courseID, c.courseTitle, c.creditHours, c.prereqCourse, pre.courseTitle
FROM courses  c JOIN courses pre  ON  c.prereqCourse = pre.courseID
WHERE c.prereqCourse != ""
;

SELECT * FROM courses;




SELECT department_name, d.department_number, last_name
FROM departments d
	LEFT JOIN employees e 
		ON d.department_number = e.department_number
ORDER BY department_name;

SELECT department_name, d.department_number, last_name
FROM departments d
	RIGHT JOIN employees e 
		ON d.department_number = e.department_number
ORDER BY department_name;

SELECT department_name, d.department_number, last_name
FROM departments d
	LEFT JOIN employees e 
		ON d.department_number = e.department_number
WHERE e.department_number is NULL        
ORDER BY department_name;

SELECT department_name, d.department_number, last_name
FROM departments d
	RIGHT JOIN employees e 
		ON d.department_number = e.department_number
WHERE d.department_number is NULL        
ORDER BY department_name;


USE ex;

SELECT "Active" as source, invoice_number,invoice_date, invoice_total
FROM active_invoices 
WHERE invoice_date>="2018-06-01"
UNION
SELECT "Paid" as source, invoice_number,invoice_date, invoice_total
FROM paid_invoices
WHERE invoice_date>="2018-06-01"
ORDER BY invoice_total DESC;

-- exercises week2 slides part 2 slide 19
USE music;

SELECT * FROM songs;

SELECT * FROM weeks;

-- List of appearances by Madonna on Top 100 by song by week

SELECT * FROM songs s JOIN weeks w

ON s.songID = w.songID

WHERE artist = "Madonna";


-- Billboard Top 100 for week of July 8, 2000

SELECT * FROM songs s JOIN weeks w

ON s.songID = w.songID

WHERE date = "2000-07-08"
ORDER BY top100rank;