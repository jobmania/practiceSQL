-- 스콧 SCOTT 연습문제 
SELECT * FROM dept;
SELECT * FROM bonus;
SELECT * FROM emp;
SELECT * FROM salgrade;

-- 1. 문제) 부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라
SELECT e.empno,e.ename,  e.sal FROM emp e
WHERE e.deptno = 10;

--2. 문제) 사원번호가 7369인 사람 중 이름, 입사일, 부서번호를 출력하라.
SELECT e.ename,  e.hiredate, e.deptno FROM emp e
WHERE e.empno = 7369;

-- 3. 문제) 이름이 ALLEN인 사람의 모든 정보를 출력하라.
SELECT * FROM emp e
WHERE e.ename = 'ALLEN';

--4. 문제) 입사일이 81/02/20인 사원의 이름, 부서번호, 월급을 출력하라.
SELECT e.ename, e.deptno, e.sal FROM emp e
WHERE e.hiredate = '81/02/20';

--5. 문제) 직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라.
SELECT * FROM emp e
WHERE e.job != 'MANAGER';

--6. 입사일이 81/04/02 이후에 입사한 사원의 정보를 출력하라. 
SELECT * FROM emp e
WHERE e.hiredate >= '81/04/02';  -- // '<>' '!=' 둘다 부등의미.

--7. 문제) 급여가 $800 이상인 사람의 이름, 급여, 부서번호를 출력하라.
SELECT e.ename, e.sal, e.deptno FROM emp e
WHERE e.sal >= 800;

-- 8. 문제) 부서번호가 20번 이상인 사원의 모든 정보를 출력하라.
SELECT * FROM emp e
WHERE e.deptno >= 20;

--9. 문제) 이름이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든 정보를 출력하라.
--(문자열 비교시 알파벳순으로 철자 비교 예 'B'>'A')
SELECT * FROM emp e
WHERE e.ename >'K%';

-- 10. 문제) 입사일이 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라.
SELECT * FROM emp e
WHERE e.hiredate < '81/12/09';

-- 11. 문제) 직원번호가 7698보다 작거나 같은 사람들의 직원번호와 이름을 출력하라.
SELECT e.empno, e.ename FROM emp e
WHERE e.empno <= 7698;

--12. 문제) 입사일이 81/04/02 보다 같거나 늦고 82/12/09 보다 같거나 빠른 사원의 이름,월급, 부서번호를 출력하라.
SELECT  e.ename, e.sal, e.deptno, e.hiredate FROM emp e
--WHERE e.hiredate >= '81/04/02' AND e.hiredate <= ' 82/12/09'  ;
WHERE e.hiredate BETWEEN '81/04/02' AND ' 82/12/09'  ;

-- 13. 문제) 급여가 $1,600보다 크고 $3,000보다 작은 직원의 이름, 직업, 급여를 출력하라.
SELECT  e.ename, e.job, e.sal FROM emp e
WHERE e.sal > 1600 AND e.sal < 3000  ;

-- 14. 문제) 직원번호가 7654와 7782 사이가 아닌 직원의 모든 정보를 출력하라.
SELECT  * FROM emp e
WHERE NOT (7654 < e.empno AND e.empno < 7782)  ;

-- 15. 문제) 이름이 B와 J 사이의 모든 직원의 정보를 출력하라.
SELECT * FROM emp e
WHERE 'B%' < e.ename  AND  e.ename < 'J%' ;

--16. 문제) 입사일이 81년이 아닌 모든 직원의 모든 정보를 출력하라.
SELECT * FROM emp e
WHERE  '80/12/31'< e.hiredate AND e.hiredate <'82/01/01';

--17. 문제) 직업이 MANAGER이거나 SALESMAN인 직원의 모든 정보를 출력하라.
SELECT * FROM emp e
--WHERE  e.job = 'MANAGER' OR e.job = 'SALESMAN';
WHERE  e.job IN ('MANAGER' ,'SALESMAN');

--18. 문제) 부서번호가 20, 30번을 제외한 모든 직원의 이름, 사원번호, 부서번호를 출력하라.
SELECT e.ename, e.empno, e.deptno FROM emp e
WHERE  e.deptno != 20 AND e.deptno != 30;

-- 19. 문제) 이름이 S로 시작하는 직원원의 사원번호, 이름, 입사일, 부서번호를 출력하라.
SELECT e.empno, e.ename, e.hiredate, e.deptno FROM emp e
WHERE e.ename LIKE 'S%' ;

-- 20. 문제) 입사일이 81년도인 사람의 모든 정보를 출력하라
SELECT * FROM emp e
WHERE '81/01/01' <= e.hiredate AND e.hiredate <='81/12/31' ;

--21. 문제) 이름 중 S자가 들어가 있는 사람만 모든 정보를 출력하라.
SELECT * FROM emp e
WHERE e.ename LIKE '%S%' ;

--22. 문제) 이름이 M로 시작하고 마지막 글자가 N인 사람의 모든 정보를 출력하라
--(단, 이름은 전체 6자리이다. 자리수를 이용한 와일드카드 '_' 을 이용)
SELECT * FROM emp e
WHERE e.ename LIKE 'M____N' ;

