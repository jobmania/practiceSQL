
select * from employees;
select * from departments;
select * from jobs ;
select * from LOCATIONS;

-- 1. 부서별 직원수
SELECT d.department_name, count(*)EMP_COUNT
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY EMP_COUNT DESC; 

--2. 부서별 평균 급여(salary)
SELECT d.department_name, ROUND(AVG(e.salary)) AVG_SAL
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY AVG_SAL DESC; 

--3. 직책별 평균 급여 (평균급여 기준 상위 7개 직책만)  /// 상위 n객 뽑ㄱ ㅣ.
SELECT * FROM
    (SELECT j.job_title, ROUND(AVG(e.salary)) 돈
    FROM (employees e JOIN jobs j ON j.job_id = e.job_id)
    GROUP BY j.job_title
    ORDER BY 돈 DESC)
WHERE ROWNUM <= 7;
-- 4. 자신의 매니저 보다 더 많은 급여를 받는 사람 목록 e.employee_id, e.last_name, e.salary
SELECT e.employee_id, e.last_name, e.salary
FROM employees e JOIN employees m
    ON e.manager_id = m.employee_id
WHERE (e.salary > m.salary);

-- 5. Job title이 Sales Representative인 직원 중에서, 급여가 9,000 ~ 10,000 인 직원들의 이름과 급여를 출력하시오.
SELECT FIRST_NAME||' '||LAST_NAME, salary
FROM(SELECT *
    FROM employees e JOIN jobs j
    ON e.job_id= j.job_id
    WHERE j.job_title = 'Sales Representative')
WHERE salary BETWEEN 9000 AND 10000
ORDER BY salary DESC;

-- 6. 급여 총합이 가장 높은 직급순으로 급여 총합을 출력하시오. (단, 급여총합이 30,000 이상인 직급만 출력할 것)
SELECT * FROM(SELECT j.job_title 이름 , SUM(salary)돈
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title 
ORDER BY 돈 DESC ) WHERE 돈 >=30000;
 
 
-- 7. 각 도시별 평균 연봉(급여)가 높은순으로 상위 3개 도시를 출력하시오. 삼중조인.
-- where을 사용해서 조인 시킴.
SELECT * FROM (
    SELECT city, ROUND(AVG(salary))
    FROM employees e, departments d, locations l
    where e.department_id=d.department_id
    AND d.location_id=l.location_id
    GROUP BY city
    ORDER BY AVG(salary) DESC)
WHERE ROWNUM <= 3;


-- 8)직책(Job Title)이 'Sales Manager'인 사원들의 입사년도(hire_date)별 평균 급여를 출력하시오. 
--출력 시 년도를 기준으로 오름차순 정렬하시오.
SELECT hire_date 날짜, ROUND(AVG(salary)) 평균금액 FROM (Select salary, TO_CHAR(hire_date,'YYYY') hire_date, job_id  FROM employees )e 
JOIN (SELECT * FROM jobs WHERE job_title ='Sales Manager')j ON e.job_id = j.job_id
GROUP BY hire_date
ORDER BY hire_date;


--9)각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
--평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 직원수를 출력하시오. 
--단, 도시에 근무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.
select * from locations l, departments d, employees e
        where e.department_id=d.department_id
        AND d.location_id=l.location_id

;




