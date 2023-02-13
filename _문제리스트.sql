-- SCOTTT
--[수행준거 1.1 생성된 테이블의 목록, 테이블의 구조와 제약조건을 파악하기 위해 데이터사전을 조회하는 명령문을 작성할 수 있다.]
--1. EMP 테이블의 구성(열의 이름, 널 사용가능 및 데이터타입)을 확인하는 명령문을 작성하세요.
DESC EMP;

--[수행준거 1.2 한 개의 테이블에 대해 데이터를 삽입, 수정, 삭제하고 행을 조회하는 DML 명령문을 작성할 수 있다.]
--2. EMP 테이블에서 사원이름(ENAME)열에 데이터가 대문자이든 소문자이든 상관없이 SMITH인 사원 정보를 조회하는 SQL문을 작성하세요.
--(힌트: UPPER 함수로 WHERE 절에 사원 이름을 대문자로 만들어서 조건 검색)
SELECT * 
FROM EMP
WHERE UPPER(ENAME) = 'SMITH';

--[수행준거 1.2 조인, 서브쿼리, 집합연산자를 사용하여 두 개 이상의 테이블로부터 데이터를 조회하는 DML(Data Manipulation Language)명령문을 작성할 수 있다]
--3. EMP 테이블에서 사원 이름이 4글자 이하인 사원 정보를 조회하는 SQL문을 작성하세요.

SELECT * 
FROM EMP
WHERE LENGTH(ENAME)<=4;

--[수행준거 1.2 조인, 서브쿼리, 집합연산자를 사용하여 두 개 이상의 테이블로부터 데이터를 조회하는 DML(Data Manipulation Language)명령문을 작성할 수 있다]
--4. EMP 테이블에서 중복을 제외한 직책(JOB)의 개수를 출력하는 SQL문을 작성하세요.
--(힌트 :DISTINCT 와 COUNT 함수를 이용하여 중복안된 열의 행의 개수를 카운트 )

SELECT
COUNT(DISTINCT JOB)
FROM EMP;


--[수행준거 1.2 조인, 서브쿼리, 집합연산자를 사용하여 두 개 이상의 테이블로부터 데이터를 조회하는 DML(Data Manipulation Language)명령문을 작성할 수 있다]
--5. EMP 테이블에서 MARTIN보다 급여가 낮은 사원정보를 출력하는 SQL문을 작성하세요.
--(서브쿼리 사용) 

SELECT * 
FROM 
    EMP 
WHERE 
    SAL < 
    (SELECT
            SAL
        FROM 
            EMP
        WHERE 
            ENAME='MARTIN');




--[수행준거 1.2 조인, 서브쿼리, 집합연산자를 사용하여 두 개 이상의 테이블로부터 데이터를 조회하는 DML(Data Manipulation Language)명령문을 작성할 수 있다]
--6. EMP 테이블에서 30번 부서 사원들의 최대 급여보다 많은 급여를 받는 사원정보를 출력하는 SQL문을 작성하세요. (서브쿼리)

SELECT * 
FROM 
    EMP 
WHERE 
    SAL > 
    (SELECT
            MAX(SAL)
        FROM 
            EMP
        WHERE 
            DEPTNO=30);


--[수행준거 1.2 조인, 서브쿼리, 집합연산자를 사용하여 두 개 이상의 테이블로부터 데이터를 조회하는 DML(Data Manipulation Language)명령문을 작성할 수 있다]
--7. EMP, SALGRADE 테이블을 비동등 조인하여 사원의 급여등급이 3등급이고 30번 부서 소속인 사원들의 모든 정보를 출력하는 SQL문을 작성하세요.
SELECT * FROM 
        (
        SELECT * 
        FROM
            EMP
        JOIN
            SALGRADE
        ON SAL 
            BETWEEN LOSAL AND HISAL
        ) 
WHERE GRADE = 3 AND DEPTNO = 30;

--[수행준거 1.4 업무단위인 트랜잭션의 완료와 취소를 위한 DCL 명령문을 작성할 수 있다.]
--8. 테이블에 한 행만 삭제해야 하는데 잘못해서 전체 행을 삭제해 버렸다. 이때 트랜잭션을 취소하는 명령어를 작성하세요.

ROLLBACK;

--[수행준거 1.2 조인, 서브쿼리, 집합연산자를 사용하여 두 개 이상의 테이블로부터 데이터를 조회하는 DML(Data Manipulation Language)명령문을 작성할 수 있다]
--9. EMP 테이블에서 NVL 함수를 사용하여 사원별 사원번호(EMPNO), 사원이름(ENAME), 월급(SAL), 추가수당(COMM), 그리고 1년치 연봉을 구해서 ANNSAL 열로 출력하는 SQL문을 작성하세요.
--(힌트 : 1년 연봉은 월급*12 + 추가수당 이다. )
SELECT
    EMPNO 사원번호, ENAME 사원이름, SAL 월급, NVL(COMM,0) 추가수당, (12*SAL+ NVL(COMM,0))ANNSAL 
FROM 
    EMP;


--
--[수행준거 1.2 조인, 서브쿼리, 집합연산자를 사용하여 두 개 이상의 테이블로부터 데이터를 조회하는 DML(Data Manipulation Language)명령문을 작성할 수 있다]
--10. EMP와 DEPT 테이블에서 월급(SAL)을 3000 이상 받는 사원들의 사원이름과 소속 부서이름을 출력하는 SQL문을 작성하세요. (결과를 캡쳐하여 붙여 넣습니다.)


SELECT * 
FROM 
    (
    SELECT * 
    FROM 
    EMP e
    JOIN DEPT d
    ON e.DEPTNO = d.DEPTNO
    )
WHERE
    SAL >= 3000;


