-- *�� ��ü��
SELECT * FROM departments;

-- 2. Ư���� 
SELECT DEPARTMENT_ID FROM DEPARTMENTS;

-- 3. 
SELECT DEPARTMENTS_ID AS �μ���ȣ FROM DEPARTMENTS;

-- 4. ��� ������(+,-,/,*)
SELECT FIRST_NAME �̸�, JOB_ID ��å, SALARY ���� FROM EMPLOYEES;

-- ���޿�  100�� �� ��
SELECT FIRST_NAME �̸�, JOB_ID ��å, SALARY ����, SALARY-100 ���޼��� FROM EMPLOYEES;

-- ���ʽ��� ���޿��� 1000�� �� 5% å��
SELECT FIRST_NAME �̸�, 
JOB_ID ��å, 
SALARY ����, 
(SALARY-1000)*0.05 ���ʽ� 
FROM EMPLOYEES;

-- DISTINCT : �ߺ�����
SELECT DISTINCT JOB_ID FROM EMPLOYEES;

-- ���� ������ || : ���ڿ��� �ٿ��� �ϳ��� ���� ���
select employee_id ������ȣ, first_name ||' '|| last_name Ǯ����
from employees;

--
select employee_id ������ȣ, first_name ||' '|| last_name ��¥�̸�, email ||'@company.com' ȸ���̸��� from employees;

-- ���̺� ���� ���� Ȯ��(���� : number, ���ڿ� : varchar2, ��¥ : date) 
DESC employees;
DESC COUNTRIES;
