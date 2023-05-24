==== 데이터 정의어(DDL) ===
== 객체(테이블, 뷰, 인덱스, 시노님, ..)
Create Table(객체) EMP(객체 이름)
{empno number,
...}


Alter table(객체)  EMP(객체 이름)
--테이블(이름 변경)


Rename Emp To Emp_ren;
--컬럼


-추가(add)
Alter table(객체)  EMP(객체 이름)
      Add 컬럼(Tel) varchar(10);
      
      
-변경(데이타 타입변경:modify, 컬럼명 변경)
Alter table(객체)  EMP(객체 이름)
      modify 컬럼(Tel) varchar(20);
Alter table(객체)  EMP(객체 이름)
      rename Column 컬럼(Tel) to 컬럼(Telephone);


-삭제(drop)
Alter table(객체)  EMP(객체 이름)
      drop Column 컬럼(Tel);
Drop(객체 삭제)
Drop table(객체)  EMP(객체 이름);




=== 객체(테이블, 뷰, 인덱스, 시노님, 시퀀스) ===
딕셔너리(객체 정보에 관련된 테이블)
User_xxx : 사용자(scott)에 관련된 정보들
ALL_xxx  : 모든 사용자(scott, hr,...)에 관련된 정보들
DBA_xxx  : DBA가 사용하는 정보들
V$_xxx   : 튜닝(옵티마이저)을 위한 테이블


테이블 : 물리적(데이터 저장)
Select * from User_Tables;(<)from All_Tables;(<)from DBA_Tables
Select * from User_Tab_columns;(<)from All_Tab_columns;(<)from DBA_Tab_columns


뷰 : 논리적(구조만 존재, 테이블들의 정보를 모아놓은 일종의 테이블)
Select * from User_Views;(<)from All_Views;(<)from DBA_Views
Select * from User_Views_columns;(<)from All_xxx_columns;(<)from DBA_xxx_columns
Create Views View_v_name(Emp_dept_v)
As Select * from emp,dept where emp.deptno = dept.deptno


인덱스(컬럼 1개 이상)
Select * from User_Ind_columns;(<)from All_Ind_columns;(<)from DBA_Ind_columns


시노님 : 논리적 (테이블 이름을 감추기 위해서 다른 이름으로 만든 객체)
Create synonym  synonym_name(emp)(emploees => emp)


시퀀스 : 어떤 컬럼에 증가되는 일렬 숫자를 자동으로 입력하게 해주는 객체
Create Sequence Sequencd_Name(deptno)
    Increment by 10
    start with 10
    
    
    
    
=== 제약 조건(컬럼) ===
1.Not Null
2.Unique
3.Primary Key
4.Foreign Key
5.Check(조건에 맞는지)
6.Default(컬럼에 데이타가 안들어갈 경우 자동으로 넣어주는 값)
Create Table(객체) EMP(객체 이름)
{empno number 제약조건(Not Null/Unique/PK/FK/Check/Default)
...}




=== 권한 ===
유저가 사용할 수 있는 객체에 제한을 두는 것
ex) grant connect, resource, DBA to scott   --모든 권한 주기




--iterm으로 개인 실습함


-- 실습 15-1
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;

-- 실습 15-2
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;

-- 실습 15-3
GRANT CREATE SESSION TO ORCLSTUDY;

-- 실습 15-4
ALTER USER ORCLSTUDY
IDENTIFIED BY ORCL;

-- 실습 15-5
DROP USER ORCLSTUDY;

-- 실습 15-6
DROP USER ORCLSTUDY CASCADE;

-- 실습 15-7
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;

-- 실습 15-8
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO ORCLSTUDY;

-- 실습 15-9
CONN SCOTT/tiger

CREATE TABLE TEMP(
   COL1 VARCHAR(20),
   COL2 VARCHAR(20)
);

GRANT SELECT ON TEMP TO ORCLSTUDY;

GRANT INSERT ON TEMP TO ORCLSTUDY;

-- 실습 15-10
GRANT SELECT, INSERT ON TEMP
   TO ORCLSTUDY;

-- 실습 15-11
CONN ORCLSTUDY/ORACLE   --터미널로 할때 왜 연결이 끊기지

SELECT * FROM SCOTT.TEMP;

INSERT INTO SCOTT.TEMP VALUES('TEXT', 'FROM ORCLSTUDY');

SELECT * FROM SCOTT.TEMP;

-- 실습 15-12
CONN SCOTT/tiger

REVOKE SELECT, INSERT ON TEMP FROM ORCLSTUDY;   --권한 취소

-- 실습 15-13
CONN ORCLSTUDY/ORACLE

SELECT * FROM SCOTT.TEMP;

-- 실습 15-14
CONN SYSTEM/oracle

CREATE ROLE ROLESTUDY;

GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SYNONYM TO ROLESTUDY;

-- 실습 15-15
GRANT ROLESTUDY TO ORCLSTUDY;

-- 실습 15-16
CONN ORCLSTUDY/ORACLE

SELECT * FROM USER_SYS_PRIVS;   --현재 사용자의 시스템 권한 조회

SELECT * FROM USER_ROLE_PRIVS;


