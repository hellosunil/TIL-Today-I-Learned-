
-- DISTINCT

SELECT DISTINCT DEPTNO
    FROM EMP;

SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
-- (JOB, DEPTNO) 결합이 중복인지 판단


-- 별칭 사용
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;
-- 이 때 COMM이 NULL이면 ANNSAL값도 NULL로 표기됨

-- 순서 정렬
SELECT *
    FROM EMP
   ORDER BY DEPTNO ASC, SAL DESC;
   
-- WHERE 문 : 조건식 활용
SELECT *
    FROM EMP
   WHERE DEPTNO = 30
         AND JOB = 'SALESMAN';
         
-- IN 연산자
SELECT *
    FROM EMP
   WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
   
-- BETWEEN 연산자
SELECT *
    FROM EMP
   WHERE SAL BETWEEN 2000 AND 3000;
   
-- LIKE 연산자 : 일부 문자열이 포함된 데이터를 조회
-- _ : 한개의 문자 데이터, % : 모든 문자(공백 포함) 데이터

SELECT *
    FROM EMP
   WHERE ENAME LIKE '_L%'; -- 두번째 문자가 L인 사원 정보 출력

SELECT *
    FROM EMP
   WHERE ENAME LIKE '%AM%'; -- AM이 들어가는 사원 정보 출력

-- ESCAPE   
SELECT *
    FROM EMP
   WHERE ENAME LIKE 'A\_A%' ESCAPE '\'; -- '_'가 문자인 경우 'A_A'로 시작되는 사원출력

-- NULL값을 가진 행 출력하기
SELECT *
    FROM EMP
   WHERE COMM IS NULL;
   
SELECT *
    FROM EMP
   WHERE SAL > NULL -- 작동 안 함
   AND COMM IS NULL;
   
-- 집합연산자(UNION) 사용하기 : 출력 열의 개수와 자료형이 같아야 함
-- 집합 연산자의 종류 및 기능
-- UNION : 합집합 // 중복값은 제거됨
-- UNION ALL : 합집합 // 중복값도 중복 표시
-- MINUS : 차집합
-- INTERSECT : 교집합

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
   WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
    FROM EMP
   WHERE DEPTNO = 20; -- 열의 이름은 첫번째 집합을 따름

-- PRACTICE
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
   WHERE DEPTNO = 30
   AND JOB = 'SALESMAN';
   
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
   WHERE DEPTNO IN (20, 30)
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
   WHERE DEPTNO = 30
   AND SAL > 2000;
   
SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
   WHERE ENAME LIKE '%E%'
   AND DEPTNO = 30
   AND SAL NOT BETWEEN 1000 AND 2000;

SELECT *
    FROM EMP
   WHERE COMM IS NULL
   AND MGR IS NOT NULL
   AND JOB IN ('MANAGER', 'CLERK')
   AND ENAME NOT LIKE '_L';
   
-- 문자열 변환 함수
-- UPEER(문자열) : 문자열 모두를 대문자로 변환
-- LOWER(문자열) : 문자열 모두를 소문자로 변환
-- INITCAP(문자열) : 첫글자는 대문자로, 나머지는 소문자로 변환

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
-- 문자열 데이터는 대소문자를 구분함으로 문자열 데이터 검색시 이용

SELECT *
    FROM EMP
   WHERE UPPER(ENAME) = 'SCOTT';
   
-- LENGTH
SELECT ENAME, LENGTH(ENAME)
    FROM EMP
   WHERE LENGTH(ENAME) >= 5;
   
-- SUBSTR(문자열 데이터, 시작 위치, 추출 길이)
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3)
    FROM EMP;
    
SELECT JOB, SUBSTR(JOB, -1), SUBSTR(JOB, LENGTH(JOB)-1)
    FROM EMP;
    
-- INSTR : 특정 문자가 속해있는 행 구하기
SELECT *
    FROM EMP
   WHERE INSTR(ENAME, 'S') > 0; -- 이 처럼 활용가능

