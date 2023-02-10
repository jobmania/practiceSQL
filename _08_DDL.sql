-- DDL �۾�

-- ���̺� ����
CREATE TABLE �׽�Ʈ ( 
    ���ڿ� VARCHAR2(100),
    ���� NUMBER,
    ��¥ DATE DEFAULT SYSDATE
);

INSERT INTO �׽�Ʈ VALUES ('DJ42' , 1234, TO_DATE('2022/02/12'));
INSERT INTO �׽�Ʈ(���ڿ�, ����) VALUES ('DJ2' , 1235);
INSERT INTO �׽�Ʈ VALUES ('BAS' , 9435,'2026/11/05');
SELECT * FROM �׽�Ʈ;
-- ���̺� ����
DROP TABLE �׽�Ʈ;

-- ����) product_id(number Ÿ��), product_name(varchar2 Ÿ��, 20�ڸ�), menu_date(date Ÿ��) ���� �ִ� sample_product �̸��� ���̺��� ������ ������.
CREATE TABLE  sample_product ( 
    product_name VARCHAR2(80),
    product_id NUMBER,
    menu_date DATE DEFAULT SYSDATE
);

DESC sample_product;
-- ����) ������ ���� ���̺��� ������ ������. DESCRIBE ���� ���̺��� �� �����Ǿ����� Ȯ���ϼ���
DROP TABLE sample_product;


-- ��������
CREATE TABLE emp ( 
     �̸� VARCHAR2(100),
     ���� VARCHAR2(5) NOT NULL CHECK(���� IN('M','W')), -- NULL �ȵ�!
     ������ȣ NUMBER PRIMARY KEY, -- �⺻Ű ��������!!
     ���� NUMBER CHECK(���� > 150),
      UNIQUE(�̸�) --�ߺ��ȵ�!!
);
 
INSERT INTO emp VALUES ('BAS' ,'M' , 1, 200);
INSERT INTO emp VALUES ('BAS' ,NULL , 1, 200);  -- NULL  X
INSERT INTO emp VALUES ('BAS' ,'W', 3, 170);   -- �̸� UNIQUE X
INSERT INTO emp VALUES ('SSS' ,'M', 1, 190);    -- ID PRIMARY KEY X
INSERT INTO emp VALUES ('SSS' ,'Q', 2, 220);      -- ���� ���� �Է�
INSERT INTO emp VALUES ('SSS' ,'W', 2,100);   -- ���� �������� X
INSERT INTO emp VALUES ('SSS' ,'W', 2,NULL);   -- NULL ����.
DESC emp;
SELECT * FROM EMP;
DROP TABLE emp;


-- ���� ) members ��� �� ���̺��� ����ϴ�. (�������� �̸��� ��������)
CREATE TABLE members2 ( 
     member_id NUMBER PRIMARY KEY ,   -- �⺻Ű
     first_name VARCHAR2(50) NOT NULL,  -- NULL �Է� �Ұ�
     last_name VARCHAR2(50) NOT NULL,  -- NULL �Է� �Ұ�
     gender VARCHAR2(5) NOT NULL CHECK(gender IN('Man','Woman')), -- ����  'Man'  �Ǵ� 'Woman'
     birth_day DATE DEFAULT sysdate,  -- ����Ʈ��  SYSDATE
     email VARCHAR2(200) NOT NULL,   -- ����ũ, NULL �ԷºҰ�
     UNIQUE(email) --�ߺ��ȵ�!   
);
DESC members2
DROP TABLE members2;

-- �ܷ�Ű fk  �⺻Űpk ��������
CREATE TABLE �μ�(
    �μ���ȣ NUMBER PRIMARY KEY,
    �μ��̸� VARCHAR2(100)
);
DROP TABLE �μ�;
INSERT INTO �μ� VALUES (1, '����');
INSERT INTO �μ� VALUES (2, '�濵');
INSERT INTO �μ� VALUES (3, 'ȸ��');

CREATE TABLE ����(
    ������ȣ NUMBER PRIMARY KEY,
    �̸� VARCHAR2(100),
    �μ���ȣ NUMBER,
    FOREIGN KEY(�μ���ȣ) REFERENCES �μ�(�μ���ȣ)
--    ON DELETE CASCADE -- �ܷ�Ű�� �����ϰ� �ִ� ���� �����Ǹ� �����ϰ� �ִ� ���� ����
    ON DELETE SET NULL -- �ܷ�Ű�� �����ϰ� �ִ� ���� �����Ǹ� �����ϰ� �ִ� �� NULL ����
);
DROP TABLE ����;
-- �����Ǵ� �÷��� PK�̰ų� UK(Unique key)�� ����
INSERT INTO ���� VALUES (1, '������',1);
INSERT INTO ���� VALUES (2, '���ؽ�',1);
INSERT INTO ���� VALUES (3, '������',2);
INSERT INTO ���� VALUES (4, '������',null); -- �� ���� 

-- �ܷ�Ű ������ �������� ������ ���� ����. > �������̺��� �ش�μ���ȣ�� �����ϰ� �ֱ� ������!, �����ϰ� ���� ������ ������.
-- �׷��� �ڽ� ������  ON DELETE CASCADE�� �ְ� �Ǹ� �ڽĿ��� �����Ҽ� ����.
SELECT * FROM ����;
DELETE FROM �μ� where �μ���ȣ = 1;


-- ���� ���� ��ȸ
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = '�μ�'; -- ���̺� �빮��.

SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = '����'; -- ���̺� �빮��.

-- ���� ���� �߰�(���̺� ������ �߰��ϱ�)
    CREATE TABLE ����(
        �����ȣ NUMBER ,
        ����� VARCHAR2(100)
    );
DROP TABLE ����;
INSERT INTO ���� VALUES('01','�����ͺ��̽�');
INSERT INTO ���� VALUES('02','���α׷���');

CREATE TABLE �л�(
    �л���ȣ NUMBER ,
    �̸� VARCHAR2(100),
    �����ȣ NUMBER
  
); 
DROP TABLE  �л�;
--�������� �߰�
ALTER TABLE ���� ADD PRIMARY KEY(�����ȣ);
ALTER TABLE ���� ADD  UNIQUE(�����);

ALTER TABLE �л� ADD  PRIMARY KEY(�л���ȣ);
ALTER TABLE �л� MODIFY �̸� NOT NULL;
ALTER TABLE �л� ADD FOREIGN KEY(�����ȣ) REFERENCES ����(�����ȣ);

INSERT INTO �л� VALUES(1,'�ؽ�',1);
INSERT INTO �л� VALUES(2,'����',2);
INSERT INTO �л� VALUES(3,'�ٰ�',2);

-- ���� ���� ���� �ϱ� !! 
ALTER TABLE ���� DROP CONSTRAINT SYS_C007076;
ALTER TABLE ���� DROP CONSTRAINT SYS_C007075;


--- �׽�Ʈ (���̸��� ����)
CREATE TABLE EMP_TEMP
AS SELECT * FROM employees
WHERE 1 != 1; --(���̸��� ����)

SELECT * FROM EMP_TEMP;
DROP TABLE  EMP_TEMP ;

CREATE TABLE EMP80
AS SELECT email �̸��� FROM employees
WHERE department_id = 80; --(���̸��� ����)
SELECT * FROM EMP80;        
drop table emp80;