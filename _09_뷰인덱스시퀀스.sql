----- ��� ������ ���̺� 

-- �ܼ��� �� �����
CREATE VIEW EMP_V1 (������ȣ, �̸�, ��, �̸���, �����, ����)
AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v1;
-- �信 ������ �Է�( ���� ���̺��� �ƴϱ� ������ ���� ���̺� �Է��� �ȴ�.!)
INSERT INTO emp_v1(������ȣ, �̸�, ��, �̸���, �����, ����)
VALUES (333,'David','King','DKing',SYSDATE,'IT_PROG');

-- ������ �� �����!!
--���� ���̺��� ���� �̸��� ��Ī�� ����
-- �׷��Լ��� �� ��� dml(�ۼ�,����,���� �Ұ�)
CREATE OR REPLACE VIEW �μ���_����_����
AS
    SELECT department_id �μ���ȣ, COUNT(*) ������,
    Min(salary) �����޿�, MAX(salary) �ְ�޿�,
    ROUND(AVG(salary)) ��ձ޿�
    from employees
    GROUP BY department_id
    ORDER BY department_id;
    
--    90�� ���� �μ� �Ф� �� ���� ��
CREATE OR REPLACE VIEW EMP90_read (������ȣ, �̸�, ��, �̸���, �����, ����)
AS
    SELECT employee_id , first_name,
           last_name, email, hire_date, job_id
    from employees where department_id = 90
    with read only;
    
 SELECT * FROM EMP90_READ;    
    
--    �Է�, ���� ,����  DML �۾��� �ȵ�
DELETE FROM EMP90_READ WHERE ������ȣ = 100;



-- �����
DROP VIEW emp_v1;
DROP VIEW EMP90_READ; 
