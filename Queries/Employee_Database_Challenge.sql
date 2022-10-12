/* 	
	Deliverable 1 - Requirement 1 - (10 pt)
	A query is written and executed to create a Retirement Titles table
	for employees who are born between Jan 1, 1952 and Dec 31, 1955.
*/
SELECT
	em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS em
	INNER JOIN titles AS ti ON em.emp_no = ti.emp_no
WHERE em.birth_date BETWEEN '1952-01-01' AND '1955-12-31';


/* 	
	Deliverable 1 - Requirement 2 - (5 pt)
	The Retirement Titles table is exported as retirement_titles.csv.
*/
-- Completed. Inside the '\Data' directory.


/* 	
	Deliverable 1 - Requirement 3 - (15 pt)
	A query is written and executed to create a Unique Titles table that
	contains the employee number, first and last name, and most recent title.
*/
SELECT 
	DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


/* 	
	Deliverable 1 - Requirement 4 - (5 pt)
	The Unique Titles table is exported as unique_titles.csv.
*/
-- Completed. Inside the '\Data' directory.


/* 	
	Deliverable 1 - Requirement 5 - (10 pt)
	A query is written and executed to create a Retiring Titles table that
	contains the number of titles filled by employees who are retiring.
*/
SELECT
	COUNT(title) AS count,
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


/* 	
	Deliverable 1 - Requirement 6 - (5 pt)
	The Retiring Titles table is exported as retiring_titles.csv.
*/
-- Completed. Inside the '\Data' directory.


/* 	
	Deliverable 2 - Requirement 1 - (25 pt)
	A query is written and executed to create a Mentorship Eligibility table for
	current employees who were born between Jan 1, 1965 and Dec 31, 1965.
*/
SELECT
	DISTINCT ON (em.emp_no) em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees AS em
	INNER JOIN dept_emp AS de ON em.emp_no = de.emp_no AND de.to_date = '9999-01-01'
	INNER JOIN titles AS ti ON em.emp_no = ti.emp_no AND ti.to_date = '9999-01-01'
WHERE em.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY em.emp_no;


/* 	
	Deliverable 2 - Requirement 2 - (5 pt)
	The Mentorship Eligibility table is exported as mentorship_eligibilty.csv.
*/
-- Completed. Inside the '\Data' directory.
