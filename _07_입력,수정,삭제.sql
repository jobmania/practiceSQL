-- DML 작업

-- 데이터 입력 INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300,'Game', 100, 1700);
SELECT * FROM departments WHERE department_id = 300;


-- 특정 열만 입력할 때 ! (미입력시 NULL)
INSERT INTO departments(department_id, department_name)
VALUES (310,'Music');

SELECT * FROM departments;
DESC departments;

-- 열 이름 생략시 모든 정보 기입해야함 ! 
INSERT INTO departments
VALUES (312,'Hogu',NULL,1700);

SELECT * FROM departments;
DESC departments;


--  예제 1) departments 테이블에 다음과 같이 각각의 department_id, department_name,
-- manager_id가 200, location_id가 1700인 행을 3개 입력하세요.
INSERT INTO departments
VALUES (313,'Sample',200,1700);

SELECT * FROM departments;
DESC departments;
-- 예제 2) 아래와 같이 테이블을 만든후  SELECT 문을 이용하여 departments 테이블 내용을 전부 입력하시오. ( 위의 scott예제 3번째 방법)
--// copy_departments 라는 테이블을 만듬
CREATE TABLE copy_departments( department_id number(4,0),
                              department_name varchar2(30 byte),
                              manager_id number(6,0),
                              location_id number(4,0));
INSERT INTO copy_departments
SELECT * FROM departments; -- 쿼리문 태이블 입력~


-- 데이터 수정 UPDATE

UPDATE departments
SET manager_id = 200
WHERE department_name = 'Game';

-- 예제) departments 테이블에서 department_id 150부터 200까지 부서번호의 manager_ID 를 100으로 수정하라.
UPDATE departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;
SELECT * FROM departments;

-- 예제) 2개 열 동시 변경  / departments 테이블에서 department_id 150부터 200까지 부서번호의 manager_ID 를 200, location_id 는 2500으로 수정하라.
UPDATE departments
SET manager_id = 200, location_id = 2500
WHERE department_id BETWEEN 150 AND 200;
SELECT * FROM departments;


-- delete 삭제 
-- 특정행의 WHERE 절을 넣어서 삭제 
DROP table copy_departments; --테이블 삭제

DELETE from departments WHERE department_name = 'Game';
DELETE from departments WHERE department_id = 313;
commit; -- 데이터베이스 작업 반영
ROLLBACK; -- 데이터베이스 작업 롤백
SELECT * FROM departments;

DELETE from departments WHERE department_id between 120 and 270;
SELECT * FROM departments;
