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



--  �ε��� (PK OR UNIQUE�� ��� �ڵ����� �����ȴ�.)

-- �ε��� ��ȸ�ϱ�
SELECT * 
FROM ALL_IND_COLUMNS
WHERE table_name = 'MEMBERS';

CREATE TABLE members(
    member_id NUMBER,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL,
    PRIMARY KEY(member_id)
);


SELECT * FROM members  -- �ε��� ������� 0.008 �ε��� ���� �� 0.002 
WHERE last_name = 'Harse';

SELECT * FROM members  -- 0.001 ���ݴ� ����
WHERE member_id = 139;

CREATE INDEX members_last_name_i -- �ε������� , �ε����̸�
ON members(last_name);               -- �ε����� 

DROP INDEX members_last_name_i;  --����
DROP INDEX members_first_name_i;  --����

-- ����) ���� ������� MEMBERS ���̺���  first_name�� last_name�� ��Ƽ �ε����� ���� �Ʒ��� �׸�ó�� ��  �ε������� ��ȸ��   ������ ����� ����϶�
CREATE INDEX members_last_name_i -- �ε������� , �ε����̸�
ON members(last_name);   
CREATE INDEX members_first_name_i -- �ε������� , �ε����̸�
ON members(first_name);   


EXPLAIN PLAN FOR  -- ���� �ۼ�
SELECT * FROM members
WHERE last_name = 'Harse';

EXPLAIN PLAN FOR  -- ���� �ۼ�
SELECT * FROM members
WHERE first_name = 'Stinky';

SELECT  -- ���� ��ȸ
    PLAN_TABLE_OUTPUT 
FROM 
    TABLE(DBMS_XPLAN.DISPLAY());

-- ������ 
CREATE SEQUENCE ������1;
DROP SEQUENCE ������1;

SELECT * FROM USER_SEQUENCES;

-- ������ �ݽ�Ʈ
SELECT ������1.NEXTVAL FROM DUAL; -- ���� ������ ��
SELECT ������1.CURRVAL FROM DUAL; -- ���� ������ �� 

-- ������ �ɼ� ���۰� 10, ������ 10
CREATE SEQUENCE ������2
START WITH 10
INCREMENT BY 10;

-- �μ� ���̺� �����
CREATE TABLE �μ�(
    �μ���ȣ NUMBER PRIMARY KEY,
    �μ��̸� VARCHAR2(100)
)

INSERT INTO �μ� VALUES(������2.NEXTVAL, '���ߺ�');
INSERT INTO �μ� VALUES(������2.NEXTVAL, '�ȱ��');
INSERT INTO �μ� VALUES(������2.NEXTVAL, '����');

UPDATE �μ� SET �μ���ȣ = ������1.NEXTVAL;