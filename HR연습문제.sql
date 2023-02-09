
select * from employees;
select * from departments;
select * from jobs ;
select * from LOCATIONS;

-- 1. �μ��� ������
SELECT d.department_name, count(*)EMP_COUNT
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY EMP_COUNT DESC; 

--2. �μ��� ��� �޿�(salary)
SELECT d.department_name, ROUND(AVG(e.salary)) AVG_SAL
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY AVG_SAL DESC; 

--3. ��å�� ��� �޿� (��ձ޿� ���� ���� 7�� ��å��)  /// ���� n�� �̤� ��.
SELECT * FROM
    (SELECT j.job_title, ROUND(AVG(e.salary)) ��
    FROM (employees e JOIN jobs j ON j.job_id = e.job_id)
    GROUP BY j.job_title
    ORDER BY �� DESC)
WHERE ROWNUM <= 7;
-- 4. �ڽ��� �Ŵ��� ���� �� ���� �޿��� �޴� ��� ��� e.employee_id, e.last_name, e.salary
SELECT e.employee_id, e.last_name, e.salary
FROM employees e JOIN employees m
    ON e.manager_id = m.employee_id
WHERE (e.salary > m.salary);

-- 5. Job title�� Sales Representative�� ���� �߿���, �޿��� 9,000 ~ 10,000 �� �������� �̸��� �޿��� ����Ͻÿ�.
SELECT FIRST_NAME||' '||LAST_NAME, salary
FROM(SELECT *
    FROM employees e JOIN jobs j
    ON e.job_id= j.job_id
    WHERE j.job_title = 'Sales Representative')
WHERE salary BETWEEN 9000 AND 10000
ORDER BY salary DESC;

-- 6. �޿� ������ ���� ���� ���޼����� �޿� ������ ����Ͻÿ�. (��, �޿������� 30,000 �̻��� ���޸� ����� ��)
SELECT * FROM(SELECT j.job_title �̸� , SUM(salary)��
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title 
ORDER BY �� DESC ) WHERE �� >=30000;
 
 
-- 7. �� ���ú� ��� ����(�޿�)�� ���������� ���� 3�� ���ø� ����Ͻÿ�. ��������.
-- where�� ����ؼ� ���� ��Ŵ.
SELECT * FROM (
    SELECT city, ROUND(AVG(salary))
    FROM employees e, departments d, locations l
    where e.department_id=d.department_id
    AND d.location_id=l.location_id
    GROUP BY city
    ORDER BY AVG(salary) DESC)
WHERE ROWNUM <= 3;


-- 8)��å(Job Title)�� 'Sales Manager'�� ������� �Ի�⵵(hire_date)�� ��� �޿��� ����Ͻÿ�. 
--��� �� �⵵�� �������� �������� �����Ͻÿ�.
SELECT hire_date ��¥, ROUND(AVG(salary)) ��ձݾ� FROM (Select salary, TO_CHAR(hire_date,'YYYY') hire_date, job_id  FROM employees )e 
JOIN (SELECT * FROM jobs WHERE job_title ='Sales Manager')j ON e.job_id = j.job_id
GROUP BY hire_date
ORDER BY hire_date;


--9)�� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�. 
--��ձ޿��� ���� ���� ���ú��� ���ø�(city)�� ��տ���, �ش� ������ �������� ����Ͻÿ�. 
--��, ���ÿ� �ٹ��ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�.
select * from locations l, departments d, employees e
        where e.department_id=d.department_id
        AND d.location_id=l.location_id

;




