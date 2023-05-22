SELECT ENAME, SAL*12 YEAR_SAL   --연봉
FROM EMP
ORDER BY DEPTNO, YEAR_SAL;


SELECT * 
FROM EMP
WHERE DEPTNO = 30 OR JOB = 'SALESMAN';


SELECT * 
FROM EMP
WHERE SAL*12 > 20000;


SELECT * 
FROM EMP
WHERE ENAME <> 'SMITH'  --NOT SMITH
ORDER BY ENAME;


SELECT * 
FROM EMP
WHERE JOB IN ('SALESMAN', 'CLERK')
ORDER BY ENAME;


SELECT * 
FROM EMP
WHERE ENAME LIKE 'S%'  --S로 시작하는 것들
ORDER BY ENAME;


SELECT * 
FROM EMP
WHERE ENAME LIKE '%D%'  --D가 들어가는 것들
ORDER BY ENAME;


SELECT * 
FROM EMP
WHERE COMM IS NOT NULL  --comm이 널값이 아닌 데이
ORDER BY ENAME;


--합집합
SELECT * 
FROM EMP
WHERE DEPTNO = '20'
UNION ALL   --all 안붙이면 번갈아 출력
SELECT * 
FROM EMP
WHERE DEPTNO = '10';


--교집합
SELECT * 
FROM EMP
WHERE DEPTNO = '20'
INTERSECT
SELECT * 
FROM EMP
WHERE DEPTNO = '10';



--Q1 EMP 테이블을 사용하여 다음과 같이 사원이름이 S로 끝나는 사원 데이터를 모두 출력해라  
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';  --큰 따옴표는 에러남


--Q2 EMP 테이블을 사용해 30번 부서에서 근무하고 있는 사원 중 직책이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호를 출력해라
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = '30' AND JOB = 'SALESMAN';

--
SELECT LOWER(JOB)업무   --소문자로 출력, 스키마 이름은 업무로
FROM EMP
WHERE DEPTNO = '30';


--Q3 EMP 테이블을 사용해 20번, 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 두 가지 방식의 SELECT문을 사용하여 사원번호, 이름, 급여, 부서번호를 출력해라
--집합 연산자 사용하지 않은 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (20,30) AND SAL > 2000;

--집합 연산자 사용한 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = '20' AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = '30' AND SAL > 2000;


--Q4 NOT BETWEEN A AND B 연산자를 쓰지 않고, 급여 열 값이 2000 이상 3000 이하 범위 이외의 값을 가진 데이터만 출력해라
SELECT *
FROM EMP 
WHERE SAL < 2000 OR SAL > 3000;

--NOT BETWEEN
SELECT *
FROM EMP 
WHERE SAL NOT BETWEEN 2000 AND 3000;


--Q5 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000 사이가 아닌 사원 이름, 사원번호, 급여, 부서번호를 출력해라
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE SAL NOT BETWEEN 1000 AND 2000 AND DEPTNO = '30';


--Q6 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER, CLERK인 사원 중 사원 이름 두번째 글자가 L이 아닌 사원 정보를 출력해라
SELECT *
FROM EMP
WHERE COMM IS NULL 
AND MGR IS NOT NULL 
AND JOB IN ('MGR', 'CLERK')
AND ENAME NOT LIKE '_L%';




============================
WHERE
AND
OR

컬럼(숫자) *,/,+,-
컬럼 <,>,=,!= 
(NOT) 컬럼 BETWEEN 값.1 AND 값2(문자, 숫자)
컬럼 (NOT) IN(값1, 값2)값
컬럼 (NOT) LIKE(값1, 값2)값
컬럼 IS (NOT) NULL
============================



