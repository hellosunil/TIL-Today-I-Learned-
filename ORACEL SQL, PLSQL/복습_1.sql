
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