SELECT *
    FROM EMP
   WHERE ENAME LIKE '%S%'; -- 위와 같은 결과
   
-- REPLACE
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2
    FROM DUAL;
    
-- LPAD, RPAD
SELECT 'Oracle',
    LPAD('Oracle', 10, '#') AS LPAD_1,
    RPAD('Oracle', 10, '*') AS RPAD_1,
    LPAD('Oracle', 10) AS LAPD_2, -- 문자열 지정 안할시, 공백으로 처리함
    RPAD('Oracle', 10) AS RPAD_2
    FROM DUAL;
    
-- CONCAT, || : 문자열 합치기
SELECT CONCAT(EMPNO, ENAME)
    FROM EMP
   WHERE ENAME = 'SCOTT';

SELECT EMPNO || ENAME, EMPNO || ':' || ENAME
    FROM EMP
   WHERE ENAME = 'SCOTT';
   
-- TRIM(삭제 옵션(선택)'삭제할 문자열' FROM '원본 문자열 데이터') : 하나의 문자열만 적용가능
SELECT TRIM('O' FROM 'ORACLE') AS TRIM,
       TRIM(LEADING 'O' FROM 'ORACLE') AS TRIM_LEADING,
       TRIM(TRAILING 'E' FROM 'ORACLE') AS TRIM_TRAILING,
       TRIM(BOTH 'O' FROM 'ORACLEO') AS TRIM_BOTH
    FROM DUAL;
    
-- LTRIM, RTRIM -> 여러 문자열이 가질 수 있는 모든 조합을 삭제
SELECT LTRIM('ORACLE', 'RO') AS LTRIM,
       RTRIM('ORACLE', 'ELCROA') AS RTRIM
    FROM DUAL;
-- TRIM과 LTRIM/RTRIM과 사용 문법이 달라 주의 요망!!!

-- 숫자 함수

-- ROUND : 반올림
-- TRUNC : 버림
-- CEIL : 지정한 숫자보다 큰 정수 중 가장 작은 정수를 반환
-- FLOOR : 지정한 숫자보다 작은 정수 중 가장 큰 수를 반환
-- MOD : 나머지 값을 반환

SELECT ROUND(1234.5678) AS ROUND,   --정수반환
    ROUND(1234.5678, 0) AS ROUND_0, --정수반환
    ROUND(1234.5678, 2) AS ROUND_2, --둘째 자리까지 표기
    ROUND(1234.5678, -2) AS ROUND_MINUS2    --자연수 둘째 자리에서 반올림
    FROM DUAL;
    
SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 2) AS TRUNC_2, -- 둘째짜리까지 표기
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1, -- 자연수 첫째짜리에서 버림
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2 -- 자연수 둘째자리에서 버림
    FROM DUAL;
    
SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
    FROM DUAL;
    
SELECT MOD(15, 6),
       MOD(10, 2),
       MOD(11, 2)
    FROM DUAL;    

-- DATE형
--DATE +- NUMBER : 숫자 일수 이후/이전의 DATE
--DATE - DATE : 두 DATE 간의 일수 차이
--DATE + DATE : 연산 불가!!

SELECT SYSDATE AS NOW,
       SYSDATE - 1 AS YESTERDAY,
       SYSDATE + 1 AS TOMORROW
    FROM DUAL;
    
-- ADD_MONTHS
SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE,
       ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;

-- 입사 32년 이상인 사원 정보 추출
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
   WHERE ADD_MONTHS(HIREDATE, 384) <= SYSDATE;
   
-- MONTHS_BETWEEN
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS_BETWEEN1
    FROM EMP;
    
-- NEXT_DAY(돌아오는 요일), LAST_DAY(달의 마지막 날짜)

SELECT SYSDATE,
       TO_CHAR(NEXT_DAY(SYSDATE, '월요일'), 'YYYY-MM-DD'),
       LAST_DAY(SYSDATE)
    FROM DUAL;
    
