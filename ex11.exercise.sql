/* ex11 */
SELECT YEAR(from_date) as 시작년도, YEAR(to_date) as 종료년도 FROM dept_emp ORDER BY emp_no limit 3;