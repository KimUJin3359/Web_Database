SELECT E.emp_no, E.dept_no, D.dept_name
FROM dept_emp as E, departments as D
WHERE E.dept_no = D.dept_no
ORDER BY E.emp_no;

# 01
SELECT E.emp_no, E.first_name, D.dept_no
FROM employees as E, dept_emp as D
WHERE E.emp_no = D.emp_no;

# 02
SELECT E.emp_no, E.first_name, S.salary
FROM employees as E, salaries as S
WHERE E.emp_no = S.emp_no;

#03
SELECT E.emp_no, E.first_name, D.dept_name
FROM employees as E, dept_emp as DE, departments as D
WHERE E.emp_no = DE.emp_no and D.dept_no = DE.dept_no;