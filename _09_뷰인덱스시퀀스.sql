----- 뷰는 가상의 테이블 

-- 단순한 뷰 만들기
CREATE VIEW EMP_V1 (직원번호, 이름, 성, 이메일, 고용일, 직종)
AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v1;
-- 뷰에 데이터 입력( 실제 테이블이 아니기 때문에 실제 테이블에 입력이 된다.!)
INSERT INTO emp_v1(직원번호, 이름, 성, 이메일, 고용일, 직종)
VALUES (333,'David','King','DKing',SYSDATE,'IT_PROG');

-- 복잡한 뷰 만들기!!
--원본 테이블의 열의 이름에 별칭을 붙임
-- 그룹함수를 쓴 뷰는 dml(작성,수정,삭제 불가)
CREATE OR REPLACE VIEW 부서별_직원_보고서
AS
    SELECT department_id 부서번호, COUNT(*) 직원수,
    Min(salary) 최저급여, MAX(salary) 최고급여,
    ROUND(AVG(salary)) 평균급여
    from employees
    GROUP BY department_id
    ORDER BY department_id;
    
--    90번 전용 부서 읽ㄱ ㅣ 전용 뷰
CREATE OR REPLACE VIEW EMP90_read (직원번호, 이름, 성, 이메일, 고용일, 직종)
AS
    SELECT employee_id , first_name,
           last_name, email, hire_date, job_id
    from employees where department_id = 90
    with read only;
    
 SELECT * FROM EMP90_READ;    
    
--    입력, 수정 ,삭제  DML 작업은 안됨
DELETE FROM EMP90_READ WHERE 직원번호 = 100;



-- 뷰삭제
DROP VIEW emp_v1;
DROP VIEW EMP90_READ; 



--  인덱스 (PK OR UNIQUE일 경우 자동으로 생성된다.)

-- 인덱스 조회하기
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


SELECT * FROM members  -- 인덱스 만들기전 0.008 인덱스 만든 후 0.002 
WHERE last_name = 'Harse';

SELECT * FROM members  -- 0.001 조금더 빠름
WHERE member_id = 139;

CREATE INDEX members_last_name_i -- 인덱스생성 , 인덱스이름
ON members(last_name);               -- 인덱스열 

DROP INDEX members_last_name_i;  --삭제
DROP INDEX members_first_name_i;  --삭제

-- 예제) 위의 문법대로 MEMBERS 테이블의  first_name과 last_name의 멀티 인덱스를 만들어서 아래의 그림처럼 의  인덱스들의 조회및   성능평가 결과를 출력하라
CREATE INDEX members_last_name_i -- 인덱스생성 , 인덱스이름
ON members(last_name);   
CREATE INDEX members_first_name_i -- 인덱스생성 , 인덱스이름
ON members(first_name);   


EXPLAIN PLAN FOR  -- 보고서 작성
SELECT * FROM members
WHERE last_name = 'Harse';

EXPLAIN PLAN FOR  -- 보고서 작성
SELECT * FROM members
WHERE first_name = 'Stinky';

SELECT  -- 보고서 조회
    PLAN_TABLE_OUTPUT 
FROM 
    TABLE(DBMS_XPLAN.DISPLAY());

-- 시퀀스 
CREATE SEQUENCE 시퀀스1;
DROP SEQUENCE 시퀀스1;

SELECT * FROM USER_SEQUENCES;

-- 시쿼스 텟스트
SELECT 시퀀스1.NEXTVAL FROM DUAL; -- 다음 시퀀스 값
SELECT 시퀀스1.CURRVAL FROM DUAL; -- 현재 시퀀스 값 

-- 시퀀스 옵션 시작값 10, 증가는 10
CREATE SEQUENCE 시퀀스2
START WITH 10
INCREMENT BY 10;

-- 부서 테이블 만들기
CREATE TABLE 부서(
    부서번호 NUMBER PRIMARY KEY,
    부서이름 VARCHAR2(100)
)

INSERT INTO 부서 VALUES(시퀀스2.NEXTVAL, '개발부');
INSERT INTO 부서 VALUES(시퀀스2.NEXTVAL, '안기부');
INSERT INTO 부서 VALUES(시퀀스2.NEXTVAL, '재경부');

UPDATE 부서 SET 부서번호 = 시퀀스1.NEXTVAL;