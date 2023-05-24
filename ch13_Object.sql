객체
- 테이블 (TABLE)
- 인덱스: 데이터를 빠르게 찾기 위해 칼럼에 인덱스 정의
    CREATE INDEX EMP
    ON EMP (EMPNO);--(칼럼)
    
- 뷰 (VIEW): 필요한 일부 정보만. 논리적 개체 - EMP_V
    CREATE VIEW EMP_V
    AS SELECT * FROM EMP;
    
    SELECT * FROM EMP_V;
    
- 시퀀스 (SEQUENCE): 칼럼에 순서를 넣어주는 것
- 시노님 (SYNONYM): 기존 테이블의 이름을 동일하게 써주는 것 - EMP_S




-- 실습 13-1
SELECT * FROM DICT;

SELECT * FROM DICT
WHERE TABLE_NAME LIKE 'USER%';

SELECT * FROM DICT
WHERE TABLE_NAME LIKE 'ALL%';

SELECT * FROM DICT
WHERE TABLE_NAME LIKE 'DBA%';

SELECT * FROM DICT
WHERE TABLE_NAME LIKE 'V$%';

SELECT * FROM USER_OBJECTS
WHERE OBJECT_NAME ='EMP';


-- 실습 13-2
SELECT * FROM DICTIONARY;

-- 실습 13-3
SELECT * --TABLE_NAME
  FROM USER_TABLES;

-- 실습 13-4
SELECT OWNER, TABLE_NAME
  FROM ALL_TABLES;

SELECT OWNER, TABLE_NAME
  FROM ALL_TABLES
 WHERE OWNER ='HR';

-- 실습 13-5
SELECT * FROM DBA_TABLES;

-- 실습 13-6
SELECT * FROM DBA_TABLES;

CONN SYSTEM/ MG

-- 실습 13-7
SELECT *
  FROM DBA_USERS
 WHERE USERNAME = 'HR';

-- 실습 13-8
SELECT *
  FROM USER_INDEXES;
  
SELECT *
  FROM USER_INDEXES
 WHERE TABLE_NAME = 'EMP'  ;  

-- 실습 13-9
SELECT *
  FROM USER_IND_COLUMNS --현재 접속 계정의 인덱스 정보 알아보기
 WHERE TABLE_NAME = 'EMP'  ;

-- 실습 13-10
CREATE INDEX IDX_EMP_DEPTNO
    ON EMP(DEPTNO);

-- 실습 13-11
SELECT * FROM USER_IND_COLUMNS
WHERE INDEX_NAME = 'IDX_EMP_DEPTNO';

-- 실습 13-12
DROP INDEX IDX_EMP_DEPTNO;

-- 실습 13-13
SELECT * FROM USER_IND_COLUMNS
WHERE INDEX_NAME = 'IDX_EMP_DEPTNO';

-- 실습 13-14
SQLPLUS SYSTEM/12345678

GRANT CREATE VIEW TO HR;

-- 실습 13-15
CREATE VIEW VW_EMP20
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO
          FROM EMP
         WHERE DEPTNO = 20);

SELECT * FROM VW_EMP20;         

-- 실습 13-16
SELECT *
  FROM USER_VIEWS;

-- 실습 13-17
SELECT VIEW_NAME, TEXT_LENGTH, TEXT
  FROM USER_VIEWS;

-- 실습 13-18
SELECT *
  FROM VW_EMP20;

-- 실습 13-19
DROP VIEW VW_EMP20;

-- 실습 13-20
SELECT ROWNUM,  --샘플로 보기 위해서 rownum
       E.*  --E(EMP) 모든 데이터와 rownum 출력
  FROM EMP E;

-- 실습 13-21
SELECT ROWNUM, E.*
  FROM EMP E
ORDER BY SAL DESC;

-- 실습 13-22
SELECT ROWNUM, E.*
  FROM (SELECT *
          FROM EMP E
        ORDER BY SAL DESC) E;   --끌고올 때부터 정렬해서

SELECT E.*
  FROM EMP E
 WHERE ROWNUM <=10 ;    --몇개의 데이터만
        

-- 실습 13-23
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
  FROM E;

-- 실습 13-24
SELECT ROWNUM, E.*
  FROM (SELECT *
          FROM EMP E
        ORDER BY SAL DESC) E
 WHERE ROWNUM <= 3;

-- 실습 13-25
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
  FROM E
 WHERE ROWNUM <= 3;

-- 실습 13-26
DROP TABLE DEPT_SEQUENCE;

CREATE TABLE DEPT_SEQUENCE
    AS SELECT *
         FROM DEPT
        WHERE 1 <> 1;

SELECT * FROM DEPT_SEQUENCE;

-- 실습 13-27
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
   INCREMENT BY 10  --10씩 증가
   START WITH 10    --처음 값 10
   MAXVALUE 90  --최대 90
   MINVALUE 0   --최소 0
   NOCYCLE  --순환하지 않음
   CACHE 2;

-- 실습 13-28
SELECT *
  FROM USER_SEQUENCES
 WHERE SEQUENCE_NAME = 'SEQ_DEPT_SEQUENCE';

-- 실습 13-29
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

DELETE FROM DEPT_SEQUENCE;

-- 실습 13-30
SELECT SEQ_DEPT_SEQUENCE.CURRVAL    --시퀀스의 현재값
  FROM DUAL;

-- 실습 13-31
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

-- 실습 13-32
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
   INCREMENT BY 3
   MAXVALUE 99
   CYCLE;

-- 실습 13-33
SELECT *
  FROM USER_SEQUENCES;

-- 실습 13-34
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

-- 실습 13-35
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

-- 실습 13-36
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

SELECT * FROM USER_SEQUENCES;

-- 실습 13-37
SQLPLUS SYSTEM/oracle

GRANT CREATE SYNONYM TO HR;

GRANT CREATE PUBLIC SYNONYM TO HR;

-- 실습 13-38
CREATE SYNONYM E
   FOR EMP;

-- 실습 13-39
SELECT * FROM E;

-- 실습 13-40
DROP SYNONYM E;




--Q1
CREATE TABLE EMPIDX
AS SELECT * FROM EMP;

CREATE INDEX IDX_EMPIDX_EMPNO
    ON EMPIDX(EMPNO);
    
SELECT * FROM USER_IND_COLUMNS
WHERE INDEX_NAME = 'IDX_EMPIDX_EMPNO';


--Q2 수식을 사용한 표현식은 별칭을 주어야 오류가 안남!
CREATE VIEW EMPIDX_OVER15K
AS (SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, E.SAL, 
    NVL2(COMM, 'O', 'X') COMM
    FROM EMP E
    WHERE E.SAL > 1500);
    
SELECT * FROM EMPIDX_OVER15K;


--Q3
--1)
CREATE TABLE DEPTSEQ
AS SELECT * FROM DEPT;

--SELECT * FROM DEPTSEQ;

--2)
CREATE SEQUENCE SEQ_DEPTSEQ
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 99
    MINVALUE 1
    NOCYCLE
    NOCACHE;

SELECT *
  FROM USER_SEQUENCES
 WHERE SEQUENCE_NAME = 'SEQ_DEPTSEQ';


--3)
SELECT * FROM DEPTSEQ;

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'DATABASE', 'SEOUL');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'WEB', 'BUSAN');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'MOBILE', 'ILSAN');