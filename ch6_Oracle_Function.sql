SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL
WHERE SYSDATE = '23/05/03';

DESC DUAL;


SELECT *    --SUBSTR (ENAME, 1, 2)
FROM EMP;


SELECT JOB, LENGTH(JOB), SUBSTR (JOB, 2,3)
FROM EMP;


SELECT RTRIM('_ _ORACLE_ _')
FROM DUAL;


SELECT ROUND(1)
FROM DUAL;


SELECT TO_CHAR(HIREDATE, 'YYYY-MM-DD') AS 입사일
FROM EMP;


--날짜 포맷 변경
SELECT SYSDATE,
TO_CHAR(SYSDATE, 'MM') AS 입사일,
TO_CHAR(SYSDATE, 'MON') AS 입사일,
TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS 입사일
FROM DUAL;


--숫자 천단위, 소수자리 표시
SELECT SAL,
TO_CHAR(SAL, '$999,999') AS SAL_$,
TO_CHAR(SAL, 'L999,999') AS SAL_L,
TO_CHAR(SAL, '999,999.00') AS SAL_1,
TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
TO_CHAR(SAL, '000999999.99') AS SAL_3,
TO_CHAR(SAL, '999,999,00') AS SAL_4

FROM EMP;



SELECT * FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YY/MM/DD'); --입사일이 1981/06/01 데이터


--널값 처리
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
        NVL(COMM,0),    --널 값에 0 대입
        SAL+NVL(COMM,0)
FROM EMP;


SELECT EMPNO, ENAME, SAL, COMM,
        NVL2(COMM, 'O', 'X'),    --(널이 아닐 경우, 널일 경우)
        NVL2(COMM, SAL*12, SAL*12+COMM)
FROM EMP;



SELECT EMPNO, ENAME, JOB, SAL, 
    CASE JOB
        WHEN 'MGR' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.5
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03  --연봉 인상
    END AS UPSAL
     
FROM EMP;


--Q1 EMPNO 열에는 EMP 테이블에서 사원 이름이 다섯글자 이상이며 여섯글자 미만인 사원 정보를 출력, MASKING_EMPNO 열에는 사원번호 앞 두자리 외 뒷자리를 * 로 출력,
-- 그리고 MASKING_ENAME 열에는 사원 이름의 첫 글자만 보여주고 나머지 글자 수만큼 * 로 출력해라
SELECT EMPNO,
        CONCAT(SUBSTR(EMPNO, 1,2), '**') AS MASKING_EMPNO,
        ENAME,
        CONCAT(SUBSTR(ENAME, 1,1), '****') AS MASKING_ENAME
        
FROM EMP
WHERE LENGTH(ENAME) = 5;


--Q2 EMP 테이블에서 사원들의 월 평균 근무일 수는 21.5일이다. 하루 근무 시간을 8시간으로 보았을 때 하루 급여와 시급을 계산하여 출력해라. 
-- 단 하루 급여는 소수점 세번째 자리에서 버리고, 시급은 두번째 소수점에서 반올림해라
SELECT EMPNO,
        ENAME,
        SAL,
        TRUNC((SAL/21.5), 2) AS DAY_PAY,
        ROUND(SAL/21.5/8, 1) AS TIME_PAY
        
FROM EMP;


--Q3 EMP 테이블에서 사원들은 입사일 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 정직원이 되는 날짜를 YYYY-MM-DD 형식으로 출력해라. 단 추가수당이 없는 사원의 추가수당은 N/A로 출력
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY/MM/DD') AS HIREDATE, 
        TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월'), 'YYYY-MM-DD') AS R_JOB, NVL2(COMM, '0', 'N/A') AS COMM
FROM EMP
;
