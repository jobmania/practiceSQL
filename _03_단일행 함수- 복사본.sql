--where �� ���
select * 
from employees
where salary > 14000;  -- 14000�̻� ���Ͷ� 

select * 
from employees
where last_name = 'King';  -- 14000�̻� ���Ͷ� 

select * 
from employees
where hire_date < '2002/06/10';

--���� 1) employees ���̺��� employee_id �� 100�� ���� ������ ����ϼ���.
Select * 
from employees
where employee_id= 100;
--���� 2) employees ���̺��� first_name �� David �� ���� ������ ����ϼ���.
Select * 
from employees
where first_name= 'David';
--���� 3) employees ���̺��� employee_id�� 105 ������ ���� ������ ����ϼ���.
Select * 
from employees
where employee_id < 105;
--���� 4) job_history ���̺��� start_date �� 2006�� 3�� 3�� ������ ������ ���.
Select * 
from JOB_HISTORY
where start_date >  '2006/03/03';
--���� 5) departments ���̺��� location_id �� 1700 �� �ƴ� ��� �μ��� ����϶�.
Select * 
from departments
where location_id !=  1700;

-- �� ������
SELECT last_name �̸�, department_id �μ���ȣ, salary ����
from employees
Where (department_id = 60 OR department_id = 80) 
And salary >10000;


--���� 1) employees ���̺��� salary�� 4000���� ũ�鼭 , job_id�� IT_PROG�� employee���� ��ȸ�ϼ���. 

Select * 
from employees
WHERE SALARY > 4000 AND JOB_ID ='IT_PROG';

--���� 2) employees ���̺��� �켱 salary�� 4000���� Ŀ�ߵǰ�  job_id�� IT_PROG�ų�(OR) FI_ACCOUNT�� ��츦 ��ȸ�ϼ���.
Select * 
from employees
WHERE SALARY > 4000 AND (JOB_ID ='IT_PROG' OR JOB_ID ='FI_ACCOUNT' );


---- IN ������ : () ���� ���� ������ OR�� ����
SELECT * 
FROM employees
WHERE salary IN ( 4000, 3000, 2700 );
--SELECT * FROM employees WHERE salary = 4000 OR salary = 3000 OR salary = 2700 �� ���� ����
SELECT * 
FROM employees
WHERE salary NOT IN ( 4000, 3000, 2700 );

--���� ) employees ���̺��� salary�� 10000, 17000, 24000�� ���� ������ ����ϼ���.
SELECT * 
FROM employees
WHERE salary IN ( 10000, 17000, 24000 );

--����) employees ���̺��� department_ID��  30 , 50, 80, 100, 110 �� �ƴ� ���� ������ ����ϼ���.
SELECT * 
FROM employees
WHERE department_ID IN ( 30 , 50, 80, 100, 110 );

--Betwwen ������ ���̰�
SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;
--SELECT * FROM employees WHERE salary >= 9000 AND salary <= 10000 
--���� ) employees ���̺��� salary�� 10,000 �̻��̰� 20,000 ������ ���� ������ ����ϼ���.
SELECT * 
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--����) employees ���̺��� hire_date �� 2004�� 1�� 1�� ���� 2004�� 12�� 30�� ������ ���� ������ ����ϼ���.
SELECT * 
FROM employees
WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/30';

--����) employees ���̺��� salary�� 7000 �̸��̰ų�, 17000 ���� ���� ����� ����϶�.
SELECT * 
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

-- Like ������ %�� ���� ����ؼ� ���ڿ� �˻�;
SELECT * FROM employees WHERE last_name Like 'B%'; -- �빮��B�� �����ϴ� ���ڵ� ������
SELECT * FROM employees WHERE last_name Like '%b%'; -- ���ڿ� �߰��� b�� �����ϴ� ���ڵ� ������
SELECT * FROM employees WHERE last_name Like '_____%y'; -- _����ٰ��� �̻� y�� ������ ���ڵ� ������

--���� 1 )  employees ���̺��� job_id ���� AD�� �����ϴ� ���  �����͸� ��ȸ�ϼ���.
SELECT * FROM employees WHERE job_id Like '%AD%';

--���� 2) employees ���̺��� job_id �� AD�� �����ϸ鼭 AD �ڿ� ������� ���ڿ��� 3�ڸ��� ������ ���� ���� ���� ������ ��ȸ�ϼ���.
SELECT * FROM employees WHERE job_id Like 'AD___' ;   -- �� 3�ڸ��� ����
SELECT * FROM employees WHERE job_id Like 'AD%___'  ;  --  3�ڸ� �̻� ����

--���� 3) employees ���̺��� ��ȭ��ȣ ���ڸ��� 1234�� ������ ���� ������ ��ȸ�ϼ���
SELECT * FROM employees WHERE phone_number Like '%1234';

--���� 4) employees ���̺��� ��ȭ��ȣ�� 3�� ���� �����鼭 ��ȭ��ȣ ���ڸ��� 9�� ������ ���� ������ ����Ͻÿ�.
SELECT * FROM employees WHERE phone_number NOT Like '%3%' AND phone_number LIKE '%9';

--���� 5) employees ���̺��� job_id �� MGR �� �����ϰų� , ASST  �� �����ϴ� ���� ������ ��ȸ�ϼ���.
SELECT * FROM employees WHERE job_id Like '%MGR%' or job_id Like '%ASST%';

SELECT * From employees where commission_pct is null;
SELECT * From employees where commission_pct is not null;

-- ���� ) employees ���̺��� manager_id�� null ���� ���� ������ ����� ������.
SELECT * From employees where manager_id is null;


-- ORDER BY �� ���� �������� �������� ����, ORDER�� ���� �������� ����.
SELECT * FROM employees ORDER BY employee_id DESC;

-- ���Ŀ��� 2�� �̻��϶� ù��°�� ���� -> �ι�°�� ����
SELECT department_id, employee_id, first_name, last_name FROM employees ORDER BY department_id, employee_id DESC;

-- q��Ī���� ����
SELECT department_id, last_name, salary*12 ���� FROM employees ORDER BY ���� DESC;
-- ���� ������
SELECT department_id, last_name, salary*12 ���� FROM employees ORDER BY 3;

--���� 1) employees ���̺��� employee_id, first_name, last_name�� ����ϰ� employee_id�� �������� �������� �����ϼ���.
SELECT employee_id, first_name, last_name FROM employees ORDER BY employee_id;

--���� 2) employees ���̺��� job_id �� CLERK �� �ܾ ���� �������� salary �� ���� ������ �����ϼ���.
SELECT * FROM employees WHERE job_id LIKE '%CLERK%' ORDER BY SALARY DESC;

--���� 3) employees ���̺��� employee_id (������ȣ)�� 120���� 150������ ������ �μ���ȣ(department_id)�� ū������ �����ϰ� �μ���ȣ�� ������ ����(salary)�� ū������ �����϶�.
SELECT * FROM employees WHERE employee_id Between 120 AND 150 
ORDER BY department_id DESC , salary desc;
