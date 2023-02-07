-- �׷��Լ�(�����Լ�)
SELECT ROUND(AVG(salary)) ��հ�, MAX(salary) �ְ����, MIN(salary) �ּҰ�,
        SUM(Salary)  �հ�, COUNT(salary)
FROM employees
WHERE job_id LIKE 'IT_PROG';

SELECT * FROM employees where job_id = 'IT_PROG';

---- �ΰ��� �����ϰ� ���� ���ڸ� ������, *�϶��� NULL���� �����Ѵ�.
SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(*)
FROM employees;

----
SELECT COUNT(commission_pct), AVG(commission_pct)
From employees;

---- Group ByȰ��
SELECT department_id �μ���, ROUND(AVG(salary)) ��ձ޿�,
        COUNT(*) ������,
       TO_CHAR(ROUND(AVG(salary)), '$99,999') �޷�ǥ��
FROM employees 
GROUP BY department_id  -- �μ�����
Order By department_id;

SELECT *
FROM employees;


----���� 1)  �μ��� �����, �ִ�޿�, �ּұ޿�, �޿��հ�, ��ձ޿��� �޿��հ� ū������ ��ȸ
SELECT department_id �μ��̸�, Count(*)�����, MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�, SUM(salary) �޿��հ�, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY SUM(salary) DESC;

-- ���� 2)  �μ���, ������(job_id) ���� �׷��� ���� salary �հ�� �׷캰 ������ ���ڸ� ����϶�.
SELECT department_id �μ��̸�,  job_id �����̸�, SUM(salary) �޿���, Count(*) ������
FROM employees
GROUP BY department_id, job_id
Order By department_id;

--- ���� 3) �μ����� �ְ� ������ �̾Ƽ� ����� ����, �������� ���� ����� ���� ����϶�
SELECT ROUND(AVG(MAX(salary))) �ִ�, ROUND(AVG(MIN(salary))) �ּ�
FROM employees
GROUP BY department_id ;

--- HAVING .
SELECT department_id �μ���, COUNT(*) �����
FROM employees
GROUP BY departm
ent_id
HAVING COUNT(*) > 5;   

-- ���� 1) �Ʒ� ������ ������ ��� ������ $10000�� �ʰ��ϴ� ������ ���ؼ� job_id��
-- ���޿� �հ踦 ��ȸ�ϴ� ���̴�. �� ��ī��Ʈ �Ŵ���( AC_MGR )�� �����ϰ� �� �޿� �հ�� �������� �����Ͻÿ�.
SELECT job_id ����, SUM(salary) �޿���
FROM employees
WHERE job_id !='AC_MGR'
GROUP BY job_id
HAVING AVG(salary) > 10000
ORDER BY SUM(salary) DESC;  

--���� 2) �μ���ȣ 40�� ������ �μ��� ��� �޿��� 7000 ������ �μ����� ��� �޿��� ���
SELECT department_id �μ�, Round(AVG(salary)) �޿���
FROM employees
WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary) <= 7000
ORDER BY AVG(salary)DESC;

--���� 3) �������� ����(salary)�� �հ谡 13000 �̻��� ������ ����϶�. 
--�޿��Ѿ����� ������������ �����ϰ�, ����(job_id)�� 'REP' ����ִ� ������ �����Ѵ�.

SELECT  job_id ����, SUM(salary) �޿���
FROM employees
WHERE job_id NOT Like '%REP%'
GROUP BY  job_id
HAVING SUM(salary) >= 13000
ORDER BY SUM(salary)DESC

