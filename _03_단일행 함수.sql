-- ������ �Լ�

-- 1.������  �Լ� 

-- ��ҹ��� �Լ�  UPPER LOWER INITCAP(�ձ��ڸ� �빮��) , DUAL�� �������̺� . 
SELECT UPPER('SQL Course'), Lower('SQL Course'), Initcap('SQL Course')
From dual;  

-- ���� ���� �Լ� 
SELECT 
    SUBSTR('ABCDEFG',3,4), -- 3��° ���ڿ����� 4������.dummy
    Length('ABCDEFG'),      
    INSTR('ABCDEFG','D')
    FROM DUAL;
--    ���ڿ� �յ� ���� X
SELECT TRIM('   2    ������    2   '), '    �ƾƾ�    ' From Dual; 

-- ���� 1 .
SELECT employee_id, last_name
FROM employees
WHERE LOWER(last_name) = 'higgins';

-- ���� 2.
SELECT last_name, CONCAT('�������� ', job_id) AS ������
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP' ;

-- ���ڿ� ���� �� ���� (-1�� ���ڿ��� ������ ����)
SELECT last_name, SUBSTR(last_name, -1, 1)
FROM employees;

-- ���ڿ� �ٲٱ�
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') ������
FROM employees;

-- ����) employees ���̺��� last_name�� �ҹ��ڿ� �빮�ڷ� ���� ����ϰ�, email�� ù ��° ���ڴ� �빮�ڷ� ����ϼ���.
SELECT last_name, UPPER(last_name), LOWER(last_name),email, INITCAP(email)
FROM employees;


-- ����)employees ���̺��� job_id ������ ���� ù° �ڸ����� �����ؼ� �� ���� ���ڸ� ����ϼ���.
SELECT job_id AS ������,
SUBSTR(job_id,1,2) AS ���ǵΰ�
FROM employees;


-- 2. ������ �Լ�
SELECT 
    ROUND(15.232,1), -- �ݿø� 15.2
    ROUND(15.242,0),  -- �ݿø� 15
    ROUND(15.242,-1)  -- �ݿø� 20
FROM dual;

SELECT employee_id ¦����°, last_name
FROM employees
WHERE MOD(employee_id, 2) =0
ORDER BY employee_id;

-- ���� ) employees ���̺��� salary�� 30���� ���� �� ���� ���� ����� �ݿø��Ͽ�  ����, �Ҽ��� ù° �ڸ�, 10�� �ڸ��� ��Ÿ���ÿ�.
SELECT 
SALARY,
ROUND(salary/30,1) �Ҽ���1, 
ROUND(salary/30,0) ����,
ROUND(salary/30,-1) ���ڸ� 
FROM employees
ORDER BY salary DESC;

-- 3. ��¥��   �Լ�
SELECT sysdate from dual;  -- ���糯¥.

SELECT 
    sysdate ���糯¥, 
    ROUND(sysdate, 'DD')��,
    ROUND(sysdate, 'MM')���ݿø�,
    ROUND(sysdate, 'YYYY')�⵵�ݿø�,
    MONTHS_BETWEEN('2022/01/01','2021/01/01') ��������,
    ADD_MONTHS('2022/01/01',2) �����߰�,
    NEXT_DAY('2022/01/01',2) ��¥�߰�
    FROM dual;

-- ��¥�� ���ϱ� ���� �ϱ�
SELECT sysdate ���ó�¥, sysdate - 1 ����, sysdate + 1 ����,
       sysdate + 3/24 �ð����ϱ�     
FROM dual;

-- ����
SELECT employee_id, hire_date,
        ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)) �ٹ�����,
       ADD_MONTHS(hire_date, 6) "6���� �߰�",
       NEXT_DAY(hire_date, 6) Next_day, 
       --1(��), 2(��), 3(ȭ), 4(��), 5(��), 6(��), 7(��) 
       LAST_DAY(hire_date) Last_day
       --���� ������ ��
FROM employees
WHERE MONTHS_BETWEEN(SYSDATE,hire_date) < 500;


--����) employees ���̺��� department_id�� 100�� ������ ���� ���� ��¥, hire_date, ���� ��¥�� hire_date ������ ���� ���� ����ϼ���.
SELECT 
    sysdate ���ó�¥,
    hire_date,
    TRUNC(MONTHS_BETWEEN(sysdate, hire_date)) ��������
FROM employees
WHERE department_id=100;

-- ����) employees ���̺��� employee_id�� 100�� 106 ������ ������ hire_date�� 3������ ���� ��, hire_date�� 3������ �� ���� ����ϼ���.

SELECT 
    hire_date,
    ADD_MONTHS(hire_date ,3) �����߰�,
    ADD_MONTHS(hire_date ,-3) ��������
FROM employees
WHERE employee_id between 100 AND 106;

-- ��ȯ�� �Լ�
-- ���� -> ���ڷ� ��ȯ
SELECT 
    TO_CHAR( 12345678 ,'999,999,999') �޸�����,
    TO_CHAR(123.45678,'999,999,999.99') period,
    TO_CHAR(12345678,'$999,999,999') dollar,
    TO_CHAR(12345678,'L999,999,999') local, --�ѱ��� ��ȭǥ��
    TO_CHAR(123,'XXXX') hexadecimal 
FROM dual;

-- ���� -> ���ڿ��� ��ȯ (����Ÿ���� �߿�)
SELECT
    TO_CHAR(sysdate, 'YYYY/MM/DD') ��¥ǥ��,
    TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS') �ð�ǥ��
FROM DUAL;    


-- 365�� �� �� ��°���� ��ȸ
SELECT TO_CHAR(SYSDATE, 'DDD') "Day of year" 
FROM DUAL;
 
-- 53�� �� �� ���� ���� ��ȸ
SELECT TO_CHAR(SYSDATE, 'IW') "Week of year" 
FROM DUAL;
 
-- �ش� ���� �̸� ��ȸ
SELECT TO_CHAR(SYSDATE, 'MONTH') "Name of month" 
FROM DUAL;

--����) employees ���̺��� department_id �� 100�� ������� �Ի����� �̿��Ͽ� �Ʒ��� ���� ��Ÿ�����. ��¥ ����  ' �� / �⵵ '

SELECT 
    employee_id,
    TO_CHAR(hire_date, 'MM/YY') �Ի���   
FROM employees
WHERE department_id=100;

-- ����) employees ���̺��� salary�� 10000�޷��� �Ѵ� ������� �̸��� ������ ������ ���������� ��Ÿ�����.

SELECT 
    employee_id,
    first_name||' '|| last_name �̸�,
    TO_CHAR(salary,'999,999,999') money, -- 9999�� ��ߵ�.
    TO_CHAR(salary,'$999,999,999') dollar
FROM employees
WHERE salary>10000
ORDER BY salary DESC;

-- DATE Ÿ������ ��ȯ�ϴ� ����
SELECT TO_DATE('2011-01-01','YYYY-MM-DD') 
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ�ϴ� ������ �����̴�.
SELECT TO_NUMBER('9910616') 
FROM DUAL; 


-- NULL ���� �Լ�.. 
-- NVL(�� , 0)/ ���� ���� NULL�̸� 0���� ��ȯ.
SELECT last_name �̸�, NVL(manager_id, 0 ) �Ŵ���
FROM employees WHERE last_name = 'King';

SELECT NULL + 100 from dual; --  null ����..

-- NVL2(�� , ù, �� )/ ���� ���� NULL�ƴϸ� ù��° NULL�̸� �ι�°
SELECT last_name �̸�, NVL2(manager_id, 1, 0) �Ŵ���
FROM employees WHERE last_name = 'King';

-- ����) employees ���̺��� �Ʒ��� ���� �̸�, ����(salary),Ŀ�̼�(commission_pct)��  NVL �Լ����, ������ ( ����*12) + (����*12*Ŀ�̼�) �̴�.
-- (Ŀ�̼��� ���� ����� ����*12�� ���ǰ�, �ִ� ����� ( ����*12) + (����*12*Ŀ�̼�) )
SELECT 
    last_name �̸�,
    NVL(commission_pct, 0) Ŀ�̼�,
    salary ����,
    (salary*12) + (salary*12* NVL(commission_pct, 0)) ����
FROM employees 
ORDER BY salary DESC;


--����) ���� ������ ���Ͽ� ��������� NVL2 �Լ��� ����Ͽ� Ŀ�̼��� �������� ������ ������� ��Ÿ���ϴ�
SELECT 
    last_name �̸�,
    NVL(commission_pct, 0) Ŀ�̼�,
    salary ����,
    (salary*12) + (salary*12* NVL2(commission_pct, commission_pct, 0)) ����,
    NVL2(commission_pct, '���ʽ� �߰�', '���ʽ�����') �������
FROM employees 
ORDER BY salary DESC;

-- DECODE �Լ�
SELECT last_name �̸�, job_id, salary,
    DECODE(job_id, 'IT_PROG', salary * 1.10,
                    'ST_CLERK', salary * 1.15,
                    'SA_REP', salary * 1.20,
                            salary) "��������"
FROM employees;

-- ����) employees ���̺��� DECODE �Լ��� �̿��ؼ� ���޿� ���� ������ ��Ÿ������. TRUNC( salary / 2000 ) �� ���� 0�϶� 0%, 1�϶�  9%, ...
SELECT last_name �̸�, job_id, salary,
    DECODE(TRUNC(salary/2000),  0, 0,
                                1,0.09,
                                2,0.2,
                                3,0.3,
                                4,0.4,
                                5,0.42,
                                6,0.44,
                                  0.45 ) "����"
FROM employees;


-- CASE ���
SELECT last_name �̸�, job_id, salary,
   CASE job_id  WHEN 'IT_PROG'   THEN salary * 1.10
                WHEN 'ST_CLERK'  THEN salary * 1.15
                WHEN 'SA_REP'    THEN salary * 1.20
                ELSE                  salary  
   END "���� ����"
FROM employees;


SELECT last_name �̸�, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
          WHEN salary<10000  THEN 'Medium'
          WHEN salary<20000  THEN 'Good'
          ELSE                    'Excellent'  
    END "�޿� ����"
FROM employees;


-- ����)employees ���̺��� job_id�� IT_PROG��� employee_id, first_name, last_name, salary�� ����ϵ�
-- salary�� 9000 �̻��̸� �������޿���, 6000�� 8999 ���̸� �������޿���, �� �ܴ� �������޿������ ����ϼ���.
SELECT employee_id, last_name �̸�, job_id, salary,
    CASE  WHEN salary>9000   THEN '�����޿�'
          WHEN salary>5999  THEN '�����޿�'
          ELSE                    '�����޿�'  
    END "�޿� ����"
FROM employees
WHERE job_id = 'IT_PROG';

