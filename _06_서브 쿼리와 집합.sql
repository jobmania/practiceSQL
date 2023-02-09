-- 서브쿼리

-- Popp직원보다 고용일이 최근(이후)에 고용한 사람
-- 주의점 : 단일행 서브쿼리를 사용할때는 결과가 비교하는 데이터와 같고 하나만 출력되어야함
SELECT last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date > (SELECT email FROM employees WHERE last_name = 'Popp');

-- 여러개의 서브쿼리
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE job_id= (SELECT job_id
                    FROM   employees
                    WHERE last_name = 'Chen')
AND salary > (SELECT salary
                    FROM   employees
                    WHERE last_name = 'Chen');
                    
-- 그룹 함수의 결과를 서브쿼리로 사용
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- HAVING 조건절에도 사용..
SELECT department_id 부서번호, MIN(salary) 최저급여
FROM employees
GROUP BY department_id
HAVING  MIN(salary) >    
                        ( SELECT min(salary)
                          FROM employees
                          WHERE department_id = 50);
                          
-- 예제) 사원 'Abel'(last_name) 보다 급여가 많은 사원의 last_name , salary 를 나타내어라.(서브쿼리 사용)
SELECT last_name 이름, salary 급여
FROM employees
WHERE salary > ( SELECT salary
                          FROM employees
                          WHERE last_name = 'Abel');
-- 예제) 'Bull'란 last_name을 가진 사원의 부서에서 Bull보다 높은 급여를 받는 사원들을 출력하라.  (서브쿼리 사용)
SELECT employee_id 번호, last_name 이름, salary 급여, department_id 부서번호
FROM employees
WHERE department_id = ( SELECT department_id
                          FROM employees
                          WHERE last_name = 'Bull')
AND   salary > ( SELECT salary
                          FROM employees
                          WHERE last_name = 'Bull');
--예제) 'Russell'이란 last_name의 직원번호를 manager_id로 가지는 직원들의 last_name, salary, manager_id를 출력하시오.
SELECT last_name 이름 , salary 급여 , manager_id 매니저번호
FROM employees
WHERE manager_id = ( SELECT employee_id
                          FROM employees
                          WHERE last_name = 'Russell');

-- 예제) jobs 테이블에 job_title이 'Stock Manager' 의  job_id를 가진 직원들의 정보를 Employees 테이블에서 찾아서 출력하시오.
SELECT *
FROM employees
WHERE job_id = ( SELECT job_id
                          FROM jobs
                          WHERE job_title = 'Stock Manager');

-- 다중행 서브쿼리에서는 바로 = >< 비교를 할수 없음.
-- IN은 값이 하나라도 같으면 검색됨.
SELECT MIN(salary)
FROM employees
GROUP BY department_id;

SELECT employee_id, last_name, department_id, salary
FROM employees
WHERE salary  IN  -- IN 연산자 IN 연산자는 하나의 컬럼이 여러개의 '=' 조건을 가지는 경우에 사용
                ( SELECT MIN(salary)
                  FROM employees
                  GROUP BY department_id);
            
-- ANY도 값이 하나라도 맞으면 검색됨. 직종이 IT_PROG 이 아니면서  IT_PROG 인 사원들의 급여보다 작을때, 이때 ANY는 서브쿼리의 멀티열중 어느 하나라도 만족하면 된다
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG'
ORDER BY salary DESC;

-- ALL 연산자 / 직종이 IT_PROG 이 아니면서  IT_PROG 인 사원들의 급여보다 작을때, 이때 ALL은 서브쿼리의 멀티열 모두를  만족시켜야 한다
 SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG';

-- 예제 1) 부서번호(department_id)가  20번인 직원들의 매니저아이디(manager_id)와 같은 매니저를 가지는  직원들을 출력하라. (단 20번 부서의 직원은 제외!)
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE manager_id  IN
                    ( SELECT manager_id
                      FROM employees
                      WHERE department_id = 20)
AND department_id != 20 ;

-- 예제 2) job_id가  'ST_MAN'인 직원들중 어느 한직원 보다도 급여가 작은  직원들을 출력하라. (ANY)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'ST_MAN');

-- 예제3 )직책이 'IT_PROG' 인 직원들 보다 급여가 작은 직원들을 출력하시오.(ALL)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG');
                      
-- 다중열 , 서브쿼리 열이 2개 이상
-- First Name 이 'Bruce'인 직원과 매니저(상사)와 직종이 같은 직원을 조회
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN  (SELECT manager_id, job_id
                                FROM employees
                                WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';
-- 각 부서별로 최소 급여를 받는 사원의 부서번호, 사원번호, 이름, 급여 정보를 검색한다.
select department_id 부서번호, employee_id 사원번호, first_name, salary
from employees
where (department_id, salary) in  (select department_id, min(salary)
                                   from employees
                                   group by department_id)
order by department_id;

-- 예제) employees 테이블에서 job_id별로 가장 낮은 salary가 얼마인지 찾아보고, 
--찾아낸 job_id별 salary에 해당하는 직원의 first_name, job_id, salary, department_id 를 출력하시오. (salary 내림차순 정렬)
select first_name, job_id,  salary, department_id 부서번호 
from employees
where ( job_id, salary) in  (select job_id, min(salary)
                                   from employees
                                   group by job_id)
order by salary desc;


--집합
-- UNION 합집함 : 중복을 제거한다. (결과줄수 115)
select employee_id, job_id  -- 107
from employees
union
select employee_id, job_id  -- 10
from job_history;

-- UNION ALL 중복된 결과 삭제 X
select employee_id, job_id  -- 107
from employees
union ALL
select employee_id, job_id  -- 10
from job_history;

--INTERSECT를 이용한 교집합
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

--  --MINUS를 이용한 차집합 교집합 제거.
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

-- 예제) ?employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을 UNION 연산자를 이용해 합쳐 보세요.
select department_id -- 28
from employees
union
select department_id
from departments;
-- 예제) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을 UNION ALL연산자를 이용해 합쳐 보세요.
select department_id --- 134
from employees
union all
select department_id
from departments;
-- 예제) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합의 교집합을 INTERSECT 연산자를 이용해 출력해 보세요.
select department_id --- 134
from employees
INTERSECT
select department_id
from departments;
-- 예제) departments 테이블의 department_id 집합에서 employees 테이블의 department_id 집합을 MINUS 연산자를 이용해 빼 보세요.

select department_id
from departments
minus
select department_id --- 134
from employees;

