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
