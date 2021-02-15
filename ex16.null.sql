/* ex16 */
UPDATE dept_emp SET to_date = NULL WHERE dept_no LIKE '%5';
SELECT emp_no, dept_no, from_date, ifnull(to_date, "비공개") FROM employees.dept_emp;