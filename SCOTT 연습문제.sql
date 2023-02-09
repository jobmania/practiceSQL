-- ���� SCOTT �������� 
SELECT * FROM dept;
SELECT * FROM bonus;
SELECT * FROM emp;
SELECT * FROM salgrade;

-- 1. ����) �μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�
SELECT e.empno,e.ename,  e.sal FROM emp e
WHERE e.deptno = 10;

--2. ����) �����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ���ȣ�� ����϶�.
SELECT e.ename,  e.hiredate, e.deptno FROM emp e
WHERE e.empno = 7369;

-- 3. ����) �̸��� ALLEN�� ����� ��� ������ ����϶�.
SELECT * FROM emp e
WHERE e.ename = 'ALLEN';

--4. ����) �Ի����� 81/02/20�� ����� �̸�, �μ���ȣ, ������ ����϶�.
SELECT e.ename, e.deptno, e.sal FROM emp e
WHERE e.hiredate = '81/02/20';

--5. ����) ������ MANAGER�� �ƴ� ����� ��� ������ ����϶�.
SELECT * FROM emp e
WHERE e.job != 'MANAGER';

--6. �Ի����� 81/04/02 ���Ŀ� �Ի��� ����� ������ ����϶�. 
SELECT * FROM emp e
WHERE e.hiredate >= '81/04/02';  -- // '<>' '!=' �Ѵ� �ε��ǹ�.

--7. ����) �޿��� $800 �̻��� ����� �̸�, �޿�, �μ���ȣ�� ����϶�.
SELECT e.ename, e.sal, e.deptno FROM emp e
WHERE e.sal >= 800;

-- 8. ����) �μ���ȣ�� 20�� �̻��� ����� ��� ������ ����϶�.
SELECT * FROM emp e
WHERE e.deptno >= 20;

--9. ����) �̸��� K�� �����ϴ� ������� ���� �̸��� ���� ����� ��� ������ ����϶�.
--(���ڿ� �񱳽� ���ĺ������� ö�� �� �� 'B'>'A')
SELECT * FROM emp e
WHERE e.ename >'K%';

-- 10. ����) �Ի����� 81/12/09 ���� ���� �Ի��� ������� ��� ������ ����϶�.
SELECT * FROM emp e
WHERE e.hiredate < '81/12/09';

-- 11. ����) ������ȣ�� 7698���� �۰ų� ���� ������� ������ȣ�� �̸��� ����϶�.
SELECT e.empno, e.ename FROM emp e
WHERE e.empno <= 7698;

--12. ����) �Ի����� 81/04/02 ���� ���ų� �ʰ� 82/12/09 ���� ���ų� ���� ����� �̸�,����, �μ���ȣ�� ����϶�.
SELECT  e.ename, e.sal, e.deptno, e.hiredate FROM emp e
--WHERE e.hiredate >= '81/04/02' AND e.hiredate <= ' 82/12/09'  ;
WHERE e.hiredate BETWEEN '81/04/02' AND ' 82/12/09'  ;

-- 13. ����) �޿��� $1,600���� ũ�� $3,000���� ���� ������ �̸�, ����, �޿��� ����϶�.
SELECT  e.ename, e.job, e.sal FROM emp e
WHERE e.sal > 1600 AND e.sal < 3000  ;

-- 14. ����) ������ȣ�� 7654�� 7782 ���̰� �ƴ� ������ ��� ������ ����϶�.
SELECT  * FROM emp e
WHERE NOT (7654 < e.empno AND e.empno < 7782)  ;

-- 15. ����) �̸��� B�� J ������ ��� ������ ������ ����϶�.
SELECT * FROM emp e
WHERE 'B%' < e.ename  AND  e.ename < 'J%' ;

--16. ����) �Ի����� 81���� �ƴ� ��� ������ ��� ������ ����϶�.
SELECT * FROM emp e
WHERE  '80/12/31'< e.hiredate AND e.hiredate <'82/01/01';

--17. ����) ������ MANAGER�̰ų� SALESMAN�� ������ ��� ������ ����϶�.
SELECT * FROM emp e
--WHERE  e.job = 'MANAGER' OR e.job = 'SALESMAN';
WHERE  e.job IN ('MANAGER' ,'SALESMAN');

--18. ����) �μ���ȣ�� 20, 30���� ������ ��� ������ �̸�, �����ȣ, �μ���ȣ�� ����϶�.
SELECT e.ename, e.empno, e.deptno FROM emp e
WHERE  e.deptno != 20 AND e.deptno != 30;

-- 19. ����) �̸��� S�� �����ϴ� �������� �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�.
SELECT e.empno, e.ename, e.hiredate, e.deptno FROM emp e
WHERE e.ename LIKE 'S%' ;

-- 20. ����) �Ի����� 81�⵵�� ����� ��� ������ ����϶�
SELECT * FROM emp e
WHERE '81/01/01' <= e.hiredate AND e.hiredate <='81/12/31' ;

--21. ����) �̸� �� S�ڰ� �� �ִ� ����� ��� ������ ����϶�.
SELECT * FROM emp e
WHERE e.ename LIKE '%S%' ;

--22. ����) �̸��� M�� �����ϰ� ������ ���ڰ� N�� ����� ��� ������ ����϶�
--(��, �̸��� ��ü 6�ڸ��̴�. �ڸ����� �̿��� ���ϵ�ī�� '_' �� �̿�)
SELECT * FROM emp e
WHERE e.ename LIKE 'M____N' ;

-- 23. ����) �̸��� ù ��° ���ڴ� �������, �� ��° ���ڰ� A�� ����� ������ ����϶�.
SELECT * FROM emp e
WHERE e.ename LIKE '_A%' ;

