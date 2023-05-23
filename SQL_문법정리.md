# Oracle-SQL 문법 정리

## 쿼리(SELECT) 문의 구조
```sql
SELECT 컬럼명1, ...,컬럼명n
  FROM EMP, DEPT, ....(테이블명)
 WHERE 컬럼명1 < > <= >=
   AND 컬럼명2 IS (NOT) NULL , (UN)LIKE(_s%)
    OR 컬럼명3 (NOT) IN (값1, 값2,...)
   AND 컬럼명4 BETWEEN 값1(1000) AND 값2(2000)
GROUP BY JOB, DEPTNO
  HAVING DEPTNO = 10
ORDER BY JOB ASC(DESC)
```

## GROUP BY
```sql
SELECT JOB, DEPTNO, COUNT(*), SUM(SAL), SUM(SAL)/ COUNT(*), AVG(SAL), MIN(SAL), MAX(SAL),.....
  FROM EMP, DEPT, ....(테이블명)
 WHERE 컬럼명1 < > <= >=
   AND 컬럼명2 IS (NOT) NULL , (UN)LIKE(_s%)
    OR 컬럼명3 (NOT) IN (값1, 값2,...)
   AND 컬럼명4 BETWEEN 값1(1000) AND 값2(2000)
GROUP BY JOB, DEPTNO
  HAVING DEPTNO = 10
ORDER BY JOB ASC(DESC)
```

## 조인
### 1. EQUAL JOIN 
```sql
SELECT E.*, D.*
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO;
```

```sql
SELECT E.*, D.*
  FROM EMP E INNER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO;
```

### 2. OUTER JOIN(LEFT/RIGHT/FULL)
#### - LEFT JOIN
```sql
SELECT E.*, D.*
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO(+);
-- WHERE D.DEPTNO(+) = E.DEPTNO
```

```sql
SELECT E.*, D.*
  FROM EMP E LEFT OUTER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO;
```
    
#### - RIGHT JOIN
```sql
SELECT E.*, D.*
  FROM EMP E, DEPT D
 WHERE E.DEPTNO(+) = D.DEPTNO;
```

```sql
SELECT E.*, D.*
  FROM EMP E RIGHT OUTER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO;
```    
    
#### - FULL JOIN
```sql
SELECT E.*, D.*
  FROM EMP E FULL OUTER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
```    
    
## 집합 : UNION / UNION ALL / MINUS / INTERSECT

## 서브쿼리(SUB QUERY)
```sql
SELECT C1, ....
FROM (SELECT (SELECT
          FROM
         WHERE
         GROUP BY
           HAVING
         ORDER BY), ...
  FROM (SELECT DNAME, EMPNO
          FROM
         WHERE EMP, DEPT
         GROUP BY
           HAVING
         ORDER BY) A,
         (SELECT
          FROM
         WHERE
         GROUP BY
           HAVING
         ORDER BY) B, EMP E, DEPT D
WHERE A.C1
  AND B.C2
  AND E.C3
  AND D.C4
) T1,
(SELECT (SELECT
          FROM
         WHERE
         GROUP BY
           HAVING
         ORDER BY), ...
  FROM (SELECT DNAME, EMPNO
          FROM
         WHERE EMP, DEPT
         GROUP BY
           HAVING
         ORDER BY) A,
         (SELECT
          FROM
         WHERE
         GROUP BY
           HAVING
         ORDER BY) B, EMP E, DEPT D
WHERE A.C1
  AND B.C2
  AND E.C3
  AND D.C4
) T2
WHERE
GROUP BY
HAVING
ORDER BY
```

```sql
SELECT *
  FROM
WHERE  DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'CLEAK')
GROUP BY
HAVING --(SELECT * FROM  WHERE )
ORDER BY
```

***


# DML(데이터 조작언어)
```sql
-- SELECT(출력)
SELECT
  FROM
 WHERE
GROUP BY
HAVING
ORDER BY

-- INSERT(삽입)
INSERT INTO 테이블 VALUES(V1, V2, ...)

-- UPDATE(변경)
UPDATE 테이블
   SET 컬럼 = '값'
 WHERE 컬럼 = '조건값'
 
-- DELETE(삭제)
DELETE FROM 테이블
WHERE 컬럼 = '조건값'
```
**`CRUD(CREATE, READ, UPDAE, DELETE)`**


## 컬럼 추가(add)
```sql
Alter table(객체)  EMP(객체 이름)
      Add 컬럼(Tel) varchar(10);
```

## 컬럼 변경 (데이타 타입변경: modify, 컬럼명 변경)
```sql
Alter table(객체)  EMP(객체 이름)
      modify 컬럼(Tel) varchar(20);
      
Alter table(객체)  EMP(객체 이름)
      rename Column 컬럼(Tel) to 컬럼(Telephone);
```

## 컬럼 삭제(drop)
```sql
Alter table(객체)  EMP(객체 이름)
      drop Column 컬럼(Tel);
      
Drop(객체 삭제)

Drop table(객체)  EMP(객체 이름);
```


# DDL (데이터 정의어)
- 객체(테이블, 뷰, 인덱스, 시노님, ..)

```sql
Create Table(객체) EMP(객체 이름)
{empno number,
...}

Alter table(객체)  EMP(객체 이름)

--테이블(이름 변경)
Rename Emp To Emp_ren;
```

***


## 헷갈리는 삭제 명령어 (DROP / DELETE/ TRUNCATE)
- DROP TABLE - 테이블 삭제
- DELETE FROM - 테이블 삭제 안하고 데이터만 지움. 시간이 많이 걸림
- TRUNCATE TABLE - 테이블 삭제 안하고 데이터만 지움. 시간이 별로 안걸림

*DROP, TRUNCATE는 DDL이고 DELETE는 DML이다!*



