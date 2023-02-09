-- ��������

-- Popp�������� ������� �ֱ�(����)�� ����� ���
-- ������ : ������ ���������� ����Ҷ��� ����� ���ϴ� �����Ϳ� ���� �ϳ��� ��µǾ����
SELECT last_name �̸�, hire_date �������
FROM employees
WHERE hire_date > (SELECT email FROM employees WHERE last_name = 'Popp');

-- �������� ��������
SELECT last_name �̸�, job_id ����, salary �޿�
FROM employees
WHERE job_id= (SELECT job_id
                    FROM   employees
                    WHERE last_name = 'Chen')
AND salary > (SELECT salary
                    FROM   employees
                    WHERE last_name = 'Chen');
                    
-- �׷� �Լ��� ����� ���������� ���
SELECT last_name �̸�, job_id ����, salary �޿�
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- HAVING ���������� ���..
SELECT department_id �μ���ȣ, MIN(salary) �����޿�
FROM employees
GROUP BY department_id
HAVING  MIN(salary) >    
                        ( SELECT min(salary)
                          FROM employees
                          WHERE department_id = 50);
                          
-- ����) ��� 'Abel'(last_name) ���� �޿��� ���� ����� last_name , salary �� ��Ÿ�����.(�������� ���)
SELECT last_name �̸�, salary �޿�
FROM employees
WHERE salary > ( SELECT salary
                          FROM employees
                          WHERE last_name = 'Abel');
-- ����) 'Bull'�� last_name�� ���� ����� �μ����� Bull���� ���� �޿��� �޴� ������� ����϶�.  (�������� ���)
SELECT employee_id ��ȣ, last_name �̸�, salary �޿�, department_id �μ���ȣ
FROM employees
WHERE department_id = ( SELECT department_id
                          FROM employees
                          WHERE last_name = 'Bull')
AND   salary > ( SELECT salary
                          FROM employees
                          WHERE last_name = 'Bull');
--����) 'Russell'�̶� last_name�� ������ȣ�� manager_id�� ������ �������� last_name, salary, manager_id�� ����Ͻÿ�.
SELECT last_name �̸� , salary �޿� , manager_id �Ŵ�����ȣ
FROM employees
WHERE manager_id = ( SELECT employee_id
                          FROM employees
                          WHERE last_name = 'Russell');

-- ����) jobs ���̺� job_title�� 'Stock Manager' ��  job_id�� ���� �������� ������ Employees ���̺��� ã�Ƽ� ����Ͻÿ�.
SELECT *
FROM employees
WHERE job_id = ( SELECT job_id
                          FROM jobs
                          WHERE job_title = 'Stock Manager');

-- ������ �������������� �ٷ� = >< �񱳸� �Ҽ� ����.
-- IN�� ���� �ϳ��� ������ �˻���.
SELECT MIN(salary)
FROM employees
GROUP BY department_id;

SELECT employee_id, last_name, department_id, salary
FROM employees
WHERE salary  IN  -- IN ������ IN �����ڴ� �ϳ��� �÷��� �������� '=' ������ ������ ��쿡 ���
                ( SELECT MIN(salary)
                  FROM employees
                  GROUP BY department_id);
            
-- ANY�� ���� �ϳ��� ������ �˻���. ������ IT_PROG �� �ƴϸ鼭  IT_PROG �� ������� �޿����� ������, �̶� ANY�� ���������� ��Ƽ���� ��� �ϳ��� �����ϸ� �ȴ�
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG'
ORDER BY salary DESC;

-- ALL ������ / ������ IT_PROG �� �ƴϸ鼭  IT_PROG �� ������� �޿����� ������, �̶� ALL�� ���������� ��Ƽ�� ��θ�  �������Ѿ� �Ѵ�
 SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG';

-- ���� 1) �μ���ȣ(department_id)��  20���� �������� �Ŵ������̵�(manager_id)�� ���� �Ŵ����� ������  �������� ����϶�. (�� 20�� �μ��� ������ ����!)
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE manager_id  IN
                    ( SELECT manager_id
                      FROM employees
                      WHERE department_id = 20)
AND department_id != 20 ;

-- ���� 2) job_id��  'ST_MAN'�� �������� ��� ������ ���ٵ� �޿��� ����  �������� ����϶�. (ANY)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'ST_MAN');

-- ����3 )��å�� 'IT_PROG' �� ������ ���� �޿��� ���� �������� ����Ͻÿ�.(ALL)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG');
                      
-- ���߿� , �������� ���� 2�� �̻�
-- First Name �� 'Bruce'�� ������ �Ŵ���(���)�� ������ ���� ������ ��ȸ
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN  (SELECT manager_id, job_id
                                FROM employees
                                WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';
-- �� �μ����� �ּ� �޿��� �޴� ����� �μ���ȣ, �����ȣ, �̸�, �޿� ������ �˻��Ѵ�.
select department_id �μ���ȣ, employee_id �����ȣ, first_name, salary
from employees
where (department_id, salary) in  (select department_id, min(salary)
                                   from employees
                                   group by department_id)
order by department_id;

-- ����) employees ���̺��� job_id���� ���� ���� salary�� ������ ã�ƺ���, 
--ã�Ƴ� job_id�� salary�� �ش��ϴ� ������ first_name, job_id, salary, department_id �� ����Ͻÿ�. (salary �������� ����)
select first_name, job_id,  salary, department_id �μ���ȣ 
from employees
where ( job_id, salary) in  (select job_id, min(salary)
                                   from employees
                                   group by job_id)
order by salary desc;


--����
-- UNION ������ : �ߺ��� �����Ѵ�. (����ټ� 115)
select employee_id, job_id  -- 107
from employees
union
select employee_id, job_id  -- 10
from job_history;

-- UNION ALL �ߺ��� ��� ���� X
select employee_id, job_id  -- 107
from employees
union ALL
select employee_id, job_id  -- 10
from job_history;

--INTERSECT�� �̿��� ������
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

--  --MINUS�� �̿��� ������ ������ ����.
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

-- ����) ?employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ UNION �����ڸ� �̿��� ���� ������.
select department_id -- 28
from employees
union
select department_id
from departments;
-- ����) employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ UNION ALL�����ڸ� �̿��� ���� ������.
select department_id --- 134
from employees
union all
select department_id
from departments;
-- ����) employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ �������� INTERSECT �����ڸ� �̿��� ����� ������.
select department_id --- 134
from employees
INTERSECT
select department_id
from departments;
-- ����) departments ���̺��� department_id ���տ��� employees ���̺��� department_id ������ MINUS �����ڸ� �̿��� �� ������.

select department_id
from departments
minus
select department_id --- 134
from employees;