-- 24. ����) Ŀ�̼��� NULL�� ����� ������ ����϶�.  ( IS NULL �Ǵ� IS NOT NULL ���) 
SELECT * FROM emp e
WHERE e.comm IS NULL ;

-- 25. ����) Ŀ�̼��� NULL�� �ƴ� ����� ��� ������ ����϶�. ( IS NULL �Ǵ� IS NOT NULL ���) 
SELECT * FROM emp e
WHERE e.comm IS NOT NULL ;

-- 26. ����) �μ��� 30�� �μ��̰� �޿��� $1,500 �̻��� ����� �̸�, �μ� ,������ ����϶�.
SELECT e.ename, e.deptno, e.sal FROM emp e
WHERE e.deptno = 30 AND e.sal >= 1500 ;

--27. ����) �̸��� ù ���ڰ� K�� �����ϰų� �μ���ȣ�� 30�� ����� �����ȣ, �̸�, �μ���ȣ�� ����϶�.
SELECT e.empno,  e.ename, e.deptno FROM emp e
WHERE e.ename LIKE 'K%' OR e.deptno = 30 ;

-- 28. ����) �޿��� $1,500 �̻��̰� �μ���ȣ�� 30���� ��� �� ������MANAGER�� ����� ������ ����϶�
SELECT *FROM emp e
WHERE (e.sal > 1500 AND e.deptno = 30) AND e.job = 'MANAGER' ;

-- 29. ����) �μ���ȣ�� 30�� ����� ��� ������ ����ϰ� ������ȣ�� SORT(����)�϶�.
SELECT *FROM emp e
WHERE e.deptno = 30
ORDER BY e.empno;

-- 30. ����) �������� �޿��� ���� ������ SORT(����) �϶�.
 SELECT *FROM emp e
ORDER BY e.sal DESC;

--31. ����) �μ���ȣ�� ASCENDING SORT�� �� �޿��� ���� ��� ������ ����϶�.
--( �Ѱ� �̻��� ���� ���Ľ� �޸�(,)�� ����մϴ�.)
 SELECT *FROM emp e
ORDER BY e.deptno ASC, e.sal DESC;

--32. ����) �μ���ȣ�� DESCENDING SORT�ϰ�, �̸� ������ ASCENDING SORT �޿� ������ DESCENDING SORT �϶�.
 SELECT *FROM emp e
ORDER BY e.deptno DESC, e.ename ASC, e.sal DESC;

-- 33. 10���μ��� ��� �������� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����϶�
-- ( �Ҽ����� �ݿø���.)
 SELECT e.ename, e.sal ,ROUND(e.sal*0.13) ���ʽ�, e.deptno  FROM emp e
 WHERE e.deptno = 10;
 
--  34. ������ �̸�, �޿�, Ŀ�̼�, �Ѿ�(�޿�+Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ����Ͽ���.
--(��, Ŀ�̼��� null�� ����� 0���� �ؼ� ����.)
 SELECT e.ename, e.sal ,NVL(e.comm, 0 ) , e.sal+ NVL(e.comm, 0 ) �Ѿ�, e.deptno  FROM emp e
 ORDER BY �Ѿ� DESC;

-- 35. �޿��� $1,500���� $3,000 ������ ����� ���ؼ��� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���.
--��� ����� �̸�, �޿�, ȸ��(�Ҽ����� 2�ڸ����� �ݿø�)�� ����Ͽ���.
--(��, ȸ��� �޷�ǥ��$�� �����ϰ� �Ҽ��� 1�ڸ����� ���)
 SELECT e.ename, e.sal , TO_CHAR(ROUND(e.sal*0.15,1),'$999,999.999') ȸ�� FROM emp e
 WHERE 1500 < e.sal AND e.sal < 3000 ;

--36. ������� 5���� �Ѵ� �μ��� �μ���� ����� ��ȸ (�����ʿ�)
SELECT d.dname, COUNT(e.empno) FROM emp e
JOIN dept d
ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno)>5;

-- 37. ������ �޿��հ谡  5000�� �ʰ��ϴ� �� ������ ���ؼ� ������  �޿� �հ踦 ��ȸ  
--  �� �Ǹſ�('SALESMAN')�� ����
SELECT e.job, SUM(e.sal) FROM emp e
WHERE e.job != 'SALESMAN'
GROUP BY e.job
HAVING SUM(e.sal)>5000;

-- 38. ������� �����ȣ(empno), �����(ename), �޿�(sal), �޿����(grade)�� ����Ͻÿ�.
--(���̺� salgrade �� ���� ���� )
 SELECT e.empno, e.ename, e.sal, s.grade FROM emp e
 JOIN salgrade s
 ON e.sal BETWEEN s.losal AND s.hisal;
 
-- 39.  �μ���(deptno)�� ����� ���� Ŀ�̼�(comm)�� ���� ����� ���� ����Ͽ� ���ÿ�
 SELECT e.deptno, COUNT(e.empno),COUNT(e.comm) FROM emp e
GROUP BY e.deptno;


-- 40.  �μ���ȣ(deptno)�� 10�� '�ѹ���', 20�� '���ߺ�', 30�� ������'��� �Ͽ� 
--�̸�, �μ���ȣ, �μ��� ������ ����Ͽ� ���ÿ�. (decode �� case �Լ� ���)

SELECT e.ename, e.deptno, 
   CASE e.deptno  WHEN 10   THEN '�ѹ���'
                WHEN 20     THEN '���ߺ�'
                WHEN 30      THEN '������'
                
   END "�μ���"
FROM emp e;
