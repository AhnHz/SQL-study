DBMS (SQL - structure Query Language)
=====

- 오라클: 오라클 (약 50%~)
- MS: SQL server (20~30%)
- 오라클: MYSQL (~10%)
- Postgre (~5%)
- Maria (~5%)

NOSQL (정확도 100% 안됨)
- Mongodb (~1%)

### 사용자
- DBA (DB 관리자(administrator))
- 개발자 (프로그램 개발-데이터 입력(INSERT), 수정(UPDATE), 추출(SELECT), 삭제(DELETE)
- 사용자 (프로그램 개발-데이터 입력(INSERT), 수정(UPDATE), 추출(SELECT), 삭제(DELETE)

---

1. 오라클 접속 
- Run SQL Commend Line 초기 설정
- 현재 유저 보기 : show user

2. SCOTT User 생성 및 권한 주기
- conn/as sysdba 실행

  - create user scott identified by 1234 ;
  - grant connect, resource to scott;

3. 내가 보려고 정리하는 도커-오라클 명령어
``` 
# 컨테이너 실행/재실행
docker start/restart 컨테이너명


# [오류] Cannot connect to the Docker daemon at unix:///.colima/default/docker.sock. 
colima start --memory 4 --arch x86_64


# 특정 컨테이너의 bash 터미널을 실행
docker exec -it 컨테이너명 /bin/bash


# sqlplus 실행
docker exec -it --user=oracle 컨테이너명 sqlplus


# 실행중인 컨테이너 목록
docker ps


# sqlplus 접속
root@CONTAINER_ID:/# su - oracle
oracle@CONTAINER_ID:/# sqlplus


# 시스템 계정 재설정, 권한 부여 (sqlplus 접속 후)
user name: sys as sysdba / password: oracle
user name: system / password: oracle
```


# 오라클 타입
- Char() - 일정 길이가 정해져 있을때(8자리)
- varchar2() - 일정 길이가 정해져 있지 않을때(자리수- 내가 결정)
- Number(전체 자릿수, 소수 자릿수) - Number(7, 2)
- Date() - YYYY-MM-DD
- TimeStemp() - YYYY-MM-DD HH:MM:SS

### SQL Developer SQL 창
- 파일=>새로 만들기=>데이터베이스파일=>확인



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



## SQL 기본 문법 
``` sql
SELECT *
  FROM EMP
WHERE
--  AND(OR);
GROUP BY
HAVING
ORDER BY
```

``` sql
SELECT JOB, COUNT(*), SUM(SAL)
--EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DNO
  FROM EMP
-- WHERE ENAME = 'SMITH';
--  AND(OR);
GROUP BY JOB
--HAVING JOB = 'CLERK'
ORDER BY JOB
```
