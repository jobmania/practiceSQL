--where 절 사용
select * 
from employees
where salary > 14000;  -- 14000이상만 들고와라 

select * 
from employees
where last_name = 'King';  -- 14000이상만 들고와라 

select * 
from employees
where hire_date < '2002/06/10';

--예제 1) employees 테이블에서 employee_id 가 100인 직원 정보를 출력하세요.
Select * 
from employees
where employee_id= 100;
--예제 2) employees 테이블에서 first_name 이 David 인 직원 정보를 출력하세요.
Select * 
from employees
where first_name= 'David';
--예제 3) employees 테이블에서 employee_id가 105 이하인 직원 정보를 출력하세요.
Select * 
from employees
where employee_id < 105;
--예제 4) job_history 테이블에서 start_date 가 2006년 3월 3일 이후인 정보를 출력.
Select * 
from JOB_HISTORY
where start_date >  '2006/03/03';
--예제 5) departments 테이블에서 location_id 가 1700 이 아닌 모든 부서를 출력하라.
Select * 
from departments
where location_id !=  1700;

-- 논리 연산자
SELECT last_name 이름, department_id 부서번호, salary 월급
from employees
Where (department_id = 60 OR department_id = 80) 
And salary >10000;


--예제 1) employees 테이블에서 salary가 4000보다 크면서 , job_id가 IT_PROG인 employee들을 조회하세요. 

Select * 
from employees
WHERE SALARY > 4000 AND JOB_ID ='IT_PROG';

--예제 2) employees 테이블에서 우선 salary는 4000보다 커야되고  job_id는 IT_PROG거나(OR) FI_ACCOUNT인 경우를 조회하세요.
Select * 
from employees
WHERE SALARY > 4000 AND (JOB_ID ='IT_PROG' OR JOB_ID ='FI_ACCOUNT' );


---- IN 연산자 : () 안의 값과 같을때 OR로 연결
SELECT * 
FROM employees
WHERE salary IN ( 4000, 3000, 2700 );
--SELECT * FROM employees WHERE salary = 4000 OR salary = 3000 OR salary = 2700 와 같은 문법
SELECT * 
FROM employees
WHERE salary NOT IN ( 4000, 3000, 2700 );

--예제 ) employees 테이블에서 salary가 10000, 17000, 24000인 직원 정보를 출력하세요.
SELECT * 
FROM employees
WHERE salary IN ( 10000, 17000, 24000 );

--예제) employees 테이블에서 department_ID가  30 , 50, 80, 100, 110 이 아닌 직원 정보를 출력하세요.
SELECT * 
FROM employees
WHERE department_ID IN ( 30 , 50, 80, 100, 110 );

--Betwwen 연산자 사이값
SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;
--SELECT * FROM employees WHERE salary >= 9000 AND salary <= 10000 
--예제 ) employees 테이블에서 salary가 10,000 이상이고 20,000 이하인 직원 정보를 출력하세요.
SELECT * 
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--예제) employees 테이블에서 hire_date 가 2004년 1월 1일 부터 2004년 12월 30일 사이인 직원 정보를 출력하세요.
SELECT * 
FROM employees
WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/30';

--예제) employees 테이블에서 salary가 7000 미만이거나, 17000 보다 많은 사원을 출력하라.
SELECT * 
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

-- Like 연산자 %를 같이 사용해서 문자열 검색;
SELECT * FROM employees WHERE last_name Like 'B%'; -- 대문자B로 시작하는 문자들 들고오기
SELECT * FROM employees WHERE last_name Like '%b%'; -- 문자열 중간에 b가 포함하는 문자들 들고오기
SELECT * FROM employees WHERE last_name Like '_____%y'; -- _언더바갯수 이상 y를 포함한 문자들 들고오기

--예제 1 )  employees 테이블에서 job_id 값이 AD를 포함하는 모든  데이터를 조회하세요.
SELECT * FROM employees WHERE job_id Like '%AD%';

--예제 2) employees 테이블에서 job_id 가 AD를 포함하면서 AD 뒤에 따라오는 문자열이 3자리인 데이터 값을 갖는 직원 정보를 조회하세요.
SELECT * FROM employees WHERE job_id Like 'AD___' ;   -- 딱 3자리만 들고옴
SELECT * FROM employees WHERE job_id Like 'AD%___'  ;  --  3자리 이상 들고옴

--예제 3) employees 테이블에서 전화번호 뒷자리가 1234로 끝나는 직원 정보를 조회하세요
SELECT * FROM employees WHERE phone_number Like '%1234';

--예제 4) employees 테이블에서 전화번호에 3이 들어가지 않으면서 전화번호 끝자리가 9로 끝나는 직원 정보를 출력하시오.
SELECT * FROM employees WHERE phone_number NOT Like '%3%' AND phone_number LIKE '%9';

--예제 5) employees 테이블에서 job_id 에 MGR 을 포함하거나 , ASST  를 포함하는 직원 정보를 조회하세요.
SELECT * FROM employees WHERE job_id Like '%MGR%' or job_id Like '%ASST%';

SELECT * From employees where commission_pct is null;
SELECT * From employees where commission_pct is not null;

-- 예제 ) employees 테이블에서 manager_id가 null 값인 직원 정보를 출력해 보세요.
SELECT * From employees where manager_id is null;


-- ORDER BY 절 열의 오름차순 내림차순 정렬, ORDER은 제일 마지막에 삽입.
SELECT * FROM employees ORDER BY employee_id DESC;

-- 정렬열이 2개 이상일때 첫번째열 정렬 -> 두번째열 정렬
SELECT department_id, employee_id, first_name, last_name FROM employees ORDER BY department_id, employee_id DESC;

-- q별칭으로 정렬
SELECT department_id, last_name, salary*12 연봉 FROM employees ORDER BY 연봉 DESC;
-- 열의 순서로
SELECT department_id, last_name, salary*12 연봉 FROM employees ORDER BY 3;

--예제 1) employees 테이블에서 employee_id, first_name, last_name을 출력하고 employee_id를 기준으로 내림차순 정렬하세요.
SELECT employee_id, first_name, last_name FROM employees ORDER BY employee_id;

--예제 2) employees 테이블에서 job_id 에 CLERK 란 단어가 들어가는 직원들의 salary 가 높은 순으로 정렬하세요.
SELECT * FROM employees WHERE job_id LIKE '%CLERK%' ORDER BY SALARY DESC;

--예제 3) employees 테이블에서 employee_id (직원번호)가 120에서 150번까지 직원을 부서번호(department_id)가 큰순으로 정렬하고 부서번호가 같을시 월급(salary)이 큰순으로 정렬하라.
SELECT * FROM employees WHERE employee_id Between 120 AND 150 
ORDER BY department_id DESC , salary desc;
