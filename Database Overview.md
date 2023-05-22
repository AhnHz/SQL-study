DBMS (SQL - structure Query Language)
=====

- 오라클: 오라클 (약 50%~)
- MS: SQL server (20~30%)
- 오라클: MYSQL (~10%)
- Postgre (~5%)
- Maria (~5%)

NOSQL (정확도 100% 안됨)
- Mongodb (~1%)

#### 사용자
- DBA (DB 관리자(administrator))
- 개발자 (프로그램 개발-데이터 입력(INSERT), 수정(UPDATE), 추출(SELECT), 삭제(DELETE)
- 사용자 (프로그램 개발-데이터 입력(INSERT), 수정(UPDATE), 추출(SELECT), 삭제(DELETE)



1. 오라클 접속 
- Run SQL Commend Line 초기 설정
- 현재 유저 보기 : show user

2. SCOTT User 생성 및 권한 주기
- conn/as sysdba 실행

  - create user scott identified by 1234 ;
  - grant connect, resource to scott;


#### 테이블 생성 문법
``` sql
CREATE TABLE DEPT(
         DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY, 	
         DNAME VARCHAR2(14), 								
         LOC   VARCHAR2(13) ) ;
DESC DEPT;

DROP TABLE DEPT;

CREATE TABLE EMP
        (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY, 
         ENAME VARCHAR2(10), 								
         JOB   VARCHAR2(9),  								
         MGR   NUMBER(4), 									
         HIREDATE DATE, 									
         SAL NUMBER(7,2), 									
         COMM NUMBER(7,2), 									
         DNO NUMBER(2) CONSTRAINT FK_DNO REFERENCES DEPT);
DESC EMP;

DROP TABLE EMP;
```
