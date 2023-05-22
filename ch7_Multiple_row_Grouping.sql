SELECT *
FROM EMP;


SELECT JOB, DEPTNO, COUNT(*), SUM(SAL), AVG(SAL), MAX(SAL)
FROM EMP

GROUP BY JOB, DEPTNO
HAVING DEPTNO=20    --GROUP BY 조건절
ORDER BY SUM(SAL) DESC;


--널값이라 오류난다는데 왜 돌아감?
SELECT SUM(COMM) 
FROM EMP;


SELECT SUM(NVL(COMM,0))  --널값이면 0으로
FROM EMP;


SELECT SUM(SAL), SUM(DISTINCT SAL), SUM(ALL SAL)
FROM EMP;


SELECT COUNT(COMM)  --NULL값 때문에 모든 튜플 카운트X. 되도록이면 * 쓰기
FROM EMP;


--ERROR select문 컬럼과 group by문 컬럼이 같지 않아서
SELECT ENAME, DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;


--ERROR
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
 WHERE AVG(SAL) >= 2000
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;


SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000 --그룹함수는 having 으로 조건을 줘야함
ORDER BY DEPTNO, JOB;


--where, having 둘 다 쓰기
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
 WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;


--기존 group by만 쓰기
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;


--GROUP BY ROLLUP. 그룹화된 데이터의 합계도 표시
SELECT DEPTNO, JOB, 
       COUNT(*), MAX(SAL), 
       SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);


--GROUP BY CUBE. 명시한 모든 컬럼에 대한 그룹 합계를 표시
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;


--ROLLUP을 안에서
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
GROUP BY DEPTNO, ROLLUP(JOB);




--Q1
SELECT DEPTNO, TRUNC(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO;


--Q2
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;


--Q3
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;


--Q4
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM, COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');


--Q5
SELECT DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, COUNT(*) AS CNT,
        MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP (DEPTNO, TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY DEPTNO;