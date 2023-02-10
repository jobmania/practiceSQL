-- DDL 작업

-- 테이블 생성
CREATE TABLE 테스트 ( 
    문자열 VARCHAR2(100),
    숫자 NUMBER,
    날짜 DATE DEFAULT SYSDATE
);

INSERT INTO 테스트 VALUES ('DJ42' , 1234, TO_DATE('2022/02/12'));
INSERT INTO 테스트(문자열, 숫자) VALUES ('DJ2' , 1235);
INSERT INTO 테스트 VALUES ('BAS' , 9435,'2026/11/05');
SELECT * FROM 테스트;
-- 테이블 삭제
DROP TABLE 테스트;

-- 예제) product_id(number 타입), product_name(varchar2 타입, 20자리), menu_date(date 타입) 열이 있는 sample_product 이름의 테이블을 생성해 보세요.
CREATE TABLE  sample_product ( 
    product_name VARCHAR2(80),
    product_id NUMBER,
    menu_date DATE DEFAULT SYSDATE
);

DESC sample_product;
-- 예제) 위에서 만든 테이블을 삭제해 보세요. DESCRIBE 절로 테이블이 잘 삭제되었는지 확인하세요
DROP TABLE sample_product;


-- 제약조건
CREATE TABLE emp ( 
     이름 VARCHAR2(100),
     성별 VARCHAR2(5) NOT NULL CHECK(성별 IN('M','W')), -- NULL 안됨!
     직원번호 NUMBER PRIMARY KEY, -- 기본키 제약조건!!
     월급 NUMBER CHECK(월급 > 150),
      UNIQUE(이름) --중복안됨!!
);
 
INSERT INTO emp VALUES ('BAS' ,'M' , 1, 200);
INSERT INTO emp VALUES ('BAS' ,NULL , 1, 200);  -- NULL  X
INSERT INTO emp VALUES ('BAS' ,'W', 3, 170);   -- 이름 UNIQUE X
INSERT INTO emp VALUES ('SSS' ,'M', 1, 190);    -- ID PRIMARY KEY X
INSERT INTO emp VALUES ('SSS' ,'Q', 2, 220);      -- 성별 제외 입력
INSERT INTO emp VALUES ('SSS' ,'W', 2,100);   -- 월급 제약조건 X
INSERT INTO emp VALUES ('SSS' ,'W', 2,NULL);   -- NULL 가능.
DESC emp;
SELECT * FROM EMP;
DROP TABLE emp;


-- 예제 ) members 라는 새 테이블을 만듭니다. (제약조건 이름은 생략가능)
CREATE TABLE members2 ( 
     member_id NUMBER PRIMARY KEY ,   -- 기본키
     first_name VARCHAR2(50) NOT NULL,  -- NULL 입력 불가
     last_name VARCHAR2(50) NOT NULL,  -- NULL 입력 불가
     gender VARCHAR2(5) NOT NULL CHECK(gender IN('Man','Woman')), -- 값이  'Man'  또는 'Woman'
     birth_day DATE DEFAULT sysdate,  -- 디폴트값  SYSDATE
     email VARCHAR2(200) NOT NULL,   -- 유니크, NULL 입력불가
     UNIQUE(email) --중복안됨!   
);
DESC members2
DROP TABLE members2;

-- 외래키 fk  기본키pk 제약조건
CREATE TABLE 부서(
    부서번호 NUMBER PRIMARY KEY,
    부서이름 VARCHAR2(100)
);
DROP TABLE 부서;
INSERT INTO 부서 VALUES (1, '개발');
INSERT INTO 부서 VALUES (2, '경영');
INSERT INTO 부서 VALUES (3, '회계');

CREATE TABLE 직원(
    직원번호 NUMBER PRIMARY KEY,
    이름 VARCHAR2(100),
    부서번호 NUMBER,
    FOREIGN KEY(부서번호) REFERENCES 부서(부서번호)
--    ON DELETE CASCADE -- 외래키로 참조하고 있는 열이 삭제되면 참고하고 있는 열도 삭제
    ON DELETE SET NULL -- 외래키로 참조하고 있는 열이 삭제되면 참고하고 있는 열 NULL 세팅
);
DROP TABLE 직원;
-- 참조되는 컬럼은 PK이거나 UK(Unique key)만 가능
INSERT INTO 직원 VALUES (1, '나무식',1);
INSERT INTO 직원 VALUES (2, '엄준식',1);
INSERT INTO 직원 VALUES (3, '김찬식',2);
INSERT INTO 직원 VALUES (4, '섹무식',null); -- 널 가능 

-- 외래키 관계의 참조열은 삭제시 되지 않음. > 직원테이블에서 해당부서번호를 참조하고 있기 때문에!, 참조하고 있지 않으면 삭제됨.
-- 그러나 자식 열에서  ON DELETE CASCADE를 넣게 되면 자식열도 삭제할수 있음.
SELECT * FROM 직원;
DELETE FROM 부서 where 부서번호 = 1;


-- 제약 조건 조회
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = '부서'; -- 테이블 대문자.

SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = '직원'; -- 테이블 대문자.

-- 제약 조건 추가(테이블 생성뒤 추가하기)
    CREATE TABLE 과목(
        과목번호 NUMBER ,
        과목명 VARCHAR2(100)
    );
DROP TABLE 과목;
INSERT INTO 과목 VALUES('01','데이터베이스');
INSERT INTO 과목 VALUES('02','프로그래밍');

CREATE TABLE 학생(
    학생번호 NUMBER ,
    이름 VARCHAR2(100),
    과목번호 NUMBER
  
); 
DROP TABLE  학생;
--제약조건 추가
ALTER TABLE 과목 ADD PRIMARY KEY(과목번호);
ALTER TABLE 과목 ADD  UNIQUE(과목명);

ALTER TABLE 학생 ADD  PRIMARY KEY(학생번호);
ALTER TABLE 학생 MODIFY 이름 NOT NULL;
ALTER TABLE 학생 ADD FOREIGN KEY(과목번호) REFERENCES 과목(과목번호);

INSERT INTO 학생 VALUES(1,'준식',1);
INSERT INTO 학생 VALUES(2,'무기',2);
INSERT INTO 학생 VALUES(3,'바가',2);

-- 제약 조건 삭제 하기 !! 
ALTER TABLE 과목 DROP CONSTRAINT SYS_C007076;
ALTER TABLE 과목 DROP CONSTRAINT SYS_C007075;


--- 테스트 (열이름만 복사)
CREATE TABLE EMP_TEMP
AS SELECT * FROM employees
WHERE 1 != 1; --(열이름만 복사)

SELECT * FROM EMP_TEMP;
DROP TABLE  EMP_TEMP ;

CREATE TABLE EMP80
AS SELECT email 이메일 FROM employees
WHERE department_id = 80; --(열이름만 복사)
SELECT * FROM EMP80;        
drop table emp80;