-- TO_CHAR : 문자형 변환
-- TO_NUMBER : 숫자형 변환
-- TO_DATE : 날짜형 변환

SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON') AS MON,
       TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
       TO_CHAR(SYSDATE, 'DD') AS DD, -- 날짜!!
       TO_CHAR(SYSDATE, 'DY') AS DY, -- 요일!!
       TO_CHAR(SYSDATE, 'DAY') AS DAY -- DAY는 일자가 아니라 요일!!!!
    FROM DUAL;
    
--특정 언어로 출력하기
-- 'NLS_DATE_LANGUAGE = KOREAN'
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
    FROM DUAL;

--숫자 데이터에 형식 지정하기
SELECT SAL,
       TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L, -- LOCAL : 원화 표시
       TO_CHAR(SAL, '999,999.00') AS SAL_1, -- 소수점 두자리까지 표시
       TO_CHAR(SAL, '000,999,999.00') AS SAL_2, -- 9는 없으면 공백, 0은 0으로 채움!
    FROM EMP;
    
-- 문자 데이터를 날짜 데이터로 변환하기
SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
       TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2 -- PANDAS와 다름!!
    FROM DUAL; -- 현재 FORMAT지정이 아니라, 바뀔 FORMAT을 지정!!!!
    
-- 1981년 6월 1일 이후 입사한 사원정보 추출
SELECT *
    FROM EMP
   WHERE HIREDATE > TO_DATE('19810601');
   
-- NULL 처리 함수 (NVL : NULL일시 바꿈, NVL2 : NULL아닐시 AND NULL일시 바꿈)
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
       NVL(COMM, 0),
       SAL+NVL(COMM, 0)
    FROM EMP;
SELECT EMPNO, ENAME, COMM,
       NVL2(COMM, 'O', 'X'),
       NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
    FROM EMP;
    -- NVAL2(변수, NULL아닐때, NULL일때)!!! 순서 생각
    
-- PRACTICE
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
    FROM EMP
   WHERE LENGTH(ENAME) >= 5
     AND LENGTH(ENAME) < 6;
     
SELECT EMPNO, ENAME, SAL,
       TRUNC(SAL / 21.5, 2) AS DAY_PAY,
       ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
    FROM EMP;
    
SELECT EMPNO, ENAME, MGR,
     CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN MGR LIKE '75%' THEN '5555'
        WHEN MGR LIKE '76%' THEN '6666'
        ELSE 'MGR'
        END AS CHG_MGR
    FROM EMP;
    
-- SUM : 합계
-- COUNT : 개수
-- MAX : 최대
-- MIN : 최소
-- AVG : 평균

SELECT SUM(DISTINCT SAL),
       SUM(ALL SAL),
       SUM(SAL)
    FROM EMP;

SELECT SUM(SAL), SUM(COMM) -- NULL값이 존재해도 SUM()은 작동
    FROM EMP;

SELECT COUNT(*)
    FROM EMP;
    
-- 부서번호가 30인 직원수
SELECT COUNT(*)
    FROM EMP
   WHERE DEPTNO = 30; -- COUNT()는 NULL값은 카운트하지 않음!!!
   
-- MAX, MIN = 날짜에 사용시 MAX가 제일 최근, MIN이 제일 예전
SELECT MAX(HIREDATE)
    FROM EMP
   WHERE DEPTNO = 20;
   
-- GROUP BY 절
SELECT AVG(SAL), DEPTNO
    FROM EMP
   GROUP BY DEPTNO; -- GROUP BY 절에는 별칭 지정이 불가능!
   
-- 별칭 지정을 위해선 하나씩 추출 후 UNION해줘야 함
SELECT AVG(SAL), '10DEPT' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT AVG(SAL), '20DEPT' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION
SELECT AVG(SAL), '30DEPT' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

