SELECT SYSDATE FROM DUAL;
--실습용 계정 HR계정생성 및 1234비버널정
ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY 1234;
-- 실습용 SCOTT계정 생성및 활성화
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
ALTER USER scott IDENTIFIED BY 1234;