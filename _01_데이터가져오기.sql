-- *은 전체열
SELECT * FROM departments;

-- 2. 특정열 
SELECT DEPARTMENT_ID FROM DEPARTMENTS;

-- 3. 
SELECT DEPARTMENTS_ID AS 부서번호 FROM DEPARTMENTS;

-- 4. 산술 연산자(+,-,/,*)
SELECT FIRST_NAME 이름, JOB_ID 직책, SALARY 월급 FROM EMPLOYEES;

-- 월급에  100씩 뺀 열
SELECT FIRST_NAME 이름, JOB_ID 직책, SALARY 월급, SALARY-100 월급수정 FROM EMPLOYEES;

-- 보너스는 월급에서 1000을 뺀 5% 책정
SELECT FIRST_NAME 이름, 
JOB_ID 직책, 
SALARY 월급, 
(SALARY-1000)*0.05 보너스 
FROM EMPLOYEES;

-- DISTINCT : 중복제거
SELECT DISTINCT JOB_ID FROM EMPLOYEES;

-- 연결 연산자 || : 문자열을 붙여서 하나의 열로 출력
select employee_id 직원번호, first_name ||' '|| last_name 풀네임
from employees;

--
select employee_id 직원번호, first_name ||' '|| last_name 진짜이름, email ||'@company.com' 회사이메일 from employees;

-- 테이블 열의 정보 확인(숫자 : number, 문자열 : varchar2, 날짜 : date) 
DESC employees;
DESC COUNTRIES;