-- GROUP BY 절에 조건 주기(HAVING 절)
-- 평균 급여가 2000 이상인 그룹의 직책별 평균 급여 구하기

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE AVG(SAL) >= 2000
  GROUP BY DEPTNO, JOB
  ORDER BY DEPTNO, JOB; -- 오류 발생

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2500
   ORDER BY DEPTNO, JOB;
   
-- WHERE을 쓰려면
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE SAL >= 2500
  GROUP BY DEPTNO, JOB
  ORDER BY DEPTNO, JOB;
  
-- GROUP BY 심화 함수 ROLLUP, CUBE 함수
-- ROLLUP(A, B, C) => N+1개의 결과
-- 1. A 그룹별 B 그룹별, C 그룹에 해당하는 결과
-- 2. A 그룹별 B 그룹에 해당하는 결과
-- 3. A 그룹에 해당하는 결과
-- 4. 전체 결과

-- CUBE(A, B, C) => 2^N 개의 결과
-- 1. A 그룹별 B 그룹별, C 그룹에 해당하는 결과
-- 2. A 그룹별 B 그룹에 해당하는 결과
-- 3. B 그룹별 C 그룹에 해당하는 결과
-- 4. A 그룹별 C 그룹에 해당하는 결과
-- 5. A 그룹결과
-- 6. B 그룹결과
-- 7. C 그룹결과
-- 8. 전체 결과

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
   GROUP BY ROLLUP(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;
   
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
   GROUP BY CUBE(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;
   
-- 먼저 부서별로 그룹화한 후, ROLLUP/CUBE 사용 가능

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, ROLLUP(JOB)
   ORDER BY DEPTNO, JOB;

-- GOUPING SETS : 지정한 모든 열을 각각 대그룹으로 처리하여 출력하기
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY GROUPING SETS(DEPTNO, JOB) --DEPT별 SAL, JOB별 SAL이 출력
   ORDER BY DEPTNO, JOB;
   
-- LISTAGG 함수 : 그릅에 속해있는 데이터를 가로로 나열
SELECT ENAME
    FROM EMP
   WHERE DEPTNO = 10;
   
SELECT DEPTNO, 
       LISTAGG(ENAME, ', ')
       WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES -- 정렬 기준 설정
    FROM EMP
   GROUP BY DEPTNO;
   
-- PIVOT : 기존 테이블 행을 열로 바꿈
-- UNPIVOT : 기존 테이블 열을 행으로 바꿈

-- 직책별, 부서별 최고 급여를 2차원 표 형태로 출력
SELECT *
    FROM (SELECT DEPTNO, JOB, SAL
            FROM EMP)
   PIVOT(MAX(SAL) -- 실제 출력될 데이터)
        FOR DEPTNO IN (10, 20, 30) -- FOR 가로줄로 표기할 열, IN 출력하려는 열
        )
   ORDER BY JOB; -- 세로 행 정렬 기준
-- PIVOT에 들어가는 값들이 가로줄에 할당, 아닌 값들은 자동적으로 세로줄로 할당되는 개념!!!

SELECT *
    FROM(SELECT JOB, DEPTNO, SAL
         FROM EMP)
   PIVOT(MAX(SAL)
        FOR JOB IN ('CLERK' AS CLERK,
                    'SALESMAN' AS SALESMAN,
                    'PRESIDENT' AS PRESIDENT,
                    'MANAGER' AS MANAGER,
                    'ANALYST' AS ANALYST)
        )
   ORDER BY DEPTNO;
   
-- PIVOT(출력될 데이터 FOR 가로 IN 세부) 나머지 : 세로


-- PRACTICE
SELECT DEPTNO,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
    FROM EMP
   GROUP BY DEPTNO
   ORDER BY DEPTNO DESC;
   
SELECT JOB, COUNT(*)
    FROM EMP
   GROUP BY JOB
  HAVING COUNT(*) >= 3;

SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       DEPTNO,
       COUNT(*) AS CNT
    FROM EMP
   GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
   
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
       COUNT(*) AS CNT
    FROM EMP
   GROUP BY NVL2(COMM, 'O', 'X');
   
SELECT DEPTNO,
       TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       COUNT(*) AS CNT,
       MAX(SAL) AS MAX_SAL
    FROM EMP
   GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));
   