-- 23. 문제) 이름이 첫 번째 문자는 관계없고, 두 번째 문자가 A인 사람의 정보를 출력하라.
SELECT * FROM emp e
WHERE e.ename LIKE '_A%' ;

-- 24. 문제) 커미션이 NULL인 사람의 정보를 출력하라.  ( IS NULL 또는 IS NOT NULL 사용) 
SELECT * FROM emp e
WHERE e.comm IS NULL ;

-- 25. 문제) 커미션이 NULL이 아닌 사람의 모든 정보를 출력하라. ( IS NULL 또는 IS NOT NULL 사용) 
SELECT * FROM emp e
WHERE e.comm IS NOT NULL ;

-- 26. 문제) 부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서 ,월급을 출력하라.
SELECT e.ename, e.deptno, e.sal FROM emp e
WHERE e.deptno = 30 AND e.sal >= 1500 ;

--27. 문제) 이름의 첫 글자가 K로 시작하거나 부서번호가 30인 사람의 사원번호, 이름, 부서번호를 출력하라.
SELECT e.empno,  e.ename, e.deptno FROM emp e
WHERE e.ename LIKE 'K%' OR e.deptno = 30 ;

-- 28. 문제) 급여가 $1,500 이상이고 부서번호가 30번인 사원 중 직업이MANAGER인 사람의 정보를 출력하라
SELECT *FROM emp e
WHERE (e.sal > 1500 AND e.deptno = 30) AND e.job = 'MANAGER' ;

-- 29. 문제) 부서번호가 30인 사람의 모든 정보를 출력하고 직원번호로 SORT(정렬)하라.
SELECT *FROM emp e
WHERE e.deptno = 30
ORDER BY e.empno;

-- 30. 문제) 직원들의 급여가 많은 순으로 SORT(정렬) 하라.
 SELECT *FROM emp e
ORDER BY e.sal DESC;

--31. 문제) 부서번호로 ASCENDING SORT한 후 급여가 많은 사람 순으로 출력하라.
--( 한개 이상의 열로 정렬시 콤마(,)를 사용합니다.)
 SELECT *FROM emp e
ORDER BY e.deptno ASC, e.sal DESC;

--32. 문제) 부서번호가 DESCENDING SORT하고, 이름 순으로 ASCENDING SORT 급여 순으로 DESCENDING SORT 하라.
 SELECT *FROM emp e
ORDER BY e.deptno DESC, e.ename ASC, e.sal DESC;

-- 33. 10번부서의 모든 직원에게 급여의 13%를 보너스로 지급하기로 하였다. 이름, 급여, 보너스금액, 부서번호를 출력하라
-- ( 소수점은 반올림함.)
 SELECT e.ename, e.sal ,ROUND(e.sal*0.13) 보너스, e.deptno  FROM emp e
 WHERE e.deptno = 10;
 
--  34. 직원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력하여라.
--(단, 커미션이 null인 사원도 0으로 해서 포함.)
 SELECT e.ename, e.sal ,NVL(e.comm, 0 ) , e.sal+ NVL(e.comm, 0 ) 총액, e.deptno  FROM emp e
 ORDER BY 총액 DESC;

-- 35. 급여가 $1,500부터 $3,000 사이의 사원에 대해서만 급여의 15%를 회비로 지불하기로 하였다.
--모든 사원의 이름, 급여, 회비(소수이하 2자리에서 반올림)를 출력하여라.
--(단, 회비는 달러표시$로 시작하고 소수점 1자리까지 출력)
 SELECT e.ename, e.sal , TO_CHAR(ROUND(e.sal*0.15,1),'$999,999.999') 회비 FROM emp e
 WHERE 1500 < e.sal AND e.sal < 3000 ;

--36. 사원수가 5명이 넘는 부서의 부서명과 사원수 조회 (조인필요)
SELECT d.dname, COUNT(e.empno) FROM emp e
JOIN dept d
ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno)>5;

-- 37. 직업별 급여합계가  5000을 초과하는 각 직무에 대해서 직무와  급여 합계를 조회  
--  단 판매원('SALESMAN')은 제외
SELECT e.job, SUM(e.sal) FROM emp e
WHERE e.job != 'SALESMAN'
GROUP BY e.job
HAVING SUM(e.sal)>5000;

-- 38. 사원들의 사원번호(empno), 사원명(ename), 급여(sal), 급여등급(grade)을 출력하시오.
--(테이블 salgrade 비 동등 조인 )
 SELECT e.empno, e.ename, e.sal, s.grade FROM emp e
 JOIN salgrade s
 ON e.sal BETWEEN s.losal AND s.hisal;
 
-- 39.  부서별(deptno)로 사원의 수와 커미션(comm)을 받은 사원의 수를 출력하여 보시오
 SELECT e.deptno, COUNT(e.empno),COUNT(e.comm) FROM emp e
GROUP BY e.deptno;


-- 40.  부서번호(deptno)가 10은 '총무부', 20은 '개발부', 30은 영업부'라고 하여 
--이름, 부서번호, 부서명 순으로 출력하여 보시오. (decode 나 case 함수 사용)

SELECT e.ename, e.deptno, 
   CASE e.deptno  WHEN 10   THEN '총무부'
                WHEN 20     THEN '개발부'
                WHEN 30      THEN '영업부'
                
   END "부서명"
FROM emp e;
