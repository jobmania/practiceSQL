-- 단일행 함수

-- 1.문자형  함수 

-- 대소문자 함수  UPPER LOWER INITCAP(앞글자만 대문자) , DUAL은 더미테이블 . 
SELECT UPPER('SQL Course'), Lower('SQL Course'), Initcap('SQL Course')
From dual;  

-- 문자 조작 함수 
SELECT 
    SUBSTR('ABCDEFG',3,4), -- 3번째 문자열부터 4개까지.dummy
    Length('ABCDEFG'),      
    INSTR('ABCDEFG','D')
    FROM DUAL;
--    문자열 앞뒤 공백 X
SELECT TRIM('   2    가나다    2   '), '    아아아    ' From Dual; 

-- 예제 1 .
SELECT employee_id, last_name
FROM employees
WHERE LOWER(last_name) = 'higgins';

-- 예제 2.
SELECT last_name, CONCAT('직업명이 ', job_id) AS 직업명
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP' ;

-- 문자열 가장 끝 문자 (-1은 문자열의 마지막 문자)
SELECT last_name, SUBSTR(last_name, -1, 1)
FROM employees;

-- 문자열 바꾸기
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

-- 예제) employees 테이블에서 last_name을 소문자와 대문자로 각각 출력하고, email의 첫 번째 문자는 대문자로 출력하세요.
SELECT last_name, UPPER(last_name), LOWER(last_name),email, INITCAP(email)
FROM employees;


-- 예제)employees 테이블에서 job_id 데이터 값의 첫째 자리부터 시작해서 두 개의 문자를 출력하세요.
SELECT job_id AS 직업명,
SUBSTR(job_id,1,2) AS 앞의두개
FROM employees;


-- 2. 숫자형 함수
SELECT 
    ROUND(15.232,1), -- 반올림 15.2
    ROUND(15.242,0),  -- 반올림 15
    ROUND(15.242,-1)  -- 반올림 20
FROM dual;

SELECT employee_id 짝수번째, last_name
FROM employees
WHERE MOD(employee_id, 2) =0
ORDER BY employee_id;

-- 예제 ) employees 테이블에서 salary를 30으로 나눈 후 나눈 값의 결과를 반올림하여  정수, 소수점 첫째 자리, 10의 자리로 나타내시오.
SELECT 
SALARY,
ROUND(salary/30,1) 소숫점1, 
ROUND(salary/30,0) 정수,
ROUND(salary/30,-1) 십자리 
FROM employees
ORDER BY salary DESC;

-- 3. 날짜형   함수
SELECT sysdate from dual;  -- 현재날짜.

SELECT 
    sysdate 현재날짜, 
    ROUND(sysdate, 'DD')일,
    ROUND(sysdate, 'MM')월반올림,
    ROUND(sysdate, 'YYYY')년도반올림,
    MONTHS_BETWEEN('2022/01/01','2021/01/01') 개월차이,
    ADD_MONTHS('2022/01/01',2) 개월추가,
    NEXT_DAY('2022/01/01',2) 날짜추가
    FROM dual;

-- 날짜에 더하기 빼기 하기
SELECT sysdate 오늘날짜, sysdate - 1 어제, sysdate + 1 내일,
       sysdate + 3/24 시간더하기     
FROM dual;

-- 요일
SELECT employee_id, hire_date,
        ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)) 근무월수,
       ADD_MONTHS(hire_date, 6) "6개월 추가",
       NEXT_DAY(hire_date, 6) Next_day, 
       --1(일), 2(월), 3(화), 4(수), 5(목), 6(금), 7(토) 
       LAST_DAY(hire_date) Last_day
       --달의 마지막 날
FROM employees
WHERE MONTHS_BETWEEN(SYSDATE,hire_date) < 500;


--예제) employees 테이블에서 department_id가 100인 직원에 대해 오늘 날짜, hire_date, 오늘 날짜와 hire_date 사이의 개월 수를 출력하세요.
SELECT 
    sysdate 오늘날짜,
    hire_date,
    TRUNC(MONTHS_BETWEEN(sysdate, hire_date)) 개월차이
FROM employees
WHERE department_id=100;

-- 예제) employees 테이블에서 employee_id가 100과 106 사이인 직원의 hire_date에 3개월을 더한 값, hire_date에 3개월을 뺀 값을 출력하세요.

SELECT 
    hire_date,
    ADD_MONTHS(hire_date ,3) 개월추가,
    ADD_MONTHS(hire_date ,-3) 개월차이
FROM employees
WHERE employee_id between 100 AND 106;

-- 변환형 함수
-- 숫자 -> 문자로 변환
SELECT 
    TO_CHAR( 12345678 ,'999,999,999') 콤마형식,
    TO_CHAR(123.45678,'999,999,999.99') period,
    TO_CHAR(12345678,'$999,999,999') dollar,
    TO_CHAR(12345678,'L999,999,999') local, --한국은 원화표시
    TO_CHAR(123,'XXXX') hexadecimal 
FROM dual;

-- 날자 -> 문자열로 변환 (형식타입이 중요)
SELECT
    TO_CHAR(sysdate, 'YYYY/MM/DD') 날짜표시,
    TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS') 시간표시
FROM DUAL;    


-- 365일 중 몇 일째인지 조회
SELECT TO_CHAR(SYSDATE, 'DDD') "Day of year" 
FROM DUAL;
 
-- 53주 중 몇 주차 인지 조회
SELECT TO_CHAR(SYSDATE, 'IW') "Week of year" 
FROM DUAL;
 
-- 해당 월의 이름 조회
SELECT TO_CHAR(SYSDATE, 'MONTH') "Name of month" 
FROM DUAL;

--예제) employees 테이블에서 department_id 가 100인 사원들의 입사일을 이용하여 아래와 같이 나타내어라. 날짜 형식  ' 월 / 년도 '

SELECT 
    employee_id,
    TO_CHAR(hire_date, 'MM/YY') 입사일   
FROM employees
WHERE department_id=100;

-- 예제) employees 테이블에서 salary가 10000달러가 넘는 사원들의 이름과 월급을 월급이 많은순으로 나타내어라.

SELECT 
    employee_id,
    first_name||' '|| last_name 이름,
    TO_CHAR(salary,'999,999,999') money, -- 9999를 써야됨.
    TO_CHAR(salary,'$999,999,999') dollar
FROM employees
WHERE salary>10000
ORDER BY salary DESC;

-- DATE 타입으로 변환하는 예제
SELECT TO_DATE('2011-01-01','YYYY-MM-DD') 
FROM DUAL;

-- 문자를 숫자로 변환하는 간단한 예제이다.
SELECT TO_NUMBER('9910616') 
FROM DUAL; 


-- NULL 관련 함수.. 
-- NVL(값 , 0)/ 만약 값이 NULL이면 0으로 변환.
SELECT last_name 이름, NVL(manager_id, 0 ) 매니저
FROM employees WHERE last_name = 'King';

SELECT NULL + 100 from dual; --  null 나옴..

-- NVL2(값 , 첫, 두 )/ 만약 값이 NULL아니면 첫번째 NULL이면 두번째
SELECT last_name 이름, NVL2(manager_id, 1, 0) 매니저
FROM employees WHERE last_name = 'King';

-- 예제) employees 테이블에서 아래와 같이 이름, 월급(salary),커미션(commission_pct)를  NVL 함수사용, 연봉은 ( 월급*12) + (월급*12*커미션) 이다.
-- (커미션이 없는 사람은 연봉*12로 계산되고, 있는 사람은 ( 월급*12) + (월급*12*커미션) )
SELECT 
    last_name 이름,
    NVL(commission_pct, 0) 커미션,
    salary 월급,
    (salary*12) + (salary*12* NVL(commission_pct, 0)) 연봉
FROM employees 
ORDER BY salary DESC;


--예제) 위의 예제에 더하여 연봉계산은 NVL2 함수를 사용하여 커미션이 있을때와 없을때 계산방법을 나타냅니다
SELECT 
    last_name 이름,
    NVL(commission_pct, 0) 커미션,
    salary 월급,
    (salary*12) + (salary*12* NVL2(commission_pct, commission_pct, 0)) 연봉,
    NVL2(commission_pct, '보너스 추가', '보너스없음') 연봉계산
FROM employees 
ORDER BY salary DESC;

-- DECODE 함수
SELECT last_name 이름, job_id, salary,
    DECODE(job_id, 'IT_PROG', salary * 1.10,
                    'ST_CLERK', salary * 1.15,
                    'SA_REP', salary * 1.20,
                            salary) "수정월급"
FROM employees;

-- 예제) employees 테이블에서 DECODE 함수를 이용해서 월급에 따른 세율을 나타내세요. TRUNC( salary / 2000 ) 의 값이 0일때 0%, 1일때  9%, ...
SELECT last_name 이름, job_id, salary,
    DECODE(TRUNC(salary/2000),  0, 0,
                                1,0.09,
                                2,0.2,
                                3,0.3,
                                4,0.4,
                                5,0.42,
                                6,0.44,
                                  0.45 ) "세율"
FROM employees;


-- CASE 사용
SELECT last_name 이름, job_id, salary,
   CASE job_id  WHEN 'IT_PROG'   THEN salary * 1.10
                WHEN 'ST_CLERK'  THEN salary * 1.15
                WHEN 'SA_REP'    THEN salary * 1.20
                ELSE                  salary  
   END "월급 수정"
FROM employees;


SELECT last_name 이름, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
          WHEN salary<10000  THEN 'Medium'
          WHEN salary<20000  THEN 'Good'
          ELSE                    'Excellent'  
    END "급여 수준"
FROM employees;


-- 예제)employees 테이블에서 job_id가 IT_PROG라면 employee_id, first_name, last_name, salary를 출력하되
-- salary가 9000 이상이면 ‘상위급여’, 6000과 8999 사이면 ‘중위급여’, 그 외는 ‘하위급여’라고 출력하세요.
SELECT employee_id, last_name 이름, job_id, salary,
    CASE  WHEN salary>9000   THEN '상위급여'
          WHEN salary>5999  THEN '중위급여'
          ELSE                    '하위급여'  
    END "급여 수준"
FROM employees
WHERE job_id = 'IT_PROG';