-- JOIN 함수 (여러 테이블을 하나로 합치기)
-- UNION : 두 개 이상의 SELECT문을 세로로 연결
-- JOIN : 두 개 이상의 SELECT문을 가로로 연결

SELECT *
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
  ORDER BY EMPNO;
  
-- WHERE 절에 조건식 추가하여 출력하기

SELECT E.EMPNO, E.ENAME, 
       D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
     AND SAL >= 3000
  ORDER BY D.DEPTNO, E.EMPNO;
  
-- 비등가 조인
SELECT *
    FROM EMP E, SALGRADE S
   WHERE E.SAL BETWEEN S.LOSAL AND HISAL;
   
-- 자체조인
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
   WHERE E1.MGR = E2.EMPNO;

-- 등가 조인 JOIN ~ ON(조건) > 기준 열을 명시해주는 등가 조인
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       E.DEPTNO,
       D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO) -- JOIN함수는 FROM절에 쓴다는 것!!
   WHERE SAL <= 3000
  ORDER BY DEPTNO, E.EMPNO; -- 많은 방식이 있지만, JOIN ~ ON(조건)을 가장 많이 씀
  
-- 외부 조인 : 위 테이블은 KING데이터 누락 : KING은 상급자가 없으므로
-- 하지만, 상급자 값이 NULL이어도 출력해야 할 때가 있음

-- 왼쪽 외부조인 사용하기 : 왼쪽 열을 기준으로 오른쪽 열의 데이터 존재여부에 상관없이 출력
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY E1.EMPNO;

-- 오른쪽 외부조인 사용하기 : 오른쪽 열을 기준으로 왼쪽 열의 데이터 존재여부에 상관없이 출력
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY E1.EMPNO;

-- 즉, 부하직원이 없는 사원들도 출력됨

-- 전체 외부조인
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY E1.EMPNO;
   
-- 3개 이상의 테이블 조인하기
--FROM TABLE1 JOIN TABLE2 ON (조건식)
--JOIN TABLE3 ON (조건식)
--그냥 옆에 또다른 조건식을 나열해주면 됨!

-- PRACTICE
SELECT E.DEPTNO, D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   GROUP BY E.DEPTNO, D.DNAME
   ORDER BY E.DEPTNO;
   
SELECT D.DEPTNO, D.DNAME, 
       E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   ORDER BY D.DEPTNO, E.ENAME;
   
SELECT D.DEPTNO, D.DNAME,
       E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO, -- 중복되면 자동으로 _1로 바뀜
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
    FROM EMP E RIGHT OUTER JOIN DEPT D
                  ON (E.DEPTNO = D.DEPTNO)
                LEFT OUTER JOIN SALGRADE S
                  ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
                LEFT OUTER JOIN EMP E2
                  ON (E.MGR = E2. EMPNO)
   ORDER BY D.DEPTNO, E.EMPNO;
   
-- 서브쿼리 JONES보다 급여가 높은 사원을 조회
SELECT *
    FROM EMP
   WHERE SAL > (SELECT SAL
                    FROM EMP
                   WHERE ENAME = 'JONES')
   ORDER BY SAL;
   
-- 서브쿼리에서는 몇몇 경우를 제외하고는 ORDER BY절을 사용할 수 없음!
-- 서브쿼리의 SELECT문에서는 메인쿼리의 SELECT저과 같은 자료형과 같은 개수로 지정해야 함

-- 단일행 서브쿼리 : 서브쿼리에서 출력되는 겨로가가 하나인 경우
-- JONES가 여러 명이라면 단일행 서브쿼리로 구현 못함
-- 다중행 서브쿼리를 사용해야함
-- 단일행 서브쿼리는 주로 비교연산자가 있음

-- 서브쿼리 안에서 함수 사용
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL,
       D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   WHERE E.DEPTNO = 20
     AND E.SAL > (SELECT AVG(SAL)
                    FROM EMP);
                    
-- IN 연산자와 함께 서브쿼리 사용하기 : 각 부서별 최고 급여를 받는 사원 정보
SELECT *
    FROM EMP
   WHERE SAL IN (SELECT MAX(SAL)
                    FROM EMP
                   GROUP BY DEPTNO);
                   
-- ANY, ALL 연산자
-- ANY 하나라도 만족하면 출력
-- ALL 모두가 만족해야 출력

SELECT *
    FROM EMP
   WHERE SAL > ANY (SELECT SAL
                        FROM EMP
                       WHERE DEPTNO =30);
-- 30번 부서의 SAL 중 어느 한 값보다 크면 출력
-- 30번 부서의 최소 급여보다 많은 급여를 받는 사원 정보 출력

SELECT *
    FROM EMP
   WHERE SAL > ALL (SELECT SAL
                        FROM EMP
                       WHERE DEPTNO = 30);
-- 30번 부서의 SAL 모두보다 크면 출력
-- 30번 부서의 최대 급여보다 많은 급여를 받는 사원 정보 출력

-- EXISTS 연산자 : 서브쿼리 결과값이 하나 이상 존재하면 조건식 모두 TRUE, 없으면 FALSE
SELECT *
    FROM EMP
   WHERE EXISTS (SELECT DNAME
                    FROM DEPT
                   WHERE DEPTNO = 10);
-- 10번부서가 존재하므로 모든 행 출력 ==> 거의 사용되지 않음

-- 다중열 서브쿼리 : 비교 값이 여러 개 일 때
SELECT *
    FROM EMP
   WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                            FROM EMP
                           GROUP BY DEPTNO);
-- DEPTNO이 같고, MAX(SAL)과도 같은 사원정보 추출

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
         (SELECT * FROM DEPT) D
   WHERE E10.DEPTNO = D.DEPTNO;
-- 먼저 특정 테이블을 선택한 후 SELECT하는 기법
-- 테이블 내 데이터 규모가 너무 크거나, 현재 작업에 불필요한 열이 너무 많을 때 사용
-- 가독성이 떨어질 염려가 있을 때 WITH절을 사용 (인라인 뷰)

WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO,
       D.DNAME, D.LOC
    FROM E10, D
   WHERE E10.DEPTNO = D.DEPTNO;
   
-- SELECT 절에서 사용하는 서브쿼리(스칼라 서브쿼리)
-- 스칼라 서브쿼리 = 하나의 새로운 열로 추가되는 원리
-- 하나의 결과만 반환되도록 작성해야 함!(열로 추가되므로)

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL,
       (SELECT GRADE
            FROM SALGRADE
           WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
       DEPTNO,
       (SELECT DNAME
            FROM DEPT
           WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
    FROM EMP E;
    
-- PRACTICE
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL,
       D.DEPTNO, D.DNAME
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   WHERE E.JOB = (SELECT JOB
                    FROM EMP
                   WHERE ENAME = 'ALLEN');

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
    FROM EMP E JOIN DEPT D
               ON (E.DEPTNO = D.DEPTNO)
               JOIN SALGRADE S
               ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
   WHERE SAL > (SELECT AVG(SAL)
                    FROM EMP)
  ORDER BY SAL DESC, EMPNO;
  
SELECT E.EMPNO, E.ENAME, E.JOB,
       D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   WHERE E.DEPTNO = 10
   AND E.JOB NOT IN (SELECT JOB
                        FROM EMP
                       WHERE DEPTNO = 30);
                       
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
    FROM EMP E JOIN SALGRADE S 
                 ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
   WHERE SAL > (SELECT MAX(SAL)
                    FROM EMP
                   WHERE JOB = 'SALESMAN')
  ORDER BY EMPNO;
  
  