-- 조인(JOIN)
SELECT employee_id, first_name, job_id, job_title
FROM employees
NATURAL JOIN jobs;

-- ON 을 사용 ,기본 조인   // 특수문자 들어갈시 "(){}" 표현
SELECT e.employee_id 직원번호, e.last_name 이름, d.department_name 부서이름,
        d.department_id "부서번호(공통)"
FROM employees e JOIN departments d
    ON e.department_id = d.department_id;

-- 3개의 테이블 JOIN
SELECT employee_id, city, department_name
FROM employees e
JOIN departments d 
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;
    
-- WHERE 사용..
SELECT e.employee_id 직원번호, e.last_name 이름, d.department_name 부서이름,
        d.department_id "부서번호(공통)"
FROM employees e JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id=50 AND e.salary > 5000;    


--예제)부서명(department_name) , 시티명(city), 국가명(country_name)을 나타내는 테이블을 출력합니다.
--테이블들은 countries 와 departments와 locations를 조인 합니다. 
--조건은, 시티가 'Seattle' 혹은 'London' 이어야 하고 국가명은 앞쪽에 'United' 가 들어가야 합니다.
SELECT department_name 부서명, city 시티명, country_name 국가명
FROM locations l 
JOIN departments d ON l.location_id = d.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE (l.city='Seattle' OR l.city='London') AND c.country_name LIKE 'United%';


--- 자체조인
SELECT e.last_name 직원이름, m.last_name 매니저
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;
    
--외부조인
--- 기본조인 (부서번호가 null인 직원은 제외했음)
SELECT e.employee_id 직원번호, e.last_name 이름, d.department_name 부서이름,
        d.department_id "부서번호(공통)"
FROM employees e JOIN departments d
    ON e.department_id = d.department_id;
--    레프트 외부 조인, 직원은 있지만 department_id가 없어도 조인됨.
SELECT e.employee_id 직원번호, e.last_name 이름, d.department_name 부서이름,
        d.department_id "부서번호(공통)"
FROM employees e LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
    ORDER BY d.department_id DESC;
--    라이트 외부 조인, 부서테이블에 있지만 직원은 없는 부서도 전부 출력
SELECT e.employee_id 직원번호, e.last_name 이름, d.department_name 부서이름,
        d.department_id "부서번호(공통)"
FROM employees e RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id
    ORDER BY d.department_id DESC;
    
--    FULL 외부 조인, 부서테이블에 있지만 직원은 없는 부서도 전부 출력
SELECT e.employee_id 직원번호, e.last_name 이름, d.department_name 부서이름,
        d.department_id "부서번호(공통)"
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;    

-- 예제) countries , locations 테이블을 조인하여 아래와 같이 출력하시오.
--(지역번호로 DESC 정렬)
--country_name 국가, country_id 국가번호,
--location_id 지역번호, city 도시
SELECT c.country_name 국가, c.country_id 국가번호,
l.location_id 지역번호, l.city 도시 
FROM countries c LEFT OUTER JOIN locations l
    ON c.country_id = l.country_id
    ORDER BY l.location_id DESC;
    
    
--   크로스 조인 테이블1과 테이블2를 교차 조인하면 각 테이블의 행의 수를 곱한 것과 같은 개수의 결과 행이 생긴다.
-- 예제 ) countries , regions 테이블을 크로스 조인하여 아래와 같이  각각의 테이블의     25행 X 4행 => 100행의 결과가 나오도록 하세요.
SELECT c.country_name 국가이름, r.region_name 지역이름 
FROM countries c 
CROSS JOIN regions r;