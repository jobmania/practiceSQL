-- 그룹함수(집계함수)
SELECT ROUND(AVG(salary)) 평균값, MAX(salary) 최고월급, MIN(salary) 최소값,
        SUM(Salary)  합계, COUNT(salary)
FROM employees
WHERE job_id LIKE 'IT_PROG';

SELECT * FROM employees where job_id = 'IT_PROG';

---- 널값은 제외하고 행의 숫자를 세지만, *일때는 NULL값도 포함한다.
SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(*)
FROM employees;

----
SELECT COUNT(commission_pct), AVG(commission_pct)
From employees;

---- Group By활용
SELECT department_id 부서명, ROUND(AVG(salary)) 평균급여,
        COUNT(*) 직원수,
       TO_CHAR(ROUND(AVG(salary)), '$99,999') 달러표시
FROM employees 
GROUP BY department_id  -- 부서별로
Order By department_id;

SELECT *
FROM employees;


----예제 1)  부서별 사원수, 최대급여, 최소급여, 급여합계, 평균급여를 급여합계 큰순으로 조회
SELECT department_id 부서이름, Count(*)사원수, MAX(salary) 최대급여, MIN(salary) 최소급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY SUM(salary) DESC;

-- 예제 2)  부서별, 직업별(job_id) 별로 그룹을 지어 salary 합계와 그룹별 직원의 숫자를 출력하라.
SELECT department_id 부서이름,  job_id 직업이름, SUM(salary) 급여합, Count(*) 직원수
FROM employees
GROUP BY department_id, job_id
Order By department_id;

--- 예제 3) 부서별로 최고 월급을 뽑아서 평균을 내고, 최저월급 또한 평균을 내어 출력하라
SELECT ROUND(AVG(MAX(salary))) 최대, ROUND(AVG(MIN(salary))) 최소
FROM employees
GROUP BY department_id ;

--- HAVING .
SELECT department_id 부서명, COUNT(*) 사원수
FROM employees
GROUP BY departm
ent_id
HAVING COUNT(*) > 5;   

-- 예제 1) 아래 예제는 직종별 평균 월급이 $10000을 초과하는 직종에 대해서 job_id와
-- 월급여 합계를 조회하는 예이다. 단 어카운트 매니저( AC_MGR )은 제외하고 월 급여 합계로 내림차순 정렬하시오.
SELECT job_id 직종, SUM(salary) 급여합
FROM employees
WHERE job_id !='AC_MGR'
GROUP BY job_id
HAVING AVG(salary) > 10000
ORDER BY SUM(salary) DESC;  

--예제 2) 부서번호 40을 제외한 부서별 평균 급여가 7000 이하인 부서들의 평균 급여를 출력
SELECT department_id 부서, Round(AVG(salary)) 급여합
FROM employees
WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary) <= 7000
ORDER BY AVG(salary)DESC;

--예제 3) 직종별로 월급(salary)의 합계가 13000 이상인 직종을 출력하라. 
--급여총액으로 내림차순으로 정렬하고, 직종(job_id)에 'REP' 들어있는 직종은 제외한다.

SELECT  job_id 직종, SUM(salary) 급여합
FROM employees
WHERE job_id NOT Like '%REP%'
GROUP BY  job_id
HAVING SUM(salary) >= 13000
ORDER BY SUM(salary)DESC

