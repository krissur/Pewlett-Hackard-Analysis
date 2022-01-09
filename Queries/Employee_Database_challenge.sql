--Deliverable #1--
--retirement_titles.csv--
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
Into retirement_titles
From employees as e
	inner join titles as t
		on (e.emp_no = t.emp_no)
where (birth_date BETWEEN '1952-01-01' and '1955-12-31')
Order by e.emp_no

--Distinct ON--
--Unique Titles.csv--
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date  DESC;

--Count--
--retiting_titles.csv
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT (ut.emp_no) DESC;



--DELIVERABLE #2--
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
       de.to_date,
  	   t.title
INTO mentorship_eligibility	   
FROM employees as e
    INNER JOIN dept_emp as de
    ON (e.emp_no = de.emp_no)	   
	INNER JOIN titles as t
    ON (e.emp_no = t.emp_no)  
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   