-- DML �۾�

-- ������ �Է� INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300,'Game', 100, 1700);
SELECT * FROM departments WHERE department_id = 300;


-- Ư�� ���� �Է��� �� ! (���Է½� NULL)
INSERT INTO departments(department_id, department_name)
VALUES (310,'Music');

SELECT * FROM departments;
DESC departments;

-- �� �̸� ������ ��� ���� �����ؾ��� ! 
INSERT INTO departments
VALUES (312,'Hogu',NULL,1700);

SELECT * FROM departments;
DESC departments;


--  ���� 1) departments ���̺� ������ ���� ������ department_id, department_name,
-- manager_id�� 200, location_id�� 1700�� ���� 3�� �Է��ϼ���.
INSERT INTO departments
VALUES (313,'Sample',200,1700);

SELECT * FROM departments;
DESC departments;
-- ���� 2) �Ʒ��� ���� ���̺��� ������  SELECT ���� �̿��Ͽ� departments ���̺� ������ ���� �Է��Ͻÿ�. ( ���� scott���� 3��° ���)
--// copy_departments ��� ���̺��� ����
CREATE TABLE copy_departments( department_id number(4,0),
                              department_name varchar2(30 byte),
                              manager_id number(6,0),
                              location_id number(4,0));
INSERT INTO copy_departments
SELECT * FROM departments; -- ������ ���̺� �Է�~


-- ������ ���� UPDATE

UPDATE departments
SET manager_id = 200
WHERE department_name = 'Game';

-- ����) departments ���̺��� department_id 150���� 200���� �μ���ȣ�� manager_ID �� 100���� �����϶�.
UPDATE departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;
SELECT * FROM departments;

-- ����) 2�� �� ���� ����  / departments ���̺��� department_id 150���� 200���� �μ���ȣ�� manager_ID �� 200, location_id �� 2500���� �����϶�.
UPDATE departments
SET manager_id = 200, location_id = 2500
WHERE department_id BETWEEN 150 AND 200;
SELECT * FROM departments;


-- delete ���� 
-- Ư������ WHERE ���� �־ ���� 
DROP table copy_departments; --���̺� ����

DELETE from departments WHERE department_name = 'Game';
DELETE from departments WHERE department_id = 313;
commit; -- �����ͺ��̽� �۾� �ݿ�
ROLLBACK; -- �����ͺ��̽� �۾� �ѹ�
SELECT * FROM departments;

DELETE from departments WHERE department_id between 120 and 270;
SELECT * FROM departments